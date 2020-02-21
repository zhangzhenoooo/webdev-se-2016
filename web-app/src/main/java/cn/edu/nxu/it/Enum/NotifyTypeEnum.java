package cn.edu.nxu.it.Enum;

/**
 * @author zhangz
 * @date 2020-02-19 16:34
 * @description
 */
public enum  NotifyTypeEnum {
    NOTIFY_TEST(1),//老师发布了章节检测，提示学生
    NOTIFY_COMMENT(2),//回复了评论
    NOTIFY_CATALOGUE(3),//更新了课件

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