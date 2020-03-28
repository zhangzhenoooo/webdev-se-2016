package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CatalogueDTO;
import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.Enum.HistoryTypeEnum;
import cn.edu.nxu.it.Enum.NotifyTypeEnum;
import cn.edu.nxu.it.Enum.TestTypeEnum;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.service.CatalogueService;
import cn.edu.nxu.it.service.CommentService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import net.sf.ehcache.search.expression.Not;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhangz
 * @version 1.0
 * @date 2020/2/12 13:52
 */
public class ClassController extends Controller {
    CommentService commentService = new CommentService();
    CatalogueService catalogueService = new CatalogueService();

    @Before(NeedLogin.class)
    public void publishClass(){
        renderFreeMarker("class_publish.ftl");
    }

    /**
     * 发布课程
     */
    @Before(NeedLogin.class)
    public  void  doPublishClass(){
        UploadFile file = getFile("class.HEAD","/class");
        Course course = getModel(Course.class);
        User user = (User) getSession().getAttribute("user");
//        System.out.println("user.userid ================= "+ user.getUSERID());
        course.setCREATOR(user.getUSERID());
        course.setGmtCreated(System.currentTimeMillis());
        course.setGmtModified(System.currentTimeMillis());
        course.setHEAD(file.getFileName());
        set("course",course);
        String sql = "SELECT * FROM t_catalogue WHERE CLASSID = ?";
        List<Catalogue> catalogues = Catalogue.dao.find(sql,course.getCLASSID());
        set("catalogues",catalogues);
        boolean result =  course.save();
        if (result){
            setAttr("message","添加成功");
            set("course",course);
            renderFreeMarker("class_publish.ftl");
        }else {
            set("course",course);
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
        List<CatalogueDTO> catalogueDTOS = catalogueService.listCatalogByCourseId(course.getCLASSID());
        set("course",course);
        set("catalogueDTOS",catalogueDTOS) ;
        renderFreeMarker("add_catalogue.ftl");

    }
    /**
     * 添加章节信息(发布课程界面)
     */
    public  void  addCatalogue(){
        UploadFile  file = getFile("catalogueUrl","/class");
        Long courseID = getLong("classId");
        String title = get("TITLE");
        String description = get("DESCRIPTION");
        Long section = getLong("PARENT");
        Long  node   = getLong("NODE");
        Catalogue catalogue = new Catalogue();
        catalogue.setCLASSID(courseID);
        catalogue.setTITLE(title);
        catalogue.setDESCRIPTION(description);
        if (null != file ) {
            catalogue.setURL(file.getFileName());
        }
        catalogue.setPARENTID(section);
        catalogue.setNODE(node);
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
                    Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",catalogue.getCLASSID());
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

                    }

                }else {
                    set("message","添加失败");
                    set("success",false);
                }

        }
        renderJson();

    }
    /**
     *
     * @description 删除
     * @author zhangz
     * @date 2020:03:28 15:58:23
     * @return
     **/
    public void deleteCatalogue(){
        Integer catalogueId = getInt("id");
        int delete = Db.delete("DELETE FROM t_catalogue WHERE CATALOUGEID = ?", catalogueId);
        if (delete > 0){
            set("success",true);
        }else {
            set("success",false);
        }
        renderJson();
    }
