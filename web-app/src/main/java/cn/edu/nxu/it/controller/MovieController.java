package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.NeedAdmin;
import cn.edu.nxu.it.model.Movie;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.List;

public class MovieController extends Controller {


    public void page(){
        int p = getParaToInt("p",1);
        Page<Movie> page = Movie.dao.paginate(p, 5,
                "SELECT *", "FROM t_movie");
        setAttr("page",page);
        renderFreeMarker("page.ftl");
    }

//    {
//        "status": 0,
//            "message": "",
//            "total": 180,
//            "data": {
//        "item": [{}, {}]
//    }
//    }
    //提供表格的JSON格式的数据
    public void data(){
        int p = getParaToInt("p",1);
        int limit = getParaToInt("limit",5);
        Page<Movie> page = Movie.dao.paginate(p, limit,
                "SELECT *", "FROM t_movie");
        List<Movie> movies = page.getList();
        Kv result = Kv.create();
        result.set("code",0);
        result.set("msg","成功");
        result.set("count",page.getTotalRow());
        result.set("data",movies);
        renderJson(result);
    }

    //显示动态表格
    public void list(){
        renderFreeMarker("list.ftl");
    }

    //编辑电影
    @Before(NeedAdmin.class)
    public void edit(){
        Integer id = getParaToInt("id",1);
        Movie movie = Movie.dao.findById(id);
        setAttr("movie",movie);
        renderFreeMarker("edit.ftl");
    }

    //
    @Before(NeedAdmin.class)
    public void update(){
        Movie movie = getModel(Movie.class, "", true);
        try {
            //执行UPFATE操作，把结果提交到数据库
        movie.update();
        }catch (ActiveRecordException e){
            renderHtml("<h2>更新失败，原因：</h2>"+ e.getMessage());
            return;
        }
        renderHtml("<h2>更新成功</h2><br><a href='/movie/page'>返回电影信息列表</a>");
    }
    public void delete(){
        Integer id = getParaToInt("id", 1);
        try {
            Movie.dao.deleteById(id);
        }catch (Exception e){
            renderHtml("<h2>删除失败，原因：</h2>"+ e.getMessage());
            return;
        }
        renderHtml("<h2>删除成功</h2><br><a href='/movie/page'>返回电影信息列表</a>");
    }

    //添加电影页面
    @Before(NeedAdmin.class)
    public  void add(){
        renderFreeMarker("add.ftl");
    }

    //保存新电影信息
    @Before(NeedAdmin.class)
    public void save(){
        Movie movie = getModel(Movie.class, "", true);
        try{
            movie.save();
        }catch(ActiveRecordException e){
            renderHtml("<h2>保存失败，原因：</h2>"+ e.getMessage());
            return;
        }
        renderHtml("<h2>保存成功/h2><br><a href='/movie/page'>返回电影信息列表</a>");
    }

    //上传电影海报
    public void upload(){}

    //电影的分类显示
    public void tag(){
        //参数列表
        List paras = new ArrayList();
        String region = getPara("region", "");
        String sql = "SELECT * FROM t_movie WHERE 1=1";
        //地区参数不为空，添加筛选条件
        if(!region.isEmpty()){
            sql = sql + "  AND region= ?";
            paras.add(region );
        }

        Integer year = getParaToInt("year", 0);
        if(year!=0){
            sql = sql + "  AND year = ?";
            paras.add(year);
        }
        List<Movie> movies = Movie.dao.find(sql,paras.toArray(new Object[0]));
        setAttr("movies",movies);
        //电影的全部地区分组
        String allRegionSql = "SELECT region  FROM t_movie GROUP BY region";
        List<String> allRegions = Db.query(allRegionSql);

        //电影的全部年份分组
        String allYearsSql = "SELECT year FROM t_movie GROUP BY year";
        List<String> allYears = Db.query(allYearsSql);


        setAttr("allRegions",allRegions);
        setAttr("allYears",allYears);
        keepPara("year","region");
        renderFreeMarker("tag.ftl");
    }

    //显示具体的某一电影信息
public void view(){
    //获取第1个路径参数
    Integer id = getParaToInt(0,0);
    Movie movie = Movie.dao.findById(id);
    if(movie ==null){
        renderError(404);
        return;
    }
    setAttr("movie",movie);
    String  sql = "SELECT t_movie_cast.* , t_cast.chinese_name,t_cast.english_name ,t_cast.avatar_url, t_cast_role.name AS role_name" +
            " FROM t_movie_cast INNER JOIN t_cast ON t_movie_cast.cast_id = t_cast.id " +
            "INNER JOIN t_cast_role ON t_movie_cast.role_id = t_cast_role.id WHERE t_movie_cast.movie_id=?";
    List<Record> records = Db.find(sql,id);
    List<String> directors = new ArrayList<>();
    List<String> actors = new ArrayList<>();
    for (Record record : records) {
        String roleName = record.getStr("role_name");
        if ("导演".equals(roleName)){
            directors.add(record.getStr("chinese_name"));
        }else if ("演员".equals(roleName)){
            actors.add(record.getStr("chinese_name"));
        }
    }
    setAttr("directors",directors);
    setAttr("actors",actors);
    setAttr("casts",records);
    renderFreeMarker("view.ftl");
}
}

