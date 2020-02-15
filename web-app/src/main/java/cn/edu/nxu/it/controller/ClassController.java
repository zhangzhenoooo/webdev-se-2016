package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.MyClassDTO;
import cn.edu.nxu.it.model.Catalogue;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.sun.org.apache.xml.internal.resolver.Catalog;

import java.awt.*;
import java.security.PolicySpi;
import java.util.List;

/**
 * @author zhangz
 * @version 1.0
 * @date 2020/2/12 13:52
 */
public class ClassController extends Controller {

    public void publishClass(){
        renderFreeMarker("class_publish.ftl");
    }

    /**
     * 发布课程
     */
    public  void  doPublishClass(){
        Course course = getModel(Course.class);
        User user = (User) getSession().getAttribute("user");
//        System.out.println("user.userid ================= "+ user.getUSERID());
        course.setCREATOR(user.getUSERID());
        course.setGmtCreated(System.currentTimeMillis());
        course.setGmtModified(System.currentTimeMillis());
        set("course",course);
        boolean result =  course.save();
        if (result){
            setAttr("message","添加成功");
            renderFreeMarker("class_publish.ftl");
        }else {
            setAttr("message","添加失败");
            renderFreeMarker("class_publish.ftl");
        }

    }

    /**
     * 添加章节信息
     */
    public  void  addCatalogue(){
        UploadFile  file = getFile("catalogueUrl","class");
        Long courseID = getLong("classId");
        String title = get("catalogueTitle");
        Catalogue catalogue = new Catalogue();
        catalogue.setCLASSID(courseID);
        catalogue.setTITLE(title);
        List<Course>  dbCourses = Course.dao.find("SELECT * FROM t_course WHERE CLASSID = ?",courseID);
        Kv result = Kv.create();
        if (dbCourses.size() == 0){
            //课程信息未保存
           set("message","没有对应的课程信息，请先保存或者新建课程信息");
            set("success",false);
        }
        else {
            catalogue.setGmtCreated(System.currentTimeMillis());
            catalogue.setGmtModified(System.currentTimeMillis());
            boolean affectedRow = catalogue.save();
            if (affectedRow){
                set("message","添加成功");
               set("success",true);
            }else {
                set("message","添加失败");
                set("success",false);
            }
        }
        renderJson();

    }

    /**
     * 进入我的课程界面
     */
    public void myClass(){
        User user = (User) getSession().getAttribute("user");
        if (true){
            List<Course> courses = Course.dao.find("SELECT * FROM t_course  ");
            setAttr("courses",courses);
        }
        renderFreeMarker("my_class.ftl");

    }

    /**
     * 删除课程
     */
    public  void  delete(){
        Integer id = getInt("id");
        Course course = Course.dao.findById(31);
        course.setIsDelete(System.currentTimeMillis());
         course.update();
         myClass();
    }

    public  void  classMes() {
        Integer id = getInt("id");
        Course course = Course.dao.findById(id);
        String sql = "SELECT * FROM t_catalogue WHERE CLASSID = ? ORDER BY GMT_CREATED DESC";
        List<Catalogue> catalogues = Catalogue.dao.find(sql,course.getCLASSID());
        set("course", catalogues);
        set("catalogues", catalogues);
        renderFreeMarker("class_mes.ftl");
    }



}
