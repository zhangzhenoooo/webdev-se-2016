package cn.edu.nxu.it.DTO;

import cn.edu.nxu.it.model.User;

public class CommentDTO {

    private  Long COMMENTID;
    private Long   CLASSID;
    private  Long PARENTID;
    private int TYPE;
    private  Long COMMENTATOR;
    private Long GMT_CTRATED;
    private  Long GMT_MODIFIED;
    private String CONTENT;
    private int COMMENT_COUNT;
    private User user;

    public Long getCOMMENTID() {
        return COMMENTID;
    }

    public void setCOMMENTID(Long COMMENTID) {
        this.COMMENTID = COMMENTID;
    }

    public Long getCLASSID() {
        return CLASSID;
    }

    public void setCLASSID(Long CLASSID) {
        this.CLASSID = CLASSID;
    }

    public Long getPARENTID() {
        return PARENTID;
    }

    public void setPARENTID(Long PARENTID) {
        this.PARENTID = PARENTID;
    }

    public int getTYPE() {
        return TYPE;
    }

    public void setTYPE(int TYPE) {
        this.TYPE = TYPE;
    }

    public Long getCOMMENTATOR() {
        return COMMENTATOR;
    }

    public void setCOMMENTATOR(Long COMMENTATOR) {
        this.COMMENTATOR = COMMENTATOR;
    }

    public Long getGMT_CTRATED() {
        return GMT_CTRATED;
    }

    public void setGMT_CTRATED(Long GMT_CTRATED) {
        this.GMT_CTRATED = GMT_CTRATED;
    }

    public Long getGMT_MODIFIED() {
        return GMT_MODIFIED;
    }

    public void setGMT_MODIFIED(Long GMT_MODIFIED) {
        this.GMT_MODIFIED = GMT_MODIFIED;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public int getCOMMENT_COUNT() {
        return COMMENT_COUNT;
    }

    public void setCOMMENT_COUNT(int COMMENT_COUNT) {
        this.COMMENT_COUNT = COMMENT_COUNT;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
