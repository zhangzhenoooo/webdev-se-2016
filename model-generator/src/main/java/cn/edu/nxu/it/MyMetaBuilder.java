package cn.edu.nxu.it;

import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.generator.MetaBuilder;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Rajab on 2017/05/02.
 */
public class MyMetaBuilder extends MetaBuilder {

    public MyMetaBuilder(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    public boolean isSkipTable(String tableName) {
        return tableName.startsWith("v_");
    }

    @Override
    protected ResultSet getTablesResultSet() throws SQLException {
        String schemaPattern = dialect instanceof OracleDialect ? dbMeta.getUserName() : null;
        // return dbMeta.getTables(conn.getCatalog(), schemaPattern, null, new String[]{"TABLE", "VIEW"});
        return dbMeta.getTables(conn.getCatalog(), "public", null, new String[]{"TABLE"});    // 不支持 view 生成
    }
}
