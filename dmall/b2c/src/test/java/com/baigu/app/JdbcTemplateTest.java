package com.baigu.app;

import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.test.SpringTestSupport;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.util.HashMap;
import java.util.Map;

/**
 * create by xt on 2018-07-19 9:58
 */
@Rollback(false)
public class JdbcTemplateTest  extends SpringTestSupport {

    @Autowired
    IDaoSupport daoSupport;

    @Test
    public void test() throws Exception {
        String parentIds = "1,30";
        String month = "201807";
        daoSupport.execute("update es_month_sale set team_sale = team_sale + 60 where month = "+month+"  and member_id in ("+parentIds+")");
    }
}
