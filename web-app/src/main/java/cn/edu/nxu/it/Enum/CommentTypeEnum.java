package cn.edu.nxu.it.Enum;

public enum CommentTypeEnum {
    COMMENT_CLASS(1), //回复或者评论课程
    COMMNET_COMMENT(2),//回复问题或者评论
    ;
    private Integer type;

    CommentTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
