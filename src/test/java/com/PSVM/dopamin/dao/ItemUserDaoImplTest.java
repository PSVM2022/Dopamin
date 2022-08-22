package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.dao.Item.ItemUserDaoImpl;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

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
    public void find_item_성공() throws Exception{
        int item_id=4;
        int find_result=itemUserDaoImpl.find_item(item_id);
        assertTrue(find_result==item_id);
    }
    @Test
    public void item_stat_비공개() throws Exception{
        int item_id=13;
        int item_stat=itemUserDaoImpl.getItem_Stat(item_id);
        assertTrue(item_stat==0);
    }
    @Test
    public void item_stat_공개() throws Exception{
        int item_id=4;
        int item_stat=itemUserDaoImpl.getItem_Stat(item_id);
        assertTrue(item_stat==1);
    }

    @Test
    public void 장바구니_가져오기() throws Exception{
        int cart_id=2;
        List<ItemDto> cart_list=itemUserDaoImpl.getCart_list(cart_id);
        System.out.println(cart_list.size());
    }
//    @Test
//    @Transactional
//    public void 장바구니_구매완료시_목록에서_삭제() throws Exception{
//        int cart_id=2;
//        List<Integer> buy_item=new ArrayList<>();
//        buy_item.add(13);
//        buy_item.add(14);
//        ConcurrentHashMap map=new ConcurrentHashMap();
//        map.put("buy_item",buy_item);
//        map.put("cart_id",cart_id);
//        int buy_delete_result= itemUserDaoImpl.buy_item_in_Cart(map);
//        assertTrue(buy_delete_result==buy_item.size());
//    }
    @Test
    public void 유저_포인트_가져오기() throws Exception{
        String user_id="ldhoon0813";
        int get_point= itemUserDaoImpl.getUser_point(user_id);
        assertTrue(get_point!=0);
    }
    @Test
    @Transactional
    public void 유저_포인터_업데이트() throws Exception{
        String user_id="ldhoon0813";
        int remain_point=101010;
        ConcurrentHashMap user_map=new ConcurrentHashMap<>();
        user_map.put("user_id",user_id);
        user_map.put("remain_point",remain_point);
        int update_point= itemUserDaoImpl.updateUser_point(user_map);
        assertTrue(update_point==1);
    }
    @Test
//    @Transactional
    public void 보유_insert() throws Exception{
        //있으면 삭제하는 메서드 추가되어야함.
        List<OrderDto> orderDtoList=new ArrayList<>();
        OrderDto orderDto1=new OrderDto(13,"이동훈",2000);
        orderDto1.setUser_id("ldhoon0813");

        OrderDto orderDto2=new OrderDto(14,"이동훈",2000);
        orderDto2.setUser_id("ldhoon0813");

        orderDtoList.add(orderDto1);
        orderDtoList.add(orderDto2);
//        System.out.println("orderDtoList = " + orderDtoList);
        int result=itemUserDaoImpl.add_item_to_user(orderDtoList);
//        System.out.println("result = " + result);
        assertTrue(result== orderDtoList.size());
    }
    @Test
    @Transactional
    public void 거래내역_insert() throws Exception{
        //보유내역에 있어야만 추가됨.
        List<OrderDto> orderDtoList=new ArrayList<>();
        OrderDto orderDto1=new OrderDto(13,"이동훈",2000);
        orderDto1.setUser_id("ldhoon0813");

        OrderDto orderDto2=new OrderDto(14,"이동훈",2000);
        orderDto2.setUser_id("ldhoon0813");

        orderDtoList.add(orderDto1);
        orderDtoList.add(orderDto2);

        int result=itemUserDaoImpl.add_deal_detl(orderDtoList);
        assertTrue(result== orderDtoList.size());
    }
    @Test
    @Transactional
    public void 포인트사용내역_insert() throws Exception{
        //보유내역에 있어야만 추가됨.
        List<OrderDto> orderDtoList=new ArrayList<>();
        OrderDto orderDto1=new OrderDto(13,"이동훈",2000);
        orderDto1.setUser_id("ldhoon0813");

        OrderDto orderDto2=new OrderDto(14,"이동훈",2000);
        orderDto2.setUser_id("ldhoon0813");

        orderDtoList.add(orderDto1);
        orderDtoList.add(orderDto2);

        int result=itemUserDaoImpl.pnt_use_detl(orderDtoList);
        assertTrue(result== orderDtoList.size());
    }
}