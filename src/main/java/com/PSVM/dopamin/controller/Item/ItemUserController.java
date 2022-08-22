package com.PSVM.dopamin.controller.Item;

import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import com.PSVM.dopamin.error.Message;
import com.PSVM.dopamin.service.Item.ItemUserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequestMapping(value="/item")
public class ItemUserController {
    //유저의 기능들-> 아이템 담기 + 아이템 조회.

    private ItemUserService itemUserService;
    public ItemUserController(ItemUserService itemUserService) {
        this.itemUserService = itemUserService;
    }

    //구매 버튼 클릭 시
    //일단 포인트가 충분한지 확인
    //만일 포인트가 부족하다면, 보유 포인트가 부족합니다. 포인트 충전하러 가시겠습니까? 예/아니오
    //    포인트가 충분하다면, 구매하시겠습니까? 예/아니오
    //                     구매가 되었다면? 1. 포인트 차감과 함께 구매한 아이템들은 장바구니에서 사라지는 동시에.
    //                                   2. 아이템 보유 목록과 거래내역에, 포인트 사용내역 추가되어야 함.
    @PostMapping("/buyCart")//장바구니에서 아이템 구매 시, 발생하는 사건들.
    @ResponseBody
    public void buy_item_in_Cart(@RequestBody List<OrderDto> orderDtoList, HttpSession session){
        try{
            int cart_id=2;
            String user_id="ldhoon0813";
            if(orderDtoList.size()==0 || orderDtoList==null){
                throw new Exception("구매할 아이템을 선택해주세요.");
            }
            itemUserService.buy_item(orderDtoList,user_id,cart_id);
            //뭔가 컨트롤러에서 다 처리하기에는 부담되는데
            //데이터들 싹다 모아 서비스단에서 처리하고
        }catch(Exception e){
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            System.out.println("message = " + message);
        }
    }
    @DeleteMapping("/deleteCart/{item_id}")//장바구니에서 유저가 아이템 삭제
    @ResponseBody
    public ResponseEntity<Object> delete_Cart(@PathVariable Integer item_id, HttpSession session){
        //cart_item은 (item_id,cart_id)가 PK
        //cart_id는 session으로부터 얻어올 수 있음
        //item_id는 장바구니에서 삭제 버튼 누를 때 넘어오게 하자.
        int cart_id=3;//원래는 세션에서 가지고 와야함. 하드코딩임

        try {
            if(!login_check()){
                throw new NullPointerException("로그인해야합니다.");
            }
            Map map=new HashMap<>();
            map.put("item_id",item_id);
            map.put("cart_id",cart_id);
            int delete_result=itemUserService.delete_cart(map);
            if(delete_result!=1){
                throw new Exception("삭제에 실패했습니다.");
            }
            return new ResponseEntity<Object>("DELETE_OK",HttpStatus.OK);
        } catch (Exception e) {
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            return new ResponseEntity<Object>(message,HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/addCart/{item_id}")//장바구니에 아이템 담기
    @ResponseBody
    public ResponseEntity<String> add_Cart(@PathVariable Integer item_id){
        //세션에서 cart_id 받는다. 지금은 세션이 없으니깐, 임시로 cart_id 하드코딩
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        try {
            int find_result=0;
            int cart_id=2;//세션에서 받아오기-> 지금은 하드코딩
            cart_itemDto.setCart_id(cart_id);
            String user_id="ldhoon0813";//세션에서 받아오기 -> 하드코딩
            cart_itemDto.setIn_user(user_id);
            cart_itemDto.setUp_user(user_id);
            //없는 경우
            find_result=itemUserService.find_item(item_id);
            if(find_result==0){//일반적으로 담기는 유저가 클릭해서 담지만
                //만약에 없는 아이템 번호에 대해, 혹은 비공개인 아이템 번호에 대해
                //url에 적어서 들어온다면 "없는 아이템입니다".라는 메시지 반환해야함.
                throw new Exception("없는 아이템 입니다.");
            }//없으면 널포인트 익센션 터짐
            int item_stat=itemUserService.getItem_stat(item_id);
            if(item_stat==0){
                throw new Exception("없는 아이템입니다.");
            }
            cart_itemDto.setItem_id(item_id);

            int result=itemUserService.addCart(cart_itemDto);
            if(result!=1){
                throw new Exception("담아지지 않았습니다.");
            }
            return new ResponseEntity<>("ADD_CART_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ADD_CART_FAILED", HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping("/cart")//장바구니 조회
    @ResponseBody
    public ResponseEntity<Object> cart_list(HttpSession session){
        //1. 세션에 "유저"의 "장바구니번호"를 가져온다.
//        int cart_id=session.getAttribute("ldhoon0813"); //
        int cart_id=2; //-> 지금은 하드코딩

        //url로 그냥 들어오는 경우는 어떻게 처리할 것인가? login_check 함수로 체크하자.
        if(login_check()){
            throw new NullPointerException("로그인해야합니다.");
        }//지금은 로그인이 항상 되어있다는 가정하에 진행. 추후, 수정해야함.

        //장바구니에 들어있는 아이템 정보들을 다 가져와야함.
        //장바구니_아이템 테이블과 아이템 테이블 아이템_아이디 로 조인해서 원하는 값만 뽑아내자.
        //가져와야하는 정보들: 아이템_아이디, 리스트_아이디, 등급_이름, 아이템_이름, 아이템_설명, 아이템_가격, 아이템_이미지
        try {
            List<ItemDto> list=itemUserService.getCart_list(cart_id);
            return new ResponseEntity<Object>(list, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Object>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
        //없으면 없는대로 보여주면 됨.
    }
    private boolean login_check() {
        return false;
    }
}
