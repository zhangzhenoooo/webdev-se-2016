package cn.edu.nxu.it.aop;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class  CastValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        validateRequired("username", "message", "用户名为空");
        validateRequired("password", "message", "密码为空");
    }

    @Override
    protected void handleError(Controller c) {
        c.setAttr("success", false);
        c.renderJson();
    }
}
