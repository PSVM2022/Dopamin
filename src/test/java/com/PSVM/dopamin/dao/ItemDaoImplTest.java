package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ItemDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.math.BigDecimal;
import java.sql.Timestamp;

import static org.junit.Assert.*;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemDaoImplTest {
    @Autowired
    ItemDaoImpl itemDaoImpl;

    @Test
    public void getCount() throws Exception {
        int rowcnt= itemDaoImpl.getCount();
        System.out.println(rowcnt);
    }
    @Test
    public void getUser_stat_0() throws Exception{
        int user_stat= itemDaoImpl.getUser_stat("ldhoon0813");
        assertTrue(user_stat==0);
    }
    @Test
    public void getUser_stat_X() throws Exception{
        int user_stat= itemDaoImpl.getUser_stat("aaaa");
        assertTrue(user_stat!=0);
    }
    @Test
    public void getUser_nic() throws Exception{
        String user_nic= itemDaoImpl.getUser_nic("ldhoon0813");
        assertTrue(user_nic.equals("후후른훈"));
    }
    @Test
    public void 신규아이템_등록() throws Exception{
        //신규 아이템을 등록하는데, 테스트에서는 독립적으로 작동해야하므로
        //테스트용으로 집어넣고자하는 아이템을 찾아서 있으면 지우고
        //없으면 바로 집어넣자 ㅎ
        String item_name="테두리뿌시기";
        String result=itemDaoImpl.test_select(item_name);
        if(result!=null) {
            itemDaoImpl.test_delete_item(item_name);
        }//테스트의 독립성을 위해 넣고자하는 데이터가 있으면 지우고 Insert를 한다.
        ItemDto itemDto=new ItemDto(2,"전설",item_name,"야 빡치면 뿌시지말고 스킨으로 뿌셔봐 뿌셔뿌셔",new BigDecimal(3000), "url","후후른훈",new Timestamp(System.currentTimeMillis()),"ldhoon0813","ldhoon0813");
        int result1=itemDaoImpl.registerItem(itemDto);
        assertTrue(result1==1);
    }
}