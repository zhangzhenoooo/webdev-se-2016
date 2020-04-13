package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.ResoultOfTest;
import cn.edu.nxu.it.DTO.TestAnswerDTO;
import cn.edu.nxu.it.Enum.HistoryTypeEnum;
import cn.edu.nxu.it.Enum.NotifyTypeEnum;
import cn.edu.nxu.it.Enum.TestAnswerEnum;
import cn.edu.nxu.it.Enum.TestTypeEnum;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.service.CatalogueService;
import cn.edu.nxu.it.service.TestService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.List;
@Before(NeedLogin.class)
public class TestController extends Controller {

    TestService testService = new TestService();
    CatalogueService catalogueService = new CatalogueService();

    /**
     * z章节检测
     */
    @Before(NeedLogin.class)
    public void test(){
        Integer catalogueId = getInt("id");
        keepPara("id");
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";
        User user  = (User) getSession().getAttribute("user");
        //        装载试题
        List<Test> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Testline> testLines_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Test> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<Test> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<Test> tests_SUBJECTIVE = new ArrayList<>(); //主观题


        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId,TestTypeEnum.SINGLE_CHOICE.getType());
        testLines_SINGLE_CHOICE =Testline.dao.find("SELECT * FROM t_testline");
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());

        //获取总分数
        ResoultOfTest  resoultOfTest = testService.getScoreBytester(user.getUSERID(),catalogueId);
        List<Record> records = testService.listOfUserTest(catalogueId.longValue());
        set("singleChoices",tests_SINGLE_CHOICE);
        set("singleChoicelines",testLines_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);
        set("resoultOfTest",resoultOfTest);
        set("records",records);
        renderFreeMarker("test.ftl");
    }


    @Before(NeedLogin.class)
    public void addTest(){
        Integer catalogueId = getInt("id");
        keepPara("id");
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";
        Catalogue catalogue = Catalogue.dao.findFirst("SELECT * FROM t_catalogue WHERE CATALOUGEID = ? ", catalogueId);
        set("catalogue",catalogue);
        //        装载试题
        List<Test> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Testline> testLines_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Test> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<Test> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<Test> tests_SUBJECTIVE = new ArrayList<>(); //主观题

        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId,TestTypeEnum.SINGLE_CHOICE.getType());
        testLines_SINGLE_CHOICE =Testline.dao.find("SELECT * FROM t_testline");
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());


        set("singleChoices",tests_SINGLE_CHOICE);
        set("singleChoicelines",testLines_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);
        renderFreeMarker("add_test.ftl");
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
            int score = getInt("1_SCORE");
            test.setDESCRPTION(description);
            test.setTYPE(TestTypeEnum.SUBJECTIVE.getType());
            test.setANSWER(answer);
            test.setSCORE(score);
            test.update();
        }
        Course course = Course.dao.findById(catalogueId);//>???????????????

        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";

        //        装载试题
        List<Test> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Testline> testLines_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Test> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<Test> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<Test> tests_SUBJECTIVE = new ArrayList<>(); //主观题

        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId,TestTypeEnum.SINGLE_CHOICE.getType());
        testLines_SINGLE_CHOICE =Testline.dao.find("SELECT * FROM t_testline");
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());


        set("singleChoices",tests_SINGLE_CHOICE);
        set("singleChoicelines",testLines_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);
        renderFreeMarker("test.ftl");
    }

    /**
     *
     * @description 添加测试题
     * @author zhangz
     * @date 2020:02:21 15:48:24
     * @return
     **/
    public void doAddTest(){
        Long catalogueId = getLong("CATALOGUEID");
        set("id",catalogueId);
        Integer testId = getInt("TESTID");
        int type = getInt("TYPE");
        Test test ;
        if (type ==TestTypeEnum.SINGLE_CHOICE.getType()){
            //选择题:2
            test = new Test();
            String description = get("2_DESCRIPTION");
            String answer = get("2_ANSWER");
            int score = getInt("2_SCORE");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.SINGLE_CHOICE.getType());
            test.setSCORE(score);
            test.setANSWER(answer);
            test.save();

            Testline testline = new Testline();

            String a = get("a");
            testline.setDESCRIPTION(a);
            testline.setANSWER(answer);
            testline.setTESTID(test.getTESTID());
            testline.save();


            String b = get("b");
            testline.setTESTLINEID(null);
            testline.setDESCRIPTION(b);
            testline.setANSWER(answer);
            testline.setTESTID(test.getTESTID());
            testline.save();

            String c = get("c");
            testline.setTESTLINEID(null);
            testline.setDESCRIPTION(c);
            testline.setANSWER(answer);
            testline.setTESTID(test.getTESTID());
            testline.save();

            String d = get("d");
            testline.setTESTLINEID(null);
            testline.setDESCRIPTION(d);
            testline.setANSWER(answer);
            testline.setTESTID(test.getTESTID());
            testline.save();
        }
        if (type == TestTypeEnum.TRUE_OR_FALSE.getType()){
//            判断题:3
            test = new Test();
            String description = get("3_DESCRIPTION");
            String answer = get("3_ANSWER");
            int score = getInt("3_SCORE");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.TRUE_OR_FALSE.getType());
            test.setSCORE(score);
            test.setANSWER(answer);
            if (TestAnswerEnum.TRUE_OR_FALSE_TRUE.getAnswer().equals(answer) || TestAnswerEnum.TRUE_OR_FALSE_TRUE.getAnswer() ==answer ){
                test.setANSWER((String) TestAnswerEnum.TRUE_OR_FALSE_TRUE.getAnswer());
            }else if (TestAnswerEnum.TRUE_OR_FALSE_FALSE.getAnswer().equals(answer) || TestAnswerEnum.TRUE_OR_FALSE_FALSE.getAnswer() ==answer){
                test.setANSWER((String) TestAnswerEnum.TRUE_OR_FALSE_FALSE.getAnswer());
            }
            test.save();

        }
        if (type == TestTypeEnum.SUBJECTIVE.getType()){
            //主观题:1
            test = new Test();
            String description = get("1_DESCRIPTION");
            String answer = get("1_ANSWER");
            int score = getInt("1_SCORE");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.SUBJECTIVE.getType());
            test.setSCORE(score);
            test.setANSWER(answer);
            test.save();
        }
        //添加消息
        Catalogue course = Catalogue.dao.findFirst("SELECT * FROM t_catalogue WHERE CATALOUGEID = ?",catalogueId);
        List<UserClass> userClasses = UserClass.dao.find("SELECT * FROM t_user_class WHERE  CLASSID =  ?", course.getCLASSID());
        Notification notification ;
        for (UserClass userClass : userClasses){

            notification = new Notification();
            notification.setOUTERID(course.getCLASSID());
            notification.setGmtCreated(System.currentTimeMillis());
            notification.setTYPE(NotifyTypeEnum.NOTIFY_TEST.getType());
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

        List<Test> tests_SINGLE_CHOICE ; //选择题
        List<Test> tests_GAP_FILLING ; //填空题
        List<Test> tests_TURE_OR_FALSE; //判断题
        List<Test> tests_SUBJECTIVE ; //主观题
        String sql = "SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ?";
        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId,TestTypeEnum.SINGLE_CHOICE.getType());
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());
        set("singleChoices",tests_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("trueOrFalses",tests_SUBJECTIVE);
        renderFreeMarker("add_test.ftl");

    }



    /**
     *
     * @description 将测试添加到数据库(在答题的过程中，即回答一道题便保存一道)
     * @author zhangz
     * @date 2020:02:20 15:34:35
     * @return null
     **/
    public  void  doAnswer(){
        Long testId = getLong("testId");
        String answer = get("answer");
        Integer type = getInt("type");
        User user = (User) getSession().getAttribute("user");
        Kv result  = Kv.create();
        Answer dbAnswer;
        if (type == 2){
            Testline dbtTest = Testline.dao.findFirst("select * from t_testline where TESTLINEID = ? ", testId);
            testId = dbtTest.getTESTID();
            dbAnswer = Answer.dao.findFirst("SELECT * FROM t_answer WHERE TESTID = ? AND CREATOR = ?",dbtTest.getTESTID(),user.getUSERID());
        }else {
            dbAnswer = Answer.dao.findFirst("SELECT * FROM t_answer WHERE TESTID = ? AND CREATOR = ?",testId,user.getUSERID());
        }

        if (dbAnswer != null ){
            //    修改
            if (answer == null || "".equals(answer)){
                dbAnswer.delete();
            }else {
                dbAnswer.setANSWER(answer);
                dbAnswer.setGmtCreated(System.currentTimeMillis());
                boolean affectRow = dbAnswer.update();
                if (affectRow ){
                    result.set("success",true);
                }else {
                    result.set("success",true);
                }
            }

        }else {
            //    插入
            Answer inserAnswer = new Answer();
            inserAnswer.setTESTID(testId);
            inserAnswer.setANSWER(answer);
            inserAnswer.setCREATOR(user.getUSERID());
            inserAnswer.setGmtCreated(System.currentTimeMillis());
            inserAnswer.setTYPE(type);
            boolean affectRow = inserAnswer.save();
            if (affectRow){
                result.set("success",true);
            }else {
                result.set("success",false);
            }
        }
        result.set("testId",testId);
        //添加浏览历史
        Catalogue catalogue = Catalogue.dao.findFirst("SELECT DISTINCT t_catalogue.* FROM t_catalogue INNER JOIN t_test ON t_test.CATALOGUEID = t_catalogue.CATALOUGEID WHERE t_test.TESTID = ?",testId);
        History history = new History();
        history.setCREATOR(user.getUSERID());
        history.setCreatorName(user.getNAME());
        history.setGmtCreated(System.currentTimeMillis());
        history.setGmtModified(System.currentTimeMillis());
        history.setTHINGID(catalogue.getCLASSID()); //历史记录里存储课程id，描述显示章节的标题
        history.setThingName(catalogue.getTITLE()) ;
        history.setTYPE(HistoryTypeEnum.HISTORY_TEST.getType());
        history.save();
        renderJson(result);
        return;
    }

    /**
     *
     * @description 根据id获取test的信息
     * @author zhangz
     * @date 2020:02:20 22:01:40
     * @return
     **/
    public void getTest(){
        Long testId = getLong("testId");
        Integer type = getInt("type");
        Test dbTest = Test.dao.findFirst("SELECT * FROM t_test WHERE TESTID = ?", testId);
        Kv resulet = Kv.create();
        if (dbTest == null){
            resulet.set("success",false);
            set("message","该试题已经被删除了");
            renderJson(resulet);
            return;
        }
        if (dbTest.getTYPE() == TestTypeEnum.SINGLE_CHOICE.getType()){
            //单选
            resulet.set("description",dbTest.getDESCRPTION());
            resulet.set("catalogueId",dbTest.getCATALOGUEID());
            resulet.set("answer",dbTest.getANSWER());
            resulet.set("success",true);
            resulet.set("testId",dbTest.getTESTID());
            List<Testline> dbTestlines = Testline.dao.find("SELECT * FROM t_testline WHERE TESTID = ?", testId);
            String[] strings = {"a","b","c","d","e","f,","g"};
            int i = 0;
            for (Testline testline:dbTestlines){
                resulet.set(strings[i],testline.getDESCRIPTION());
                i++;
            }

        }else if (dbTest.getTYPE() == TestTypeEnum.TRUE_OR_FALSE.getType()){
            //判断
            resulet.set("description",dbTest.getDESCRPTION());
            resulet.set("catalogueId",dbTest.getCATALOGUEID());
            resulet.set("answer",dbTest.getANSWER());
            resulet.set("success",true);
            resulet.set("testId",dbTest.getTESTID());
        }else  if (dbTest.getTYPE() == TestTypeEnum.SUBJECTIVE.getType()){
//            主观题
            resulet.set("description",dbTest.getDESCRPTION());
            resulet.set("catalogueId",dbTest.getCATALOGUEID());
            resulet.set("answer",dbTest.getANSWER());
            resulet.set("success",true);
            resulet.set("testId",dbTest.getTESTID());
        }
        //添加浏览历史
        User user = (User) getSession().getAttribute("user");
        Catalogue catalogue = Catalogue.dao.findFirst("SELECT DISTINCT t_catalogue.* FROM t_catalogue INNER JOIN t_test ON t_test.CATALOGUEID = t_catalogue.CATALOUGEID WHERE t_test.TESTID = ?",testId);
        History history = new History();
        history.setCREATOR(user.getUSERID());
        history.setCreatorName(user.getNAME());
        history.setGmtCreated(System.currentTimeMillis());
        history.setGmtModified(System.currentTimeMillis());
        history.setTHINGID(catalogue.getCLASSID()); //历史记录里存储课程id，描述显示章节的标题
        history.setThingName(catalogue.getTITLE()) ;
        history.setTYPE(HistoryTypeEnum.HISTORY_TEST.getType());
        history.save();
        renderJson(resulet);
    }

    /**
     *
     * @description  提交考试
     * @author zhangz
     * @date 2020:03:09 09:57:43
     * @return
     **/
    public void testSubmit(){
        Long catalogueId = getLong("catalogueId");
        System.out.println("testSubmit.catalogueId ====================="+catalogueId);
        User user = (User) getSession().getAttribute("user");
        int result = Db.update("UPDATE t_answer SET SIGN = 1 WHERE TESTID IN ( SELECT TESTID FROM t_test WHERE CATALOGUEID = ? ) AND CREATOR = ?",catalogueId,user.getUSERID());
        renderJson(result);
    }

    public void deleteTestByTestId(){
        Long testId = getLong("testId");
        int delete = Db.delete("DELETE FROM t_test WHERE TESTID = ?", testId);
        Db.delete("DELETE FROM t_testline WHERE TESTID = ?",testId);
        Db.delete("DELETE FROM t_answer WHERE TESTID = ?",testId);
        Kv result = Kv.create();
        result.set("success",200);
        renderJson(result);
    }

}
