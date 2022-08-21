package com.PSVM.dopamin.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemUserDaoImplTest {

    @Autowired
    ItemUserDaoImpl itemUserDaoImpl;

    @Test
    public void find_item_실패() {
        int item_id=1;
        int find_result= 0;
        try {
            find_result = itemUserDaoImpl.find_item(item_id);
            if(find_result==0){
                throw new Exception("없습니다.");
            }
        } catch (Exception e) {
            //System.out.println("e.getMessage() = " + e.getMessage());
            assertTrue(find_result==0);
        }
    }
    @Test
    public void find_item_성공(){
        int item_id=4;
        int find_result=itemUserDaoImpl.find_item(item_id);
        assertTrue(find_result==item_id);
    }
    @Test
    public void item_stat_비공개(){
        int item_id=13;
        int item_stat=itemUserDaoImpl.getItem_Stat(item_id);
        assertTrue(item_stat==0);
    }
    @Test
    public void item_stat_공개(){
        int item_id=4;
        int item_stat=itemUserDaoImpl.getItem_Stat(item_id);
        assertTrue(item_stat==1);
    }
}