package cn.edu.nxu.it.Enum;

public enum TestAnswerEnum {

    TRUE_OR_FALSE_TRUE(1),
    TRUE_OR_FALSE_FALSE(0),

    ;

    private Integer answer;

    TestAnswerEnum(Integer answer) {
        this.answer = answer;
    }

    public Object getAnswer() {
        return answer;
    }

    public void setAnswer(Integer answer) {
        this.answer = answer;
    }
}
