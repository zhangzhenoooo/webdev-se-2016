package cn.edu.nxu.it;

import com.alibaba.druid.pool.DruidDataSource;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.activerecord.generator.MetaBuilder;
import org.apache.commons.io.FilenameUtils;

import javax.sql.DataSource;

/**
 * Hello world!
 */
public class ModelGenerator {
    //生成模型代码
    public static void generateModels() {

        Prop prop = PropKit.use("myconfig.properties");
        // base cn.edu.nxu.it.model 所使用的包名
        String baseModelPackageName = "cn.edu.nxu.it.model.base";
        // base cn.edu.nxu.it.model 文件保存路径
        String baseModelOutputDir = FilenameUtils.normalize(PathKit.getRootClassPath() + "/../../../web-app/src/main/java/");

        // cn.edu.nxu.it.model 所使用的包名 (MappingKit 默认使用的包名)
        String modelPackageName = "cn.edu.nxu.it.model";
        baseModelOutputDir = baseModelOutputDir + baseModelPackageName.replace('.', '/');
        // cn.edu.nxu.it.model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
        String modelOutputDir = baseModelOutputDir + "/../";

        // 创建生成器
        Generator generator;//= new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
        // 添加不需要生成的表名
        generator = new Generator(getDataSource(), new MyBaseModelGenerator(baseModelPackageName, baseModelOutputDir),
                new com.jfinal.plugin.activerecord.generator.ModelGenerator(modelPackageName, baseModelPackageName, modelOutputDir));
        generator.setMetaBuilder(new MetaBuilder(getDataSource()) {
            @Override
            protected boolean isSkipTable(String tableName) {
                return tableName.startsWith("v_");

            }
        });

        generator.setDialect(new MysqlDialect());
        //设置要排除生成的表名

        // 设置是否在 Model 中生成 dao 对象
        generator.setGenerateDaoInModel(true);
        // 设置是否生成链式 setter 方法
        generator.setGenerateChainSetter(true);
        // 设置是否生成字典文件
        generator.setGenerateDataDictionary(true);
        // 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
        generator.setRemovedTableNamePrefixes("t_");
        // 生成
        generator.setGenerateRemarks(true);
        generator.setBaseModelTemplate("my_base_model_template.jtl");
        generator.generate();
    }


    private static DataSource getDataSource() {
        Prop prop = PropKit.use("myconfig.properties");
        //获取数据源

        DruidDataSource ds = new DruidDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl(PropKit.get("jdbc.url"));
        ds.setUsername(PropKit.get("jdbc.user"));
        ds.setPassword(PropKit.get("jdbc.password"));
        return ds;
    }

    public static void main(String[] args) {

        // System.out.println(PropKit.createGetReq("jdbc.url"));
        generateModels();


    }
}
