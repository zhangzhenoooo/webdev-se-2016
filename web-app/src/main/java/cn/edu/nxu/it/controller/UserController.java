package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CatalogueDTO;
import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.DTO.ResoultOfTest;
import cn.edu.nxu.it.DTO.TestAnswerDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.Enum.HistoryTypeEnum;
import cn.edu.nxu.it.Enum.NotifyTypeEnum;
import cn.edu.nxu.it.Enum.TestTypeEnum;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.model.base.BaseUser;
import cn.edu.nxu.it.service.CatalogueService;
import cn.edu.nxu.it.service.CommentService;
import cn.edu.nxu.it.service.TestService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;


public class UserController  extends Controller {

private TestService testService = new TestService();
private CommentService commentService = new CommentService();
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
//        System.out.println("courseId = =================="+courseId);
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
            userClass.setCLASSID(courseId.longValue());
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
        User loginUser = (User) getSession().getAttribute("user");
        UserClass userClass = UserClass.dao.findFirst("SELECT * FROM t_user_class WHERE CLASSID = ? AND USERID =?", courseId, loginUser.getUSERID());
        if (userClass == null){
            set("message","你没有选修该课程，请联系你的老师");
            renderFreeMarker("class_mes.ftl");
            return;
        }
        User user = User.dao.findFirst("SELECT * FROM t_user WHERE USERID = ?",course.getCREATOR());
        CatalogueService catalogueService = new CatalogueService();
        List<CatalogueDTO> catalogueDTOS = catalogueService.listCatalogByCourseId(course.getCLASSID());
        set("course",course);
        set("user",user);
        set("catalogueDTOS",catalogueDTOS);
        //添加浏览历史
//        History history = new History();
//        history.setCREATOR(user.getUSERID());
//        history.setCreatorName(user.getNAME());
//        history.setGmtCreated(System.currentTimeMillis());
//        history.setGmtModified(System.currentTimeMillis());
//        history.setTHINGID(course.getCLASSID());
//        history.setThingName(course.getTITLE()) ;
//        history.setTYPE(HistoryTypeEnum.HISTORY_COURSE.getType());
//        history.save();
        renderFreeMarker("class_mes.ftl");
    }

    /**
     * 进入我的课程界面
     */
    @Before(NeedLogin.class)
    public void myClass(){
        User user = (User) getSession().getAttribute("user");
        if (true){
            List<Course> courses = Course.dao.find("SELECT DISTINCT\n" + "t_course.*\n" + "FROM\n" + "t_course\n" + "INNER JOIN t_user_class ON t_course.CLASSID = t_user_class.CLASSID\n" + "WHERE t_course.IS_DELETE IS NULL AND t_user_class.USERID = ?",user.getUSERID());
            setAttr("courses",courses);
            List<Notification> notifications = Notification.dao.find("SELECT * FROM  t_notification WHERE RECEIVER = ? AND TYPE = ?", user.getUSERID(), NotifyTypeEnum.NOTIFY_COMMENT.getType());
            set("notifications",notifications);
            String hotSql = "SELECT\n" + "a.*\n" + "FROM\n" + "t_course as  a\n" + "INNER JOIN \n" + "(\n" + "SELECT * ,COUNT(THINGID) AS  COUNT FROM t_history  GROUP BY THINGID\n" + ") b\n" + "ON a.CLASSID = b.THINGID AND a.IS_DELETE IS NULL \n" + "ORDER BY b.COUNT  DESC  LIMIT 10";
            List<Course> hotCourses = Course.dao.find(hotSql);
            set("hotCourses",hotCourses);
        }
        renderFreeMarker("my_class.ftl");

    }

    public void markRead(){
        Long notificationId = getLong("NOTIFICATIONID");
        User user = (User) getSession().getAttribute("user");
        Kv reslut = Kv.create();
        if (notificationId ==0L){
            //delete all notification
            Db.delete("DELETE FROM   t_notification WHERE   RECEIVER =?",user.getUSERID());
            reslut.set("success",true);
        }else {
            //delete by id
            Db.delete("DELETE FROM   t_notification WHERE RECEIVER  =? AND NOTIFICATIONID=?",user.getUSERID(),notificationId);
            reslut.set("success",true);
        }
        List<Notification> notifications = Notification.dao.find("SELECT * FROM t_notification WHERE RECEIVER = ?", user.getUSERID());
        reslut.set("count",notifications.size());
        renderJson(reslut);
    }

