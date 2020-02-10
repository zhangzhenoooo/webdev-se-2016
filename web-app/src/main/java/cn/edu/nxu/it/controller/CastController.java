package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.NeedAdmin;
import cn.edu.nxu.it.model.Cast;
import cn.edu.nxu.it.model.Movie;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IORuntimeException;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.util.List;

public class CastController extends Controller {
    private static final Log log = Log.getLog(CastController.class);

    @Before(NeedAdmin.class)
    public void list() {
        int p = getParaToInt("p", 1);
        Page<Cast> page = Cast.dao.paginate(p, 5,
                "SELECT *", "FROM t_cast WHERE deleted=0");
        setAttr("page", page);
        renderFreeMarker("list.ftl");
    }

    //提供表格的JSON格式的数据
    public void data() {
        int p = getParaToInt("p", 1);
        int limit = getParaToInt("limit", 5);
        Page<Cast> page = Cast.dao.paginate(p, limit,
                "SELECT *", "FROM t_cast WHERE deleted=0");
        List<Cast> casts = page.getList();
        Kv result = Kv.create();
        result.set("code", 0);
        result.set("msg", "成功");
        result.set("count", page.getTotalRow());
        result.set("data", casts);
        renderJson(result);

    }

//    public void datagrid(){
//        renderFreeMarker("datagrid.ftl");
//    }


    public void page() {
        int p = getParaToInt("p", 1);
        Page<Cast> page = Cast.dao.paginate(p, 5, "select *", "from t_cast");
        setAttr("page", page);
        renderFreeMarker("page.ftl");
    }

    //用于显示影人添加表单的页面
    @Before(NeedAdmin.class)
    public void add() {
        renderFreeMarker("add.ftl");
    }

    //执行保存影人信息操作
    @Before(NeedAdmin.class)
    public void save() {
        Cast cast = getModel(Cast.class, "", true);
        boolean success = false;
        Kv result = Kv.create();
        try {
            cast.save();
            success = true;
        } catch (ActiveRecordException e) {
            log.error("影人信息添加失败，原因是：" + e.getMessage());
        }
        result.set("success", success);
        result.set("message", success ? "影人添加成功" : "影人添加失败");
        renderJson(result);
    }

    @Before(NeedAdmin.class)
    public void edit() {
        Integer id = getParaToInt("id", 1);
        Cast cast = Cast.dao.findById(id);
        if (cast == null) {
            renderError(404);
            return;
        }
        setAttr("cast", cast);
        renderFreeMarker("edit.ftl");
    }

    @Before(NeedAdmin.class)
    public void update() {
        Cast cast = getModel(Cast.class, "", true);
        boolean success = false;
        Kv result = Kv.create();
        try {
            cast.update();
            success = true;
        } catch (ActiveRecordException e) {
            log.error("影人信息更新失败，原因是：" + e.getMessage());
        }
        result.set("success", success);
        result.set("message", success ? "影人更新成功" : "影人更新失败");
        renderJson(result);
    }

    @Before(NeedAdmin.class)
    public void delete() {
        Integer id = getParaToInt("id");
//        Cast.dao.deleteById(id); 删除数据库中的记录，存在级联问题
        // 软删除
//        Cast cast = new Cast();
//        cast.setId(id);
//        cast.setDeleted(false);
//        cast.update(); // -->update t_cast set deleted=0  where id = xxx

        String sql = "UPDATE t_cast SET deleted = 1 where id = ?";
        boolean success = false;
        Kv result = Kv.create();
        try {
            Db.update(sql, id);
            success = true;
        } catch (ActiveRecordException e) {
            log.error("删除影人失败，原因是：" + e.getMessage());
        }
        result.set("success", success);
        result.set("message", success ? "影人删除成功" : "影人删除失败");
        renderJson(result);
    }

    //   /cast/avatarUpload  --> /cast/avatar/upload
    @Before(NeedAdmin.class)
    @ActionKey("/cast/avatar/upload")
    public void avatarUpload() {
        try {
            UploadFile uploadFile = getFile();
            Integer id = getParaToInt("id");
            File file = uploadFile.getFile();
            String ext = FileUtil.extName(file);
            String uploadPath = uploadFile.getUploadPath();
            String destPath = uploadPath + "/avatar/cast-" + id + "," + ext;
            FileUtil.move(file, new File(destPath), true);
            Cast cast = new Cast();
            cast.setId(id);
            cast.setAvatar("cast-" + id + "." + ext);
            cast.update();
        } catch (IORuntimeException | ActiveRecordException e) {
            e.printStackTrace();
        }
    }

    public void view() {
        Integer id = getParaToInt(0, 0);
        Cast cast = Cast.dao.findById(id);
        if (cast == null) {
            renderError(404);
            return;
        }
        setAttr("cast", cast);
        String JoinMovieSql = "SELECT * FROM t_movie WHERE id IN (SELECT movie_id FROM t_movie_cast WHERE cast_id = ? )";
        List<Movie> joinMovies = Movie.dao.find(JoinMovieSql, id);
        setAttr("joinMovies", joinMovies);
        renderFreeMarker("view.ftl");
    }

}
