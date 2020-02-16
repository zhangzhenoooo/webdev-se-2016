package cn.edu.nxu.it.Enum;

public enum TestTypeEnum {
    //    填空题：0，主观题：1；选择题：2；判断题：3
    GAPFILLING(0), //    填空题：0
    SUBJECTIVE(1),//主观题
    SINGLE_CHOICE(2),//选择题
    TRUE_OR_FALSE(3),//判断题
    ;

    private int type;

    TestTypeEnum(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

}
