package com.PSVM.dopamin.repository;

import com.PSVM.dopamin.domain.ItemDto;
import junit.framework.TestCase;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemDaoImplTest{
    @Autowired
    private ItemDaoImpl itemDaoImpl;
    @Test
    public void testSelectPage() throws Exception{
        int page=1;
        int pageSize=10;
        Map map = new HashMap();
        map.put("offset",(page-1)*pageSize);
        map.put("pageSize",pageSize);
        List<ItemDto> list=itemDaoImpl.selectPage(map);
        assertTrue(list.size()==2);
    }
    @Test
    public void testRegister() throws Exception{
        ItemDto itemDto = new ItemDto((Integer)2,(Integer) 2,"테두리빛나기","화려하게 당신의 테두리가 화려하게 빛납니다. 프로필이라도 빛나봐요.",new BigDecimal(2000),"빛나기URL",new Timestamp(System.currentTimeMillis()),"후후른훈");
        System.out.println(itemDto.toString());
        Map map = new HashMap();
        map.put("writer_id","ldhoon0813");
        map.put("itemDto",itemDto);
        int rowCnt=itemDaoImpl.register(map);
        assertTrue(rowCnt==1);
    }
}