package com.PSVM.dopamin.service.Item;

import com.PSVM.dopamin.domain.Item.OrderDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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