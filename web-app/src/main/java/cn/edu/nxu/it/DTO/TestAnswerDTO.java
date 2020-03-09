package cn.edu.nxu.it.DTO;

import cn.edu.nxu.it.model.Answer;

/**
 * @author zhangz
 * @date 2020-03-08 16:42
 * @description
 */
public class TestAnswerDTO {
    private Long  TESTID;
    private Long          CATALOGUEID;
    private Long  PARENTID;
    private String      DESCRPTION;
    private String   DESCRPTION2;
    private Integer       TYPE;
    private  String  ANSWER;
    private Integer           SCORE;
    private Long IS_DELETED;
    private Answer answer;

    public Long getTESTID() {
        return TESTID;
    }

    public void setTESTID(Long TESTID) {
        this.TESTID = TESTID;
    }

    public Long getCATALOGUEID() {
        return CATALOGUEID;
    }

    public void setCATALOGUEID(Long CATALOGUEID) {
        this.CATALOGUEID = CATALOGUEID;
    }

    public Long getPARENTID() {
        return PARENTID;
    }

    public void setPARENTID(Long PARENTID) {
        this.PARENTID = PARENTID;
    }

    public String getDESCRPTION() {
        return DESCRPTION;
    }

    public void setDESCRPTION(String DESCRPTION) {
        this.DESCRPTION = DESCRPTION;
    }

    public String getDESCRPTION2() {
        return DESCRPTION2;
    }

    public void setDESCRPTION2(String DESCRPTION2) {
        this.DESCRPTION2 = DESCRPTION2;
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public String getANSWER() {
        return ANSWER;
    }

    public void setANSWER(String ANSWER) {
        this.ANSWER = ANSWER;
    }

    public Integer getSCORE() {
        return SCORE;
    }

    public void setSCORE(Integer SCORE) {
        this.SCORE = SCORE;
    }

    public Long getIS_DELETED() {
        return IS_DELETED;
    }

    public void setIS_DELETED(Long IS_DELETED) {
        this.IS_DELETED = IS_DELETED;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }
}