/**
 *
 * @description 将课程从我的课程中移除
 * @author zhangz
 * @date 2020:02:21 18:45:55
 * @return
 **/
    @Before(NeedLogin.class)
    public void deleteClass(){
        Long classId = getLong("id");
        User user = (User) getSession().getAttribute("user");
        Db.delete("DELETE  FROM t_user_class WHERE USERID  = ? AND CLASSID = ?",user.getUSERID(),classId);

        myClass();
    }
    /**
     *
     * @description 取消选择的课
     * @author zhangz
     * @date 2020:02:22 15:42:18
     * @return
     **/
    @Before(NeedLogin.class)
    public void deleteSelectedClass(){
        Long classId = getLong("id");
        User user = (User) getSession().getAttribute("user");
        Db.delete("DELETE  FROM t_user_class WHERE USERID  = ? AND CLASSID = ?",user.getUSERID(),classId);
        selectCourse();
    }


    /**
     * z章节检测
     */
    public void test(){
        User user = (User) getSession().getAttribute("user");
        Integer catalogueId = getInt("id");
        keepPara("id");
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";

        //        装载试题
        List<TestAnswerDTO> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Testline> testLines_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<TestAnswerDTO> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<TestAnswerDTO> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<TestAnswerDTO> tests_SUBJECTIVE = new ArrayList<>(); //主观题

        tests_SINGLE_CHOICE = testService.listByCatalogueIdAndUserId(catalogueId,user.getUSERID(),TestTypeEnum.SINGLE_CHOICE.getType());
        testLines_SINGLE_CHOICE =Testline.dao.find("SELECT * FROM t_testline");
        tests_GAP_FILLING = testService.listByCatalogueIdAndUserId(catalogueId,user.getUSERID(),TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = testService.listByCatalogueIdAndUserId(catalogueId,user.getUSERID(),TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = testService.listByCatalogueIdAndUserId(catalogueId,user.getUSERID(),TestTypeEnum.SUBJECTIVE.getType());

//获取总分数
        ResoultOfTest resoultOfTest = testService.getScoreBytester(user.getUSERID(),catalogueId);

        set("singleChoices",tests_SINGLE_CHOICE);
        set("singleChoicelines",testLines_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);
        set("resoultOfTest",resoultOfTest);
        renderFreeMarker("test.ftl");
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

        //        装载试题
        List<Test> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Testline> testLines_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Test> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<Test> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<Test> tests_SUBJECTIVE = new ArrayList<>(); //主观题
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";
        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId, TestTypeEnum.SINGLE_CHOICE.getType());
        testLines_SINGLE_CHOICE =Testline.dao.find("SELECT * FROM t_testline");
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());


        set("singleChoices",tests_SINGLE_CHOICE);
        set("singleChoicelines",testLines_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);

        //添加浏览历史
        User user = (User) getSession().getAttribute("user");
        History history = new History();
        history.setCREATOR(user.getUSERID());
        history.setCreatorName(user.getNAME());
        history.setGmtCreated(System.currentTimeMillis());
        history.setGmtModified(System.currentTimeMillis());
        history.setTHINGID(catalogue.getCATALOUGEID());
        history.setThingName(catalogue.getTITLE()) ;
        history.setTYPE(HistoryTypeEnum.HISTORY_COURSE.getType());
        history.save();

        renderFreeMarker("class_catalogue.ftl");


    }


}

