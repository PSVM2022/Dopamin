package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.dao.Item.ItemUserDaoImpl;
import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import com.PSVM.dopamin.error.Message;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static org.junit.Assert.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemUserDaoImplTest {

    @Autowired
    ItemUserDaoImpl itemUserDaoImpl;

    @Test
    public void 아이템_전체_가져오기() throws Exception{
        List<ItemDto> list=itemUserDaoImpl.getItem_list();
        System.out.println("list.size() = " + list.size());
    }
    @Test
    @Transactional
    public void 장바구니_삭제() throws Exception{
        int item_id=14;
        int cart_id=2;
        Map map=new HashMap<>();
        map.put("item_id",item_id);
        map.put("cart_id",cart_id);
        int result=itemUserDaoImpl.delete_cart(map);
        assertTrue(result==1);
    }
    @Test
    public void find_item_실패() {
        int item_id=16;
        int find_result= 0;
        try {
            itemUserDaoImpl.find_item(item_id);
        } catch (Exception e) {
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            System.out.println("message = " + message);
            System.out.println("e.getMessage() = " + e.getMessage());
            assertTrue(find_result==0);
        }
    }
    @Test
    public void find_item_성공() throws Exception{
        int item_id=4;
        ItemDto itemDto=itemUserDaoImpl.find_item(item_id);
        assertTrue(itemDto.getItem_id()==item_id);
        assertTrue(itemDto.getStat()==0);
//        System.out.println("itemDto.getItem_id() = " + itemDto.getItem_id());
//        System.out.println("itemDto.getStat() = " + itemDto.getStat());
    }

    @Test
    public void 장바구니_가져오기() throws Exception{
        int cart_id=2;
        List<ItemDto> cart_list=itemUserDaoImpl.getCart_list(cart_id);
        System.out.println("cart_list = " + cart_list);
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
    @Transactional
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
    @Test
    public void 보유_착용상태_여부_성공() throws Exception{
        OrderDto orderDto=new OrderDto(13,"ldhoon0813");     
        int equip_stat= itemUserDaoImpl.getStat_from_possesion(orderDto);
        assertTrue(equip_stat==-1);
    }
    @Test
    @Transactional
    public void 환불_유저포인트_증가_성공() throws Exception{
        
        int point=itemUserDaoImpl.getUser_point("ldhoon0813");
        int total_point=point+2000;
        ConcurrentHashMap point_map=new ConcurrentHashMap();
        point_map.put("user_id","ldhoon0813");
        point_map.put("total_point",total_point);
        int result=itemUserDaoImpl.increase_userPoint(point_map);
        assertTrue(result==1);
    }
    @Test
    @Transactional
    public void 보유목록에서_삭제_성공() throws Exception{
        OrderDto orderDto=new OrderDto(13,"ldhoon0813");
        int delete_result=itemUserDaoImpl.delete_in_possesion(orderDto);
        assertTrue(delete_result==1);
    }
    @Test
    @Transactional
    public void 거래내역_환불정보_성공() throws Exception{
        OrderDto orderDto= new OrderDto();
        orderDto.setItem_id(13);
        orderDto.setItem_price(2000);
        orderDto.setUser_id("ldhoon0813");
        int result=itemUserDaoImpl.exchange_insert_deal_detl(orderDto);
        assertTrue(result==1);
    }
    @Test
    @Transactional
    public void 포인트사용내역_환불정보_성공() throws Exception{
        OrderDto orderDto= new OrderDto();
        orderDto.setItem_id(13);
        orderDto.setItem_price(2000);
        orderDto.setUser_id("ldhoon0813");
        int result=itemUserDaoImpl.exchange_insert_pnt_detl(orderDto);
        assertTrue(result==1);
    }
    @Test
    @Transactional//이거 없이 담으려면 Duplicate에러 발생
    public void 장바구니_담기_성공() throws Exception{
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        cart_itemDto.setCart_id(1);
        cart_itemDto.setIn_user("ldhoon0813");
        cart_itemDto.setUp_user("ldhoon0813");
        cart_itemDto.setItem_id(17);
        int result=itemUserDaoImpl.addCart(cart_itemDto);
        System.out.println("result = " + result);
    }
    @Test
    public void 보유목록에서찾기_성공() throws Exception{
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        cart_itemDto.setCart_id(1);
        cart_itemDto.setIn_user("ldhoon0813");
        cart_itemDto.setUp_user("ldhoon0813");
        cart_itemDto.setItem_id(2);
        Cart_ItemDto ci= itemUserDaoImpl.find_possesion(cart_itemDto);
        assertTrue(ci.getItem_id()==2);
    }
    @Test
    public void 보유목록에서찾기_실패() throws Exception{
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        cart_itemDto.setCart_id(1);
        cart_itemDto.setIn_user("ldhoon0813");
        cart_itemDto.setUp_user("ldhoon0813");
        cart_itemDto.setItem_id(3);
        Cart_ItemDto ci= itemUserDaoImpl.find_possesion(cart_itemDto);
        assertTrue(ci==null);
    }
}