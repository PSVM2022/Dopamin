package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.dao.Item.ItemAdminDaoImpl;
import com.PSVM.dopamin.domain.Item.ItemDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import static org.junit.Assert.*;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemAdminDaoImplTest {
    @Autowired
    ItemAdminDaoImpl itemAdminDaoImpl;

    @Test
    public void getCount() throws Exception {
        int rowcnt= itemAdminDaoImpl.getCount();
        System.out.println(rowcnt);
    }
    @Test
    public void getUser_stat_0() throws Exception{
        int user_stat= itemAdminDaoImpl.getUser_stat("ldhoon0813");
        assertTrue(user_stat==0);
    }
    @Test
    public void getUser_stat_X() throws Exception{
        int user_stat= itemAdminDaoImpl.getUser_stat("aaaa");
        assertTrue(user_stat!=0);
    }
    @Test
    public void getUser_nic() throws Exception{
        String user_nic= itemAdminDaoImpl.getUser_nic("ldhoon0813");
        assertTrue(user_nic.equals("후후른훈"));
    }
    @Test
    public void 신규아이템_등록() throws Exception{
        //신규 아이템을 등록하는데, 테스트에서는 독립적으로 작동해야하므로
        //테스트용으로 집어넣고자하는 아이템을 찾아서 있으면 지우고
        //없으면 바로 집어넣자 ㅎ
        String item_name="테두리뿌시기";
        String result= itemAdminDaoImpl.test_select(item_name);
        if(result!=null) {
            itemAdminDaoImpl.test_delete_item(item_name);
        }//테스트의 독립성을 위해 넣고자하는 데이터가 있으면 지우고 Insert를 한다.
        ItemDto itemDto=new ItemDto(2,"전설",item_name,"야 빡치면 뿌시지말고 스킨으로 뿌셔봐 뿌셔뿌셔",3000, "url","후후른훈",new Timestamp(System.currentTimeMillis()),"ldhoon0813","ldhoon0813");
        int result1= itemAdminDaoImpl.registerItem(itemDto);
        assertTrue(result1==1);
    }

    @Test
    @Transactional
    public void 삭제_성공() throws Exception{
        int result= itemAdminDaoImpl.remove(3);
        assertTrue(result==1);
    }
    @Test
    @Transactional
    public void 삭제_실패() throws Exception{
        int result= itemAdminDaoImpl.remove(0);
        assertTrue(result==0);
    }
    @Test
    @Transactional
    public void 수정_성공() throws Exception{
        ItemDto itemDto = new ItemDto(2,"우영우","박은빈팬이동훈",3000);
        int result= itemAdminDaoImpl.modify(itemDto);
        assertTrue(result==1);
    }
    //1이 공개 0이 비공개
    //공개를 비공개로 테스트시 유의해야할 점.
    //성공과 실패를 어떻게 나누어 기준으로 둘것인가?
    //예를 들어, 공개를 하는 것에 또 공개를 한다? -> 실패
    //없는 아이디를 비공개를 한다?-> 실패

    @Test
    @Transactional
    public void 공개를비공개로_성공()throws Exception{
        //item_id의 상태 확인. 만약에 상태가 0이라면 이미 비공개이니깐->실패
        //0이 아니라면 수행하고 결과값 보고 결정.
        int flag=0;
        //given
        List<ItemDto> list= itemAdminDaoImpl.getStat_1();
        for(int i=0;i<list.size();i++){
            int result= itemAdminDaoImpl.ShowToNoShow(list.get(i).getItem_id());
            if(result!=1){
                flag=1;
                break;
            }
        }
        assertTrue(flag==0);
    }
    @Test
    @Transactional
    public void 비공개를공개로_성공() throws Exception{
        int flag=0;
        //given
        List<ItemDto> list= itemAdminDaoImpl.getStat_0();
        for(int i=0;i<list.size();i++) {
            int result = itemAdminDaoImpl.ShowToNoShow(list.get(i).getItem_id());
            if (result != 1) {
                flag = 1;
                break;
            }
            assertTrue(flag == 0);
        }
    }
}