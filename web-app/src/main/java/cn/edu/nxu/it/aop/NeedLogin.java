package cn.edu.nxu.it.aop;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;

/**
 * 登录拦截器，基本原理是判断session中是否存在用户名
 */
public class NeedLogin implements Interceptor {
protected void processUnlogin(Controller controller){
    String ajax = controller.getRequest().getHeader("X-Requested-With");
    //ajax请求则返回错误消息
    if (ajax != null) {
        Kv result = Kv.create().set("success", false).set("message", "未登录");
        controller.renderJson(result);
    } else {
        //获得被拦截请求URL 传入登录页面便于登录完成后跳转
        String redirectUrl = controller.getRequest().getRequestURI();
        controller.redirect("/login?redirectUrl=" + redirectUrl, true);
    }
}
    @Override
    public void intercept(Invocation invocation) {
        Controller controller = invocation.getController();
        if (controller.getSessionAttr("username") != null) {
            invocation.invoke();
        } else {

            processUnlogin(controller);

        }
    }
}
