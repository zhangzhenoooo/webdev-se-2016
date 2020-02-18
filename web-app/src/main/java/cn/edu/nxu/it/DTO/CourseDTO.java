package cn.edu.nxu.it.DTO;

import cn.edu.nxu.it.model.User;

public class CourseDTO {
    private  Long CLASSID;
    private String TITLE;
    private String DESCRIPTION;
    private Long  CREATOR;
    private Long GMT_CREATED;
    private Long GMT_MODIFIED;
    private String HEAD;
    private Long IS_DELETE;
    private User user;

    public Long getCLASSID() {
        return CLASSID;
    }

    public void setCLASSID(Long CLASSID) {
        this.CLASSID = CLASSID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public Long getCREATOR() {
        return CREATOR;
    }

    public void setCREATOR(Long CREATOR) {
        this.CREATOR = CREATOR;
    }

    public Long getGMT_CREATED() {
        return GMT_CREATED;
    }

    public void setGMT_CREATED(Long GMT_CREATED) {
        this.GMT_CREATED = GMT_CREATED;
    }

    public Long getGMT_MODIFIED() {
        return GMT_MODIFIED;
    }

    public void setGMT_MODIFIED(Long GMT_MODIFIED) {
        this.GMT_MODIFIED = GMT_MODIFIED;
    }

    public String getHEAD() {
        return HEAD;
    }

    public void setHEAD(String HEAD) {
        this.HEAD = HEAD;
    }

    public Long getIS_DELETE() {
        return IS_DELETE;
    }

    public void setIS_DELETE(Long IS_DELETE) {
        this.IS_DELETE = IS_DELETE;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