/**
 *
 * @description 跳转到修改章节
 * @author zhangz
 * @date 2020:03:27 20:55:51
 * @return
 **/
    public void  modifyCatalogue(){
        Integer catalogueId = getInt("id");
        Catalogue catalogue = Catalogue.dao.findById(catalogueId);
        Course course = Course.dao.findById(catalogue.getCLASSID());
        List<CatalogueDTO> catalogueDTOS = catalogueService.listCatalogByCourseId(course.getCLASSID());
        set("course",course);
        set("catalogue",catalogue);
        set("catalogueDTOS",catalogueDTOS) ;
        renderFreeMarker("modify_catalogue.ftl");
    }

    /**
     * 修改章节信息
     */
    public  void  doModifyCatalogue(){
        UploadFile  file = getFile("catalogueUrl","/class");
        Long courseID = getLong("classId");
        Long catalogueId = getLong("catalogueId");
        String title = get("TITLE");
        String description = get("DESCRIPTION");
        Long section = getLong("PARENT");
        Long  node   = getLong("NODE");
        Catalogue catalogue = new Catalogue();
        catalogue.setCATALOUGEID(catalogueId);
        catalogue.setCLASSID(courseID);
        catalogue.setTITLE(title);
        catalogue.setDESCRIPTION(description);
        if (null != file ) {
            catalogue.setURL(file.getFileName());
        }
        catalogue.setPARENTID(section);
        catalogue.setNODE(node);
        List<Course>  dbCourses = Course.dao.find("SELECT * FROM t_course WHERE CLASSID = ?",courseID);
        Kv result = Kv.create();
        if (dbCourses.size() == 0){
            //课程信息未保存
            set("message","没有对应的课程信息，请先保存或者新建课程信息");
            set("success",false);
        }
        else {
            List<Catalogue> catalogues = Catalogue.dao.find("SELECT * FROM t_catalogue WHERE CATALOUGEID = ?", catalogueId);
            if (catalogues.size() > 0 ){
                catalogue.setGmtModified(System.currentTimeMillis());
                catalogue.update();
                set("message","更新成功");
                set("success",true);
            }else {
                    set("message","修改失败");
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
            String hotSql = "SELECT\n" + "a.*\n" + "FROM\n" + "t_course as  a\n" + "INNER JOIN \n" + "(\n" + "SELECT * ,COUNT(THINGID) AS  COUNT FROM t_history  GROUP BY THINGID\n" + ") b\n" + "ON a.CLASSID = b.THINGID AND a.IS_DELETE IS NULL \n" + "ORDER BY b.COUNT  DESC  LIMIT 10";
            List<Course> hotCourses = Course.dao.find(hotSql);
            set("hotCourses",hotCourses);
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
        List<CatalogueDTO> catalogueDTOS = catalogueService.listCatalogByCourseId(course.getCLASSID());
        String sqlTest = "SELECT DISTINCT t_catalogue.* FROM t_catalogue INNER JOIN t_test ON t_catalogue.CATALOUGEID = t_test.CATALOGUEID  WHERE t_catalogue.CLASSID =?";
        List<Catalogue> tests = Catalogue.dao.find(sqlTest,course.getCLASSID());
        List<CommentDTO> comments = commentService.initComment(id,CommentTypeEnum.COMMENT_CLASS.getType());
        set("course", course);
        set("catalogueDTOS", catalogueDTOS);
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

        renderFreeMarker("class_catalogue.ftl");


    }

    public void  downLoadFile(){
        Long catalogueId = getLong("id");
        Catalogue catalogue = Catalogue.dao.findFirst("SELECT * FROM t_catalogue WHERE  CATALOUGEID =  ?", catalogueId);
       String oldFileName = catalogue.getURL();
       String type;
        String newFileName="";
       if ("".equals(oldFileName) || null == oldFileName){

       }else {
            type = oldFileName.substring( oldFileName.lastIndexOf("."));
            newFileName = catalogue.getTITLE()+type;
       }

        renderFile(catalogue.getURL(),newFileName);
        User user = (User) getSession().getAttribute("user");
        //添加浏览历史
        History history = new History();
        history.setCREATOR(user.getUSERID());
        history.setCreatorName(user.getNAME());
        history.setGmtCreated(System.currentTimeMillis());
        history.setGmtModified(System.currentTimeMillis());
        history.setTHINGID(catalogue.getCLASSID()); //历史记录里存储课程id，描述显示章节的标题
        history.setThingName(catalogue.getTITLE()) ;
        history.setTYPE(HistoryTypeEnum.HISTORY_CATALOGUE.getType());
        history.save();
        renderFile("class/"+catalogue.getURL());

    }

    /**
     * 更新章节检测
     */
    public void  updateTest(){
        Long catalogueId = getLong("CATALOGUEID");
        set("id",catalogueId);
        int type = getInt("TYPE");
        Long testId = getLong("TESTID");

        Test test  = Test.dao.findFirst("SELECT * FROM t_test WHERE TESTID = ?",testId) ;
        if (type ==TestTypeEnum.SINGLE_CHOICE.getType()){
            //选择题:2
            String description = get("2_DESCRIPTION");
            String answer = get("2_ANSWER");
            int score = getInt("2_SCORE");
            test.setDESCRPTION(description);
            test.setTYPE(TestTypeEnum.SINGLE_CHOICE.getType());
            test.setANSWER(answer);
            test.setSCORE(score);
            test.update();

            List<Testline> testlines = Testline.dao.find("SELECT * FROM t_testline  WHERE TESTID = ?", testId);
            List<String> descriptions = new ArrayList<>();
            descriptions.add(get("a"));
            descriptions.add(get("b"));
            descriptions.add(get("c"));
            descriptions.add(get("d"));
            int i = 0;
            for (Testline testline :testlines){
                testline.setDESCRIPTION(descriptions.get(i));
                testline.setANSWER(answer);
                testline.update();
                i++;
            }
        }
        if (type == TestTypeEnum.TRUE_OR_FALSE.getType()){
//            判断题:3
            String description = get("3_DESCRIPTION");
            String answer = get("3_ANSWER");
            int score = getInt("3_SCORE");
            test.setDESCRPTION(description);
            test.setTYPE(TestTypeEnum.TRUE_OR_FALSE.getType());

            test.setANSWER(answer);
            test.setSCORE(score);

            test.update();

        }
        if (type == TestTypeEnum.SUBJECTIVE.getType()){
            //主观题:1
            String description = get("1_DESCRIPTION");
            String answer = get("1_ANSWER");
            int score = getInt("2_SCORE");
            test.setDESCRPTION(description);
            test.setTYPE(TestTypeEnum.SUBJECTIVE.getType());
            test.setANSWER(answer);
            test.setSCORE(score);
            test.update();
        }

        Catalogue catalogue = Catalogue.dao.findById(catalogueId);
        Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",catalogue.getCLASSID());

        List<CommentDTO> commentDTOS = commentService.initComment(catalogueId, CommentTypeEnum.COMMENT_CLASS.getType());
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

        renderFreeMarker("class_catalogue.ftl");
    }



}
