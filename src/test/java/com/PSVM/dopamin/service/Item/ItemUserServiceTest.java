package com.PSVM.dopamin.service.Item;

import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import com.PSVM.dopamin.error.Message;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemUserServiceTest extends TestCase {

    @Autowired
    private ItemUserService itemUserService;
    @Test
    public void find_item_예외1(){
        //해당하는 아이템 번호가 없을 경우.
        int item_id=0;
        ItemDto itemDto=null;
        try {
            itemDto=itemUserService.find_item(item_id);
        } catch (Exception e) {
            assertTrue(itemDto==null);
        }
    }//완료
    @Test
    public void find_item_예외2(){
        //해당하는 아이템 번호는 있지만, 상태값이 0인 경우
        int item_id=1;
        ItemDto itemDto=null;
        try{
            itemDto=itemUserService.find_item(item_id);
        }catch(Exception e){
            assertTrue(itemDto==null);
//            System.out.println("e.getMessage() = " + e.getMessage());
        }
    }//완료
    @Test
    public void find_item_성공(){
        int item_id=2;
        ItemDto itemDto=null;
        try{
            itemDto=itemUserService.find_item(item_id);
            assertTrue((itemDto.getItem_id()==item_id)&&(itemDto.getStat()==1));
        }
        catch(Exception e){
        }
    }//완료
    @Test
    public void 장바구님_담기_실패(){
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        cart_itemDto.setCart_id(1);
        cart_itemDto.setIn_user("ldhoon0813");
        cart_itemDto.setUp_user("ldhoon0813");
        cart_itemDto.setItem_id(3);
        try {
            itemUserService.addCart(cart_itemDto);
        }catch(DuplicateKeyException e){
            System.out.println("이미 담겨져 있습니다.");
        }
        catch (Exception e) {
            System.out.println("e.getMessage() = " + e.getMessage());
        }
    }
    @Test
    @Transactional
    public void 장바구니_담기_성공(){
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        cart_itemDto.setCart_id(1);
        cart_itemDto.setIn_user("ldhoon0813");
        cart_itemDto.setUp_user("ldhoon0813");
        cart_itemDto.setItem_id(3);
        try{
            itemUserService.addCart(cart_itemDto);
            System.out.println("장바구니에 성공적으로 담겼습니다.");
        }catch(Exception e){
        }
    }
    @Test
    //@Transactional
    public void testBuy_item(){
        try {
            List<OrderDto> orderDtoList=new ArrayList<>();
            OrderDto orderDto1=new OrderDto(13,"이동훈",2000);
            orderDto1.setUser_id("ldhoon0813");

            OrderDto orderDto2=new OrderDto(14,"이동훈",2000);
            orderDto2.setUser_id("ldhoon0813");

            orderDtoList.add(orderDto1);
            orderDtoList.add(orderDto2);

            int result=itemUserService.buy_item(orderDtoList,"ldhoon0813",2);
        } catch (Exception e) {
            e.getMessage();
            System.out.println("e = " + e.getMessage());
        }
    }
}