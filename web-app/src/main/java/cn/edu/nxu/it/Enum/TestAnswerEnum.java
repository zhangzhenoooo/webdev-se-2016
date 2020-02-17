package cn.edu.nxu.it.Enum;

public enum TestAnswerEnum {
    SINGLE_CHOIC_A("A"),
    SINGLE_CHOIC_B("B"),
    SINGLE_CHOIC_C("C"),
    SINGLE_CHOIC_D("D"),
    TRUE_OR_FALSE_TRUE(1),
    TRUE_OR_FALSE_FALSE(0),

    ;

    private Object answer;

    TestAnswerEnum(Object answer) {
        this.answer = answer;
    }

    public Object getAnswer() {
        return answer;
    }

    public void setAnswer(Object answer) {
        this.answer = answer;
    }
}
