package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.Enum.NotifyTypeEnum;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.service.CommentService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.upload.UploadFile;
import net.sf.ehcache.search.expression.Not;

import java.util.List;

/**
 * @author zhangz
 * @version 1.0
 * @date 2020/2/12 13:52
 */
public class ClassController extends Controller {
    CommentService commentService = new CommentService();

    @Before(NeedLogin.class)
    public void publishClass(){
        renderFreeMarker("class_publish.ftl");
    }

    /**
     * 发布课程
     */
    @Before(NeedLogin.class)
    public  void  doPublishClass(){
        Course course = getModel(Course.class);
        User user = (User) getSession().getAttribute("user");
//        System.out.println("user.userid ================= "+ user.getUSERID());
        course.setCREATOR(user.getUSERID());
        course.setGmtCreated(System.currentTimeMillis());
        course.setGmtModified(System.currentTimeMillis());
        set("course",course);
        String sql = "SELECT * FROM t_catalogue WHERE CLASSID = ?";
        List<Catalogue> catalogues = Catalogue.dao.find(sql,course.getCLASSID());
        set("catalogues",catalogues);
        boolean result =  course.save();
        if (result){
            setAttr("message","添加成功");
            redirect("/class/publishClass");
        }else {
            setAttr("message","添加失败");
            renderFreeMarker("class_publish.ftl");
        }

    }

    /**
     * 跳转到添加章节界面
     */
    public void  addcatalogue(){
        Integer courseId = getInt("id");
        Course course = Course.dao.findById(courseId);
        List<Catalogue> catalogues = Catalogue.dao.find("SELECT * FROM t_catalogue WHERE CLASSID = ?", courseId);
        set("course",course);
        set("catalogues",catalogues) ;
        renderFreeMarker("add_catalogue.ftl");

    }
    /**
     * 添加章节信息(发布课程界面)
     */
    public  void  addCatalogue(){
        UploadFile  file = getFile("catalogueUrl","/class");
        Long courseID = getLong("classId");
        String title = get("catalogueTitle");
        Catalogue catalogue = new Catalogue();
        catalogue.setCLASSID(courseID);
        catalogue.setTITLE(title);
        catalogue.setURL(file.getFileName());
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
                //添加消息
                Course course = Course.dao.findFirst("SELECT * FROM t_course WHERR CLASSID = ?",catalogue.getCLASSID());
                List<UserClass> userClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE  CLASSID =  ?", course.getCLASSID());
                Notification notification ;
                for (UserClass userClass : userClasses){
                    notification = new Notification();
                    notification.setOUTERID(course.getCLASSID());
                    notification.setGmtCreated(System.currentTimeMillis());
                    notification.setTYPE(NotifyTypeEnum.NOTIFY_CATALOGUE.getType());
                    notification.setRECEIVER(userClass.getUSERID());
                    notification.setOuterTitle(course.getTITLE());
                    User user = (User) getSession().getAttribute("user");
                    notification.setNotiferName(user.getNAME());
                    notification.setNOTIFER(user.getUSERID());
                    Notification   dbNotification = Notification.dao.findFirst("SELECT * FROM t_notification WHERE RECEIVER = ? AND OUTERID = ?",userClass.getUSERID(),course.getCLASSID());
                    if (dbNotification == null ){
                        //当没有消息的时候写入，避免重复消息
                        notification.save();
                    }
                    notification.save();
                }

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
    @Before(NeedLogin.class)
    public void myClass(){
        User user = (User) getSession().getAttribute("user");
        if (true){
            List<Course> courses = Course.dao.find("SELECT * FROM t_course  WHERE IS_DELETE is NULL AND CREATOR = ? ",user.getUSERID());
            setAttr("courses",courses);
        }
        renderFreeMarker("my_class.ftl");

    }

    /**
     * 删除课程
     */
    @Before(NeedLogin.class)
    public  void  delete(){
        Integer id = getInt("id");
        Course course = Course.dao.findById(31);
        course.setIsDelete(System.currentTimeMillis());
        course.update();
        myClass();//调用该方法进行重新加载课程的页面
    }

    /**
     *
     * @description  单个课程页面
     * @author zhangz
     * @date 2020:02:19 15:32:04
     * @return null
     **/
    @Before(NeedLogin.class)
    public  void  classMes() {
        Long id = getLong("id");
        Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",id);
        String sql = "SELECT * FROM t_catalogue WHERE CLASSID = ? ORDER BY GMT_CREATED DESC";
        List<Catalogue> catalogues = Catalogue.dao.find(sql,course.getCLASSID());
        String sqlTest = "SELECT DISTINCT t_catalogue.* FROM t_catalogue INNER JOIN t_test ON t_catalogue.CATALOUGEID = t_test.CATALOGUEID  WHERE t_catalogue.CLASSID =?";
        List<Catalogue> tests = Catalogue.dao.find(sqlTest,course.getCLASSID());
        List<CommentDTO> comments = commentService.initComment(id,CommentTypeEnum.COMMENT_CLASS.getType());
        set("course", course);
        set("catalogues", catalogues);
        set("CataloguetTests",tests);
        set("comments",comments);
        renderFreeMarker("class_mes.ftl");

    }



    /**
     * 具体章节界面
     */
    @Before(NeedLogin.class)
    public void  catalogue(){
        Long catalogueId = getLong("id");
        Catalogue catalogue = Catalogue.dao.findById(catalogueId);
        Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",catalogue.getCLASSID());

        List<CommentDTO> commentDTOS = commentService.initComment(catalogueId,CommentTypeEnum.COMMENT_CLASS.getType());
        set("course",course);
        set("catalogue",catalogue);
        set("comments",commentDTOS);
        renderFreeMarker("class_catalogue.ftl");


    }

    public void  downLoadFile(){
        Long catalogueId = getLong("id");
        Catalogue catalogue = Catalogue.dao.findFirst("SELECT * FROM t_catalogue WHERE  CATALOUGEID =  ?", catalogueId);
       String oldFileName = catalogue.getURL();
        String type = oldFileName.substring( oldFileName.lastIndexOf("."));
        String newFileName = catalogue.getTITLE()+type;
        renderFile(catalogue.getURL(),newFileName);
        renderFile("class/"+catalogue.getURL());

    }



}
