package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.Enum.TestTypeEnum;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.service.CommentService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;


public class UserController  extends Controller {


    /**
     *
     * @description  学生选课
     * @author zhangz
     * @date 2020:02:19 13:02:53
     * @return null
     **/
    @Before(NeedLogin.class)
    public void selectCourse(){
        User user = (User) getSession().getAttribute("user");
        Page<Course> paginate = Course.dao.paginate(1, 10, "SELECT *", "FROM t_course WHERE IS_DELETE IS NULL");
        set("paginate",paginate);
        List<UserClass> selectedUserClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE USERID =?", user.getUSERID());
        set("selectedUserClasses",selectedUserClasses);
        renderFreeMarker("selection_course.ftl");
    }

    /**
     *
     * @description  选课
     * @author zhangz
     * @date 2020:02:19 13:49:12
     * @return null
     **/
    @Before(NeedLogin.class)
    public  void doSelect(){
        Integer courseId = getInt("id");
        System.out.println("courseId = =================="+courseId);
        User user = (User) getSession().getAttribute("user");
        Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",courseId);
        if (course == null){
            set("message","该课程已经不见啦");
            Page<Course> paginate = Course.dao.paginate(1, 10, "SELECT *", "FROM t_course WHERE IS_DELETE IS NULL");
            set("paginate",paginate);
            List<UserClass> selectedUserClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE USERID =?", user.getUSERID());
            set("selectedUserClasses",selectedUserClasses);
            renderFreeMarker("selection_course.ftl");
            return;
        }
        List<UserClass> dbUserClass = UserClass.dao.find("SELECT * FROM t_user_class WHERE USERID = ? AND CLASSID = ?",user.getUSERID(),course.getCLASSID());
        if (dbUserClass.size() > 0){
            Page<Course> paginate = Course.dao.paginate(1, 10, "SELECT *", "FROM t_course WHERE IS_DELETE IS NULL");
            set("paginate",paginate);
            set("message","你已经选过该课程了");
            List<UserClass> selectedUserClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE USERID =?", user.getUSERID());
            set("selectedUserClasses",selectedUserClasses);
            renderFreeMarker("selection_course.ftl");
            return;
        }else {
            UserClass userClass = new UserClass();
            userClass.setCLASSID(courseId);
            userClass.setCLASSNAME(course.getTITLE());
            userClass.setUSERID(user.getUSERID());
            userClass.setUSERNAME(user.getNAME());
            userClass.setGmtCreated(System.currentTimeMillis());
            boolean result = userClass.save();
            if (result){
                Page<Course> paginate = Course.dao.paginate(1, 10, "SELECT *", "FROM t_course WHERE IS_DELETE IS NULL");
                set("paginate",paginate);
                set("message","选课成功");
                List<UserClass> selectedUserClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE USERID =?", user.getUSERID());
                set("selectedUserClasses",selectedUserClasses);
                renderFreeMarker("selection_course.ftl");
                return;
            }
        }

    }



    /**
     *
     * @description  学生查看课程的详细信息
     * @author zhangz
     * @date 2020:02:19 13:46:25
     * @return null
     **/
    public void classMes(){
        Long courseId = getLong("id");
        Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",courseId);
        if (course == null){
            set("message","你点击的课程不见了");
            renderFreeMarker("class_mes.ftl");
            return;
        }
        User user = User.dao.findFirst("SELECT * FROM t_user WHERE USERID = ?",course.getCREATOR());
        List<Catalogue> catalogues = Catalogue.dao.find("SELECT * FROM t_catalogue WHERE CLASSID = ?",courseId);
        set("course",course);
        set("user",user);
        set("catalogues",catalogues);
        renderFreeMarker("class_mes.ftl");
    }

    /**
     * 进入我的课程界面
     */
    @Before(NeedLogin.class)
    public void myClass(){
        User user = (User) getSession().getAttribute("user");
        if (true){
            List<Course> courses = Course.dao.find("SELECT * FROM t_course  WHERE IS_DELETE is NULL AND CREATOR = ? ",user.getUSERID());
            setAttr("courses",courses);
        }
        renderFreeMarker("my_class.ftl");

    }

public void markRead(){
    Long notificationId = getLong("NOTIFICATIONID");
    User user = (User) getSession().getAttribute("user");
    Kv reslut = Kv.create();
    if (notificationId ==0){
        Db.delete("DELETE FROM   t_notification WHERE   RECEIVER =?",user.getUSERID());
        reslut.set("success",true);
    }else {
        Db.delete("DELETE FROM   t_notification WHERE RECEIVER  =? AND NOTIFICATIONID=?",user.getUSERID(),notificationId);
        reslut.set("success",true);
    }
    List<Notification> notifications = Notification.dao.find("SELECT * FROM t_notification WHERE RECEIVER = ?", user.getUSERID());
    reslut.set("count",notifications.size());
}


}

