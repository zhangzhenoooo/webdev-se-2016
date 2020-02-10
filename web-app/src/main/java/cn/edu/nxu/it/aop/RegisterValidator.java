package cn.edu.nxu.it.aop;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class RegisterValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        setShortCircuit(true);
        validateRequired("username", "message", "用户名为空");
        validateRequired("password", "message", "密码为空");
        String gender = c.getPara("gender");
        if (!gender.equals("0") & !gender.equals("1")) {
            addError("message", "性别不正确");
        }
        validateEmail("email", "message", "邮箱地址不正确");

    }

    @Override
    protected void handleError(Controller c) {

        c.setAttr("success", false);
        c.renderJson();
    }
}
