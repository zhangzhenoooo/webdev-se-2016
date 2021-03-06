package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.LoginValidator;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.*;
import cn.hutool.core.util.ObjectUtil;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.util.List;

public class MainController extends Controller {

    //test pull
    public void nav() {
        renderFreeMarker("navigation.ftl");
    }

    //显示登录页面
    public void login() {
        /*将传入的redirect参数传入模板 相当于
            String redirectUrl = getPara("redirectUrl");
            setAttr("redirectUrl", redirectUrl):
         */
        keepPara("redirectUrl"); //跳转url
        renderFreeMarker("login.ftl");
    }

    public void index(){
//        int p = getParaToInt("p",1);
//        Page<Movie> page = Movie.dao.paginate(p, 5,
//                "SELECT *", "FROM t_movie");
//        setAttr("page",page);
//        List<Course> allCourses = Course.dao.find("SELECT * FROM t_course WHERE IS_DELETE IS NULL ORDER BY GMT_CREATED DESC");
//        String hotSql = "SELECT\n" + "a.*\n" + "FROM\n" + "t_course as  a\n" + "INNER JOIN \n" + "(\n" + "SELECT * ,COUNT(THINGID) AS  COUNT FROM t_history  GROUP BY THINGID\n" + ") b\n" + "ON a.CLASSID = b.THINGID AND a.IS_DELETE IS NULL \n" + "ORDER BY b.COUNT  DESC  LIMIT 10";
//        List<Course> hotCourses = Course.dao.find(hotSql);
//        set("hotCourses",hotCourses);
//        set("allCourses",allCourses);
//        renderFreeMarker("index.ftl");
        User user = (User) getSession().getAttribute("user");
        if (user != null && user.getTYPE()==1){
            redirect("/class/classMes?id=39");
        }else {
            redirect("/user/classMes?id=39");
        }
    }

    //退出登录
    public void logout() {
        removeSessionAttr("username");
        removeSessionAttr("user");

        redirect("/login");
    }



    //文件上传访问路径
    public void up(){
        renderFreeMarker("upload.ftl");
    }

    //系统首页
    public void home(){
        renderFreeMarker("index.ftl");
    }



    /**
     * 注册判断
     */
//@Before(RegisterValidator.class)
    public void registerCheck(){
        String username = getPara("username");
        String password = getPara("password");
        String repassword = getPara("repassword");
        String email = getPara("email");
        Boolean gender = getParaToBoolean("gender");
        String captcha = getPara("captcha");
//        System.out.println(username+password+email+gender+captcha+repassword);
        User user = new User();
        boolean success = false;
        String message = "注册失败";
        try {
            user.save();
            success=true;
            //给用户添加课程
            Course course = Course.dao.findById(39);
            UserClass userClass = new UserClass();
            userClass.setCLASSID(course.getCLASSID());
            userClass.setCLASSNAME(course.getTITLE());
            userClass.setUSERID(user.getUSERID());
            userClass.setUSERNAME(user.getNAME());
            userClass.setGmtCreated(System.currentTimeMillis());
        }catch (ActiveRecordException e){
            LogKit.error("用户注册失败，原因："+ e.getMessage());
            e.printStackTrace();
        }
        Kv result = Kv.create();
        result.set("message",message);
        result.set("success",success);
        renderJson(result);
    }



    /**
     * 登录判断
     */
    @Before(LoginValidator.class)
    public void loginCheck() {
        String username = getPara("username");
        String password = getPara("password");
        String redirectUrl = getPara("redirectUrl", "/class/classMes?id=39");
        Kv result = Kv.create();
        boolean success = false;
        String message = "用户名或密码错误";
        //TODO: 需要从数据库中判断用户名和密码的正确
        String sql = "select * from t_user where EMAIL = ? AND PASSWORD = ?";
        List<User> users = User.dao.find(sql,username,password);
        if (users.size() != 0){
            message = "登录成功";
            success = true;
            result.set("redirectUrl", redirectUrl);
            //登录成功则将用户名写入session中以在之后判断用户登录状态
            User user = users.get(0);
            setSessionAttr("user", user);
            //获取消息，存入session
            List<Notification> notifications = Notification.dao.find("SELECT * FROM t_notification WHERE RECEIVER = ?", user.getUSERID());
            setSessionAttr("notifications",notifications);
        }
        result.set("message", message).set("success", success);
        renderJson(result);
    }






