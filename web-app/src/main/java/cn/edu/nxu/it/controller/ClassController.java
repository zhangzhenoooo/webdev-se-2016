package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.model.Catalogue;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.upload.UploadFile;

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
        UploadFile  file = getFile("catalogueUrl");
        Long courseID = getLong("classId");
        String title = get("catalogueTitle");
        Catalogue catalogue = new Catalogue();
        catalogue.setCLASSID(courseID);
        catalogue.setTITLE(title);
        List<Course>  dbCourses = Course.dao.find("SELECT * FROM t_course WHERE CLASSID = ?",courseID);
        Kv result = Kv.create();
        if (dbCourses.size() == 0){
            //课程信息未保存
            result.set("message","没有对应的课程信息，请先保存或者新建课程信息");
            result.set("success",false);
        }
        else {
            catalogue.setGmtCreated(System.currentTimeMillis());
            catalogue.setGmtModified(System.currentTimeMillis());
            boolean affectedRow = catalogue.save();
            if (affectedRow){
                result.set("message","添加成功");
                result.set("success",true);
            }else {
                result.set("message","添加失败");
                result.set("success",false);
            }
        }
        renderJson(result);

    }

    /**
     * 进入我的课程界面
     */
    public void myClass(){
        User user = (User) getSession().getAttribute("user");
        if (user != null){
            List<Course> courses = Course.dao.find("SELECT * FROM t_course WHERE CREATOR = ? ", user.getUSERID());
            setAttr("courses",courses);
        }
        renderFreeMarker("my_class.ftl");
    }


}
