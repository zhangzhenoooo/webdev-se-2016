package cn.edu.nxu.it.DTO;

import java.util.List;

public class TestDTO<T> {
    private Long TESTID;
    private Long CATALOGUEID;
    private String DESCRPTION;
    private int TYPE; //客观题：0，主观题：1；多选题：2；判断题：3
    private String ANSWER;
    private int SCORE;
    private Long IS_DELETED;
    private List<T> TESTLINES;

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

    public String getDESCRPTION() {
        return DESCRPTION;
    }

    public void setDESCRPTION(String DESCRPTION) {
        this.DESCRPTION = DESCRPTION;
    }

    public int getTYPE() {
        return TYPE;
    }

    public void setTYPE(int TYPE) {
        this.TYPE = TYPE;
    }

    public String getANSWER() {
        return ANSWER;
    }

    public void setANSWER(String ANSWER) {
        this.ANSWER = ANSWER;
    }

    public int getSCORE() {
        return SCORE;
    }

    public void setSCORE(int SCORE) {
        this.SCORE = SCORE;
    }

    public Long getIS_DELETED() {
        return IS_DELETED;
    }

    public void setIS_DELETED(Long IS_DELETED) {
        this.IS_DELETED = IS_DELETED;
    }

    public List<T> getTESTLINES() {
        return TESTLINES;
    }

    public void setTESTLINES(List<T> TESTLINES) {
        this.TESTLINES = TESTLINES;
    }
}
