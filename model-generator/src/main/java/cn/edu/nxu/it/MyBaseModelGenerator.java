package cn.edu.nxu.it;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.generator.BaseModelGenerator;
import com.jfinal.template.Engine;

public class MyBaseModelGenerator extends BaseModelGenerator {
    public MyBaseModelGenerator(String baseModelPackageName, String baseModelOutputDir) {
        super(baseModelPackageName, baseModelOutputDir);
    }

    @Override
    protected void initEngine() {
        engine = new Engine();
        //engine.setToClassPathSourceFactory();	// 从 class path 内读模板文件
        engine.setBaseTemplatePath(PathKit.getRootClassPath());
        engine.addSharedMethod(new StrKit());
        engine.addSharedObject("getterTypeMap", getterTypeMap);
        engine.addSharedObject("javaKeyword", javaKeyword);
    }
}
