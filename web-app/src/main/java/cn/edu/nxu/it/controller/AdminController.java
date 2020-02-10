package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.aop.NeedAdmin;
import cn.edu.nxu.it.config.Preference;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

//管理后台
@Before(NeedAdmin.class)
public class AdminController extends Controller {
    //管理员后台主界面
    //  @Before(NeedAdmin.class)
    public void index() {
        renderFreeMarker("index.ftl");
    }


    //添加演员信息处理方法
    public void actForm() {
        System.out.println("hello upload");
        String chinese_name = getPara("chinese_name");
        String english_name = getPara("english_name");
        System.out.println(chinese_name);
        System.out.println("++++++++++++++++++++++++++++++++++++");
        System.out.println(english_name);
    }/*添加电影信息处理Action*/

    public void movieAction() {
        System.out.println("电影添加成功");
    }

    //文件的上传

    public void upload() {

        HttpServletRequest request = getRequest();
        String basePath = request.getContextPath();
        //存储路径
        String path = getSession().getServletContext().getRealPath(Preference._PATH);
        UploadFile file = getFile("file");
        System.out.println(path);
        String fileName = "";
        if (file.getFile().length() > 200 * 1024 * 1024) {
            System.err.println("文件长度超过限制，必须小于200M");
        } else {
            //上传文件
            String type = file.getFileName().substring(file.getFileName().lastIndexOf(".")); // 获取文件的后缀
            fileName = System.currentTimeMillis() + type; // 对文件重命名取得的文件名+后缀
            String dest = path + "/" + fileName;
            file.getFile().renameTo(new File(dest));
            String realFile = basePath + "/" + Preference._PATH + fileName;
            String fname = "/" + fileName;
            setAttr("fname", fname);
            setAttr("url", realFile);

        }

        renderJson();
    }

    public void frame() {
        renderFreeMarker("frame.html");
    }
}