    //显示验证码
    public void captcha() {
        renderCaptcha();
    }


    //个人资料
    @Before(NeedLogin.class)
    public  void myMes(){
        User user = (User) getSession().getAttribute("user");
        User dbUser = User.dao.findById(user.getUSERID());
        setAttr("user",dbUser);
        String sql = "SELECT DISTINCT t_course.* FROM t_course INNER JOIN t_user_class ON t_course.CLASSID = t_user_class.CLASSID WHERE t_user_class.USERID =?";
        List<Course> courses = Course.dao.find(sql, user.getUSERID());
        set("courses",courses);
        List<History> histories = History.dao.find("SELECT * FROM t_history WHERE CREATOR =  ? ORDER BY GMT_MODIFIED LIMIT 10", user.getUSERID());
        set("histories",histories);
        renderFreeMarker("myMes.ftl");
    }


    public void  updateMyMes(){
        User user = getModel(User.class);
        User loginUser = (User) getSession().getAttribute("user");
        if (loginUser.getUSERID().equals(user.getUSERID())){
            Db.update("UPDATE t_user SET EMAIL = ?,NAME = ? ,INTRODUCTION = ? ,PHONE = ? WHERE USERID =?",user.getEMAIL(),user.getNAME(),user.getINTRODUCTION(),user.getPHONE(),user.getUSERID());
            //更新user_class中的学生名称
            Db.update("UPDATE t_user_class SET USERNAME = ? WHERE USERID = ?",user.getNAME(),user.getUSERID());
        }
        myMes();
    }

    //跳转到注册页面
    public void register(){
        renderFreeMarker("register.ftl");
    }


    /**
     * 注册
     */
    public void doRegister(){
        User user = getModel(User.class,true);
        String password2 = getPara("user.PASSWORD2");
        if (user.getEMAIL() ==null || "".equals(user.getEMAIL())){
            setAttr("message","邮箱不能为空");
            renderFreeMarker("register.ftl");
        }
        else  if (user.getNAME() == null || "".equals(user.getNAME())){
            setAttr("message","名字不能为空");
            renderFreeMarker("register.ftl");
        }
        else if (user.getPASSWORD() == null ||password2 ==null ){
            setAttr("message","密码不能为空");
            renderFreeMarker("register.ftl");
        }
        else if (!password2.equals(user.getPASSWORD())){
            setAttr("message","两次密码不一致");
            renderFreeMarker("register.ftl");
        }else {
            //判断邮箱是否被注册
            List<User> dbUsers = User.dao.find("SELECT USERID FROM t_user WHERE EMAIL = ?", user.getEMAIL());
            if (dbUsers.size() <0 ){
                setAttr("message","邮箱："+user.getEMAIL()+" 已经被注册过了");
                renderFreeMarker("register.ftl");
            }else {
                user.setTYPE(0);
                user.save();
                //给学生添加课程
                Course course = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",39);
                UserClass userClass = new UserClass();
                userClass.setCLASSID(39L);
                userClass.setCLASSNAME(course.getTITLE());
                userClass.setUSERID(user.getUSERID());
                userClass.setUSERNAME(user.getNAME());
                userClass.setGmtCreated(System.currentTimeMillis());
                userClass.save();
                set("email",user.getEMAIL()) ;
                redirect("/login");
            }
        }
    }

    /**
     *
     * @description 跳转到修改密码
     * @author zhangz
     * @date 2020:02:21 21:33:58
     * @return
     **/
    @Before(NeedLogin.class)
    public void updatePassword(){
        renderFreeMarker("update_password.ftl");
    }

    public void doUpdatePassword(){
        User user = (User) getSession().getAttribute("user");
        String oldPassword = get("oldPassword");
        String newPassword = get("newPassword");
        String newPassword2 = get("newPassword2");
        if(!user.getPASSWORD().equals(oldPassword)){
            set("message","原密码错误");
            renderFreeMarker("update_password.ftl");
        }
        else if (!newPassword.equals(newPassword2)){
            set("message","两次密码错误");
            renderFreeMarker("update_password.ftl");
        }else {
            user.setPASSWORD(newPassword);
            user.update();
            myMes();
        }

    }


