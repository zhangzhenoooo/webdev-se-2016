package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.Test;
import com.jfinal.core.Controller;

import java.util.List;

public class TestController extends Controller {

    public void test(){
        Integer id = getInt("id");
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ?";
        List<Test> tests = Test.dao.find(sql, id);
        set("tests",tests);
        renderFreeMarker("test.ftl");
    }
    public void  addTest(){
        Integer id = getInt("id");
        Course course = Course.dao.findById(id);
        renderFreeMarker("add_test.ftl");
    }
}
