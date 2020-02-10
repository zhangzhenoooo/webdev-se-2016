package cn.edu.nxu.it.aop;

import cn.edu.nxu.it.model.User;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

public class NeedAdmin extends NeedLogin {

    @Override
    public void intercept(Invocation invocation) {
        Controller controller = invocation.getController();
        User user = (User) controller.getSessionAttr("user");
        if (user != null && user.isAdmin()) {//是否是管理员
            invocation.invoke();
        } else if (user == null){//用户未登录
            processUnlogin(controller);
        } else { //不是管理员
            controller.renderHtml("<h2>对不起，您的权限不够！</h2>");
        }
    }
}
