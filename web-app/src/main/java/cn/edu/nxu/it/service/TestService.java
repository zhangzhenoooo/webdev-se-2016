package cn.edu.nxu.it.service;

import cn.edu.nxu.it.DTO.CatalogueDTO;
import cn.edu.nxu.it.DTO.ResoultOfTest;
import cn.edu.nxu.it.DTO.TestAnswerDTO;
import cn.edu.nxu.it.model.Answer;
import cn.edu.nxu.it.model.Catalogue;
import cn.edu.nxu.it.model.Test;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oreilly.servlet.multipart.LimitedServletInputStream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangz
 * @date 2020-03-08 16:45
 * @description
 */
public class TestService {
    public  static  List<TestAnswerDTO> listByCatalogueIdAndUserId(Integer catalogueId,Long userId,int type){
        List<Test> tests = Test.dao.find("SELECT * FROM t_test WHERE CATALOGUEID = ? AND TYPE = ?", catalogueId,type);
        if (tests.size() == 0) {
            return new ArrayList<>();
        }

        List<TestAnswerDTO> testAnswerDTOS = tests.stream().map(test -> {
            TestAnswerDTO testAnswerDTO = new TestAnswerDTO();
            testAnswerDTO.setANSWER(test.getANSWER());
            testAnswerDTO.setCATALOGUEID(test.getCATALOGUEID());
            testAnswerDTO.setDESCRPTION(test.getDESCRPTION());
            testAnswerDTO.setDESCRPTION2(test.getDESCRPTION2());
            testAnswerDTO.setIS_DELETED(test.getIsDeleted());
            testAnswerDTO.setPARENTID(test.getPARENTID());
            testAnswerDTO.setSCORE(test.getSCORE());
            testAnswerDTO.setTESTID(test.getTESTID());
            testAnswerDTO.setTYPE(test.getTYPE());
            Answer answer = Answer.dao.findFirst("SELECT * FROM t_answer WHERE TESTID = ? AND CREATOR = ?", test.getTESTID(),userId);
            testAnswerDTO.setAnswer(answer);
            return testAnswerDTO;

        }).collect(Collectors.toList());

        return testAnswerDTOS;
    }

/**
 *
 * @description 获取测试的结果
 * @author zhangz
 * @date 2020:03:09 09:52:49
 * @param testerId
 * @param catalogueId
 * @return  ResultOfTest{totlatPoint ,myScore}
 **/
    public ResoultOfTest getScoreBytester(Long testerId,Integer catalogueId){
       System.out.println("getScoreBytester==================================="+catalogueId+testerId);
        ResoultOfTest resoultOfTest = new ResoultOfTest();
        int totalPoint = getTotalPoint(catalogueId);
        resoultOfTest.setTotalPoint(totalPoint);
        int myScore = getMyScore(testerId,catalogueId);
        resoultOfTest.setMyScore(myScore);
        return resoultOfTest;
    }
    /**
     *
     * @description 获取测试的总分数
     * @author zhangz
     * @date 2020:03:09 09:39:18
     * @param catalogueId  获取该章节的测试
     * @return
     **/
    public int  getTotalPoint(Integer catalogueId){
     int   totalPoint= Db.queryInt("select  COALESCE(SUM(SCORE),0) as sum from t_test WHERE CATALOGUEID=?",catalogueId);

        return totalPoint;
    }
    /**
     *
     * @description 获取测试者本次测试的成绩
     * @author zhangz
     * @date 2020:03:09 09:42:19
     * @param testerId 测试者
     * @param catalogueId 章节id，获取该章节的测试
     * @return
     **/
    public int getMyScore(Long testerId,Integer catalogueId){
      int  myScore= Db.queryInt("SELECT  COALESCE(SUM(t_test.SCORE),0) as sum FROM t_test INNER JOIN t_answer ON t_test.TESTID = t_answer.TESTID AND t_test.ANSWER = t_answer.ANSWER WHERE t_test.CATALOGUEID =  ?  AND t_answer.CREATOR= ?",catalogueId,testerId);
        return myScore;
    }

    public List<Record> listOfUserTest(Long catalogueId){
        List<Record> records = Db.find("SELECT\n" + "t_user.USERID,\n" + "t_user.EMAIL,\n" + "t_answer.GMT_CREATED,\n" + "t_test.TESTID,\n" + "t_test.DESCRPTION,\n" + "t_catalogue.CATALOUGEID,\n" + "t_catalogue.TITLE,\n" + "t_user.`NAME`\n" + "FROM\n" + "t_catalogue\n" + "INNER JOIN t_test ON t_test.CATALOGUEID = t_catalogue.CATALOUGEID\n" + "INNER JOIN t_answer ON t_test.TESTID = t_answer.TESTID\n" + "INNER JOIN t_user ON t_answer.CREATOR = t_user.USERID\n" + "WHERE\n" + "t_catalogue.CATALOUGEID = ?", catalogueId);
        return records;

    }


}