package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.TestDTO;
import cn.edu.nxu.it.Enum.TestAnswerEnum;
import cn.edu.nxu.it.Enum.TestTypeEnum;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.Test;
import cn.edu.nxu.it.model.Testline;
import cn.hutool.json.JSONUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import freemarker.template.utility.StringUtil;

import java.util.ArrayList;
import java.util.List;

public class TestController extends Controller {
    /**
     * z章节检测
     */
    public void test(){
        Integer catalogueId = getInt("id");
        keepPara("id");
        String sql ="SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ? ";

        //        装载试题
        List<Test> tests_SINGLE_CHOICE = new ArrayList<>(); //选择题
        List<Test> tests_GAP_FILLING = new ArrayList<>(); //填空题
        List<Test> tests_TURE_OR_FALSE = new ArrayList<>(); //判断题
        List<Test> tests_SUBJECTIVE = new ArrayList<>(); //主观题

        tests_SINGLE_CHOICE = Test.dao.find(sql,catalogueId,TestTypeEnum.SINGLE_CHOICE.getType());
        tests_GAP_FILLING = Test.dao.find(sql,catalogueId,TestTypeEnum.GAPFILLING.getType());
        tests_TURE_OR_FALSE = Test.dao.find(sql,catalogueId,TestTypeEnum.TRUE_OR_FALSE.getType());
        tests_SUBJECTIVE = Test.dao.find(sql,catalogueId,TestTypeEnum.SUBJECTIVE.getType());

        set("singleChoice",tests_SINGLE_CHOICE);
        set("gapFillings",tests_GAP_FILLING);
        set("trueOrFalses",tests_TURE_OR_FALSE);
        set("subjectives",tests_SUBJECTIVE);
        renderFreeMarker("test.ftl");
    }

    public void addTest(){
        keepPara("id");
        renderFreeMarker("add_test.ftl");
    }
    /**
     * 添加章节检测
     */
    public void  doAddTest(){
        Long catalogueId = getLong("CATALOGUEID");
        set("id",catalogueId);
        int type = getInt("TYPE");
        Test test ;
        if (type ==TestTypeEnum.SINGLE_CHOICE.getType()){
            //选择题:2
            test = new Test();
            String description = get("2_DESCRIPTION");
            String answer = get("2_ANSWER");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.SINGLE_CHOICE.getType());
            test.setSCORE(0);
            test.setANSWER(answer);

            String a = get("a");
            test.setDESCRPTION2(a);
            test.save();
            test.setPARENTID(test.getTESTID());//
            String b = get("b");
            test.setTESTID(null);
            test.setDESCRPTION2(b);
            test.save();
            String c = get("c");
            test.setTESTID(null);
            test.setDESCRPTION2(c);
            test.save();
            String d = get("d");
            test.setTESTID(null);
            test.setDESCRPTION2(d);
            test.save();
        }
        if (type == TestTypeEnum.TRUE_OR_FALSE.getType()){
//            判断题:3
            test = new Test();
            String description = get("3_DESCRIPTION");
            Object answer = get("3_ANSWER");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.TRUE_OR_FALSE.getType());
            test.setSCORE(0);
            if (TestAnswerEnum.TRUE_OR_FALSE_TRUE.getAnswer().equals(answer) ){
                test.setANSWER((String) TestAnswerEnum.TRUE_OR_FALSE_TRUE.getAnswer());
            }else if (TestAnswerEnum.TRUE_OR_FALSE_FALSE.getAnswer().equals(answer)){
                test.setANSWER((String) TestAnswerEnum.TRUE_OR_FALSE_FALSE.getAnswer());
            }
            test.save();

        }
        if (type == TestTypeEnum.SUBJECTIVE.getType()){
            //主观题:1
            test = new Test();
            String description = get("1_DESCRIPTION");
            String answer = get("1_ANSWER");
            test.setDESCRPTION(description);
            test.setCATALOGUEID(catalogueId);
            test.setTYPE(TestTypeEnum.SUBJECTIVE.getType());
            test.setSCORE(0);
            test.setANSWER(answer);
            test.save();
        }
        Course course = Course.dao.findById(catalogueId);//>???????????????
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
}
