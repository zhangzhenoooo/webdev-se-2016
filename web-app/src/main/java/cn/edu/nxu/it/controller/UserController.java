package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.NeedLogin;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

public class UserController  extends Controller {

    @Before(NeedLogin.class)
    public void selectCourse(){
        User user = (User) getSession().getAttribute("user");
        Page<Course> paginate = Course.dao.paginate(1, 10, "SELECT *", "FROM t_course WHERE IS_DELETE IS NULL");
        set("paginate",paginate);
        renderFreeMarker("selection_course.ftl");
    }
}
