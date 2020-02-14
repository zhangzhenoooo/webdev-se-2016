package cn.edu.nxu.it.aop;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * @author zhangz
 * @version 1.0
 * @date 2020/2/12 16:37
 */
public class ClassValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        //配置短路型验证，一条验证规则失败则不再继续验证
        setShortCircuit(true);

        //课题名称
        validateRequired("course.TITLE", "message", "课题名称不能为空");
        //课程描述
        validateRequired("course.DESCRIPTION", "message", "课程描述不能为空");
        //上述方法调用 验证不正确时会向模板中自动setAttr(errorKey, errorMessage);

    }

    @Override
    protected void handleError(Controller controller) {
        controller.setAttr("message",false);
        controller.renderJson();

    }
}
