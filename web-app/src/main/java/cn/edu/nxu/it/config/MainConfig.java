package cn.edu.nxu.it.config;

import cn.edu.nxu.it.controller.*;
import cn.edu.nxu.it.model._MappingKit;
import com.jfinal.config.*;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;


public class MainConfig extends JFinalConfig {
    @Override
    public void configConstant(Constants me) {
        //配置JFInal的开发模式
        me.setDevMode(true);
        me.setBaseUploadPath("upload/");
    }

    @Override
    public void configRoute(Routes routes) {
        //配置模板的基础路径 /开头的路径是从webapp开始
        routes.setBaseViewPath("/WEB-INF/templates");
        routes.add("/", MainController.class);
        routes.add("/admin", AdminController.class);
        routes.add("/movie", MovieController.class);
        routes.add("/cast", CastController.class);
        routes.add("/movie/cast", MovieCastController.class);
        routes.add("/class",ClassController.class);


    }

    @Override
    public void configEngine(Engine engine) {
    }

    @Override
    public void configPlugin(Plugins plugins) {

       //加载配置文件 文件放到/src/main/resources下
        loadPropertyFile("myconfig.properties");
        //添加Druid数据库连接池插件，分别传入 druid 可以根据jdbcurl自动识别驱动类型
        DruidPlugin druidPlugin = new DruidPlugin(
                getProperty("jdbc.url"), // jdbc url
                getProperty("jdbc.username", "root"),  //数据库连接用户名
                getProperty("jdbc.password", "root")  //数据库连接密码
        );
        //通过add方法添加插件
        plugins.add(druidPlugin);


        //添加ActiveRecord插件
        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin(druidPlugin);
        plugins.add(activeRecordPlugin);
        //设置ActiveRecord插件数据库方言，默认为MysqlDialect
        activeRecordPlugin.setDialect(new MysqlDialect());
        //根据配置文件配置ActiveRecord插件的开发模式
        activeRecordPlugin.setDevMode(getPropertyToBoolean("devMode", false));
        //根据配置文件配置ActiveRecord插件是否输出SQL语句
        activeRecordPlugin.setShowSql(getPropertyToBoolean("showSql", false));
        //将t_student表与Student模型类建立映射，主键是sno
        _MappingKit.mapping(activeRecordPlugin);
//        activeRecordPlugin.addMapping("t_student","sno", Student.class);
    }

    @Override
    public void configInterceptor(Interceptors interceptors) {
        //配置SessionInView拦截器 可以在模板中直接调用session
        interceptors.add(new SessionInViewInterceptor());
    }

    @Override
    public void configHandler(Handlers handlers) {
        /*
        添加上下文路径handler，可以在模板中使用base变量获得项目的上下文路径
        便于中间件中有多个项目上引用资源的URL调用
        */
        handlers.add(new ContextPathHandler("base"));

    }
}
