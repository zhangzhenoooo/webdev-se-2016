package cn.edu.nxu.it.Enum;

/**
 * @author zhangz
 * @date 2020-02-22 16:59
 * @description
 */
public enum HistoryTypeEnum {
    HISTORY_CATALOGUE(1),
    HISTORY_TEST(2),
    HISTORY_COURSE(3),
    ;
    private  Integer type;

    HistoryTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
