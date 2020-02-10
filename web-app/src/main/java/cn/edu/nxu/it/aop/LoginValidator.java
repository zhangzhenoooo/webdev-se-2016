package cn.edu.nxu.it.aop;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * 登录表单验证器
 * 验证规则：用户名和密码不为空，验证是否正确
 */
public class LoginValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        //配置短路型验证，一条验证规则失败则不再继续验证
        setShortCircuit(true);

        //验证用户名
        validateRequired("username", "message", "用户名或密码为空");
        //验证密码
        validateRequired("password", "message", "用户名或密码为空");
        //验证验证码正确
        validateCaptcha("captcha", "message", "验证码不正确");
        //上述方法调用 验证不正确时会向模板中自动setAttr(errorKey, errorMessage);

    }

    @Override
    protected void handleError(Controller controller) {
        //向模板中success为false，能调到到此方法说明验证失败
        controller.setAttr("success", false);
        //渲染json数据 应该返回
        /*
         *  {
         *      success : false
         *      message : "错误消息"
         *   }
         */
        controller.renderJson();
    }
}

