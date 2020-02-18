package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CourseDTO;
import cn.edu.nxu.it.aop.LoginValidator;
import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import cn.edu.nxu.it.model.UserClass;
import cn.edu.nxu.it.service.CourseService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.upload.UploadFile;

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
        renderFreeMarker("index.ftl");
    }

    //退出登录
    public void logout() {
        removeSessionAttr("username");
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
        System.out.println(username+password+email+gender+captcha+repassword);

        User user = new User();

        boolean success = false;
        String message = "注册失败";
        try {
            user.save();
            success=true;
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
        String redirectUrl = getPara("redirectUrl", "/");
        Kv result = Kv.create();
        boolean success = false;
        String message = "用户名或密码错误";
        //TODO: 需要从数据库中判断用户名和密码的正确
        String sql = "select * from t_user where EMAIL = ? AND PASSWORD = ?";
        List<User> users = User.dao.find(sql,username,password);
        System.out.println(users);

        if (users.size() != 0){

            message = "登录成功";
            success = true;
            result.set("redirectUrl", redirectUrl);
            //登录成功则将用户名写入session中以在之后判断用户登录状态
            User user = users.get(0);
            setSessionAttr("user", user);
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
        String sql = "SELECT * FROM t_user WHERE EMAIL = ? ";
        List<User> users = User.dao.find(sql,user.getEMAIL());
        if (users.size() !=0){
            setAttr("user",users.get(0));
            System.out.println("user.sex = "+users.get(0).isSEX());
        }
        renderFreeMarker("myMes.ftl");
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
                user.save();
                redirect("login.ftl");
            }
        }
    }

    @Before(NeedLogin.class)
    public void studentManagement(){
        User user = (User) getSession().getAttribute("user");
        String sql = "SELECT t_user_class.* FROM t_user_class INNER JOIN t_course ON t_user_class.CLASSID = t_course.CLASSID WHERE t_course.CREATOR =?";
        List<UserClass> userClasses = UserClass.dao.find(sql,user.getUSERID());
        List<Course> courses = Course.dao.find("SELECT * FROM t_course WHERE CREATOR = ?", user.getUSERID());
        set("userClasses",userClasses) ;
        set("courses",courses) ;
        renderFreeMarker("students_management.ftl");
    }

}
