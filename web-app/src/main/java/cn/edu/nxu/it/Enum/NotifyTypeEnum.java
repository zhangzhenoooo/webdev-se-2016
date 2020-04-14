package cn.edu.nxu.it.Enum;

/**
 * @author zhangz
 * @date 2020-02-19 16:34
 * @description
 */
public enum  NotifyTypeEnum {

    NOTIFY_COURSE(1),//课程
    NOTIFY_COMMENT(2),//回复了评论
    NOTIFY_CATALOGUE(3),//更新了课件
    NOTIFY_NEWCATALOGUE(4),
    NOTIFY_TEST(5),

    ;
    private Integer type;

    NotifyTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}