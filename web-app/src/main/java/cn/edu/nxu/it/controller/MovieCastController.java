package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.NeedAdmin;
import cn.edu.nxu.it.model.Cast;
import cn.edu.nxu.it.model.Movie;
import cn.edu.nxu.it.model.MovieCast;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.ActiveRecordException;

import java.util.List;

public class MovieCastController extends Controller {
    //显示某部电影的演职员表
    public void list(){
        Integer movieId = getParaToInt("movieId", 0);
        setAttr("movieId",movieId);
        Movie movie = Movie.dao.findById(movieId);
        if(movie==null){
            renderHtml("<h2 style='color:red;'><指定的电影不存在！/h2>");
            return;
        }
        String  sql = "SELECT t_movie_cast.* , t_cast.chinese_name,t_cast.english_name ,t_cast.avatar_url, t_cast_role.name AS role_name" +
                " FROM t_movie_cast INNER JOIN t_cast ON t_movie_cast.cast_id = t_cast.id " +
                "INNER JOIN t_cast_role ON t_movie_cast.role_id = t_cast_role.id WHERE t_movie_cast.movie_id=?";
        List<MovieCast> movieCastList = MovieCast.dao.find(sql,movieId);
        setAttr("movie",movie);
        setAttr("movieCastList",movieCastList);
        renderFreeMarker("list.ftl");
    }
    @Before(NeedAdmin.class)
     public void add(){
         Integer movieId = getParaToInt("movieId");
         List<Cast> castList = Cast.dao.find("SELECT * FROM t_cast");
        setAttr("castList",castList);
        setAttr("movieId",movieId);
         renderFreeMarker("add.ftl");
     }
    @Before(NeedAdmin.class)
     public void save(){
         MovieCast movieCast = getModel(MovieCast.class, "", true);
         try {
             movieCast.save();
         }catch (ActiveRecordException e){
             renderHtml("<h2>保存失败！原因：</h2>"+ e.getMessage());
            return;
         }
            renderHtml("<h2>保存成功！</h2><br><a href=\"/movie/cast/list?movieId="+ movieCast.getMovieId()+"\">返回电影演职员列表</a>");

     }
    @Before(NeedAdmin.class)
     public void edit(){
         Integer id = getParaToInt("id");
         MovieCast movieCast = MovieCast.dao.findById(id);
         setAttr("movieCast",movieCast);
//
//         Integer castId = movieCast.getCastId();
//         Cast cast = Cast.dao.findById(castId);
//         setAttr("cast",cast);

//         Integer id = getParaToInt("id", -1);
//         MovieCast byId = MovieCast.dao.findById(id);
//         setAttr("byId", byId);
         renderFreeMarker("edit.ftl");

     }
    @Before(NeedAdmin.class)
     public void update(){
         MovieCast movieCast = getModel(MovieCast.class, "", true);
         try {
             movieCast.update();

         }catch (ActiveRecordException e){
             renderHtml("<h2>演职员更新失败！原因：</h2>"+ e.getMessage());
             return;
         }
         renderHtml("<h2>演职员更新成功！</h2><br><a href=\"/movie/cast/list？movieId="+ movieCast.getMovieId()+"\">返回电影演职员列表</a>");


     }
    @Before(NeedAdmin.class)
     public void delete(){
         MovieCast movieCast = getModel(MovieCast.class, "", true);
         Integer id = getParaToInt("id", -1);
         try {
             MovieCast.dao.deleteById(id);
         } catch (ActiveRecordException e) {
             renderHtml("<h2>删除失败</h2><br>" + "<a href=\"/movie/cast/list?id=" + movieCast.getMovieId() + "\">返回演职员表</a>");
             return;
         }
         renderHtml("<h2>删除成功</h2><br>" + "<a href=\"/movie/cast/list?id=" + movieCast.getMovieId() + "\">返回演职员表</a>");
     }


}