    @Before(NeedLogin.class)
    public void studentManagement(){
        User user = (User) getSession().getAttribute("user");
        String sql = "SELECT\n" + "t_user_class.CLASSNAME,\n" + "t_user.USERID,\n" + "t_user.EMAIL,\n" + "t_user.`PASSWORD`,\n" + "t_user.`NAME`,\n" + "t_user.PHONE,\n" + "t_user.AGE,\n" + "t_user.SEX,\n" + "t_user.TYPE,\n" + "t_user.HEAD,\n" + "t_user.IS_DELETED,\n" + "t_user.INTRODUCTION,\n" + "t_user_class.CLASSID,\n" + "t_course.GMT_CREATED\n" + "FROM\n" + "t_user\n" + "INNER JOIN t_user_class ON t_user.USERID = t_user_class.USERID\n" + "INNER JOIN t_course ON t_user_class.CLASSID = t_course.CLASSID\n" + "WHERE\n" + "t_course.CREATOR = ? AND\n" + "t_user_class.USERID != 30";
        List<Record> userClassDTOs = Db.find(sql,user.getUSERID());

        List<Course> courses = Course.dao.find("SELECT * FROM t_course WHERE CREATOR = ?", user.getUSERID());
        set("userClassDTOs",userClassDTOs) ;
        set("courses",courses) ;
        renderFreeMarker("students_management.ftl");
    }

    /**
     *
     * @description 删除学生
     * @author zhangz
     * @date 2020:02:20 19:31:32
     * @return
     **/
    public void deleteStudent(){
        Long userId = getLong("userId");
        Long classId = getLong("classId");
        Db.delete("DELETE FROM t_user_class WHERE CLASSID = ? AND USERID =?",classId,userId);
        studentManagement();
    }

    public void addHead(){
        UploadFile  file = getFile("HEAD","/user/head");
        //如果已经存在，删除原文件
            File oldFile = new File("/user/head/" + file.getFileName());
            if (oldFile.exists()) {
                oldFile.delete();
            }
        Long userId = getLong("USERID");
        String head = "";
        if (file != null){
            head = file.getFileName();
        }
        Db.update("UPDATE t_user SET HEAD = ? WHERE USERID = ?", head, userId);

        User user = (User) getSession().getAttribute("user");
        setAttr("user",user);
        String sql = "SELECT DISTINCT t_course.* FROM t_course INNER JOIN t_user_class ON t_course.CLASSID = t_user_class.CLASSID WHERE t_user_class.USERID =?";
        List<Course> courses = Course.dao.find(sql, user.getUSERID());
        set("courses",courses);
        List<History> histories = History.dao.find("SELECT * FROM t_history WHERE CREATOR =  ? ORDER BY GMT_MODIFIED ", user.getUSERID());
        set("histories",histories);
        renderFreeMarker("myMes.ftl");
    }

    public void  studentList(){
        String searchText = get("searchText");
        String sql = "SELECT * FROM t_user WHERE USERID != 30 AND IS_DELETED is NULL AND UserID like  '%"+searchText+"%' or `NAME` LIKE '%"+searchText+"%'";
        Kv result = Kv.create();
        List<User> users = User.dao.find(sql);
        result.set("users",users);
        renderJson(result);
    }

    public void addUserForClass(){
        Long userid = getLong("USERID");
        User user = User.dao.findFirst("select * from t_user where USERID=?",userid);
        Kv result = Kv.create();
        if (ObjectUtil.isNull(user)){
            result.set("success",false);
            result.set("message","添加失败");
        }else {
            UserClass dbUserClass = UserClass.dao.findFirst("select * from t_user_class where USERID=?", user.getUSERID());
            if (ObjectUtil.isNull(dbUserClass)) {
                result.set("success",true);
                result.set("message","添加成功");

            }else {
                UserClass userClass = new UserClass();
                userClass.setGmtCreated(System.currentTimeMillis());
                userClass.setUSERNAME(user.getNAME());
                userClass.setUSERID(userid);
                Course course = Course.dao.findFirst("select * from t_course where CLASSID = ?",39);
                userClass.setCLASSNAME(course.getTITLE());
                userClass.setCLASSID(course.getCLASSID());
                userClass.save();
            }


        }renderJson(result);
    }



}
