package com.PSVM.dopamin.controller.Item;

import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import com.PSVM.dopamin.error.Message;
import com.PSVM.dopamin.service.Item.ItemUserService;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/item")
public class ItemUserController {
    //유저의 기능들-> 아이템 담기 + 아이템 조회.

    private ItemUserService itemUserService;
    public ItemUserController(ItemUserService itemUserService) {
        this.itemUserService = itemUserService;
    }
    @Autowired
    UserService userService;
    //환불 버튼 클릭시
    //프런트에서 받아올 데이터는, item_id, item_price 이렇게만 받아오면 될듯.
    @PostMapping("/exchangeItem")
    @ResponseBody
    public String exchange_Item(@RequestBody OrderDto orderDto, HttpSession session, HttpServletRequest request){
        //로그인 체크해야함.지금은 하드코딩
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id= (String) session.getAttribute("USERID");
        try{
            orderDto.setUser_id(user_id);
            int item_stat=itemUserService.getStat_from_possesion(orderDto);
            if(item_stat!=-1){
                throw new Exception("사용하신 아이템은 환불이 불가능합니다.");
            }
            boolean result=itemUserService.exchange_item(orderDto);
            if (!result) {
                throw new Exception("환불에 실패했습니다.");
            }
        }catch (Exception e){
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
        }

        return null;
    }

    //구매 버튼 클릭 시
    //일단 포인트가 충분한지 확인
    //만일 포인트가 부족하다면, 보유 포인트가 부족합니다. 포인트 충전하러 가시겠습니까? 예/아니오
    //    포인트가 충분하다면, 구매하시겠습니까? 예/아니오
    //                     구매가 되었다면? 1. 포인트 차감과 함께 구매한 아이템들은 장바구니에서 사라지는 동시에.
    //                                   2. 아이템 보유 목록과 거래내역에, 포인트 사용내역 추가되어야 함.
    @PostMapping("/buyCart")//장바구니에서 아이템 구매 시, 발생하는 사건들.
    @ResponseBody
    public ResponseEntity<Object> buy_item_in_Cart(@RequestBody List<OrderDto> orderDtoList, HttpSession session){
        try{
            for(OrderDto orderDto:orderDtoList)
            {
                System.out.println("orderDto = " + orderDto);
            }
            int cart_id= (int) session.getAttribute("CARTID");
            String user_id= (String) session.getAttribute("USERID");
            if(orderDtoList.size()==0 || orderDtoList==null){
                throw new Exception("구매할 아이템을 선택해주세요.");
            }
            itemUserService.buy_item(orderDtoList,user_id,cart_id);
            //뭔가 컨트롤러에서 다 처리하기에는 부담되는데
            //데이터들 싹다 모아 서비스단에서 처리하고
            return new ResponseEntity<>("BUY_OK", HttpStatus.OK);
        }catch(Exception e){
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            return new ResponseEntity<>(message, HttpStatus.BAD_REQUEST);
        }
    }
    @DeleteMapping("/deleteCart/{item_id}")//장바구니에서 유저가 아이템 삭제
    @ResponseBody
    public ResponseEntity<Object> delete_Cart(@PathVariable Integer item_id, HttpSession session){
        //cart_item은 (item_id,cart_id)가 PK
        //cart_id는 session으로부터 얻어올 수 있음
        //item_id는 장바구니에서 삭제 버튼 누를 때 넘어오게 하자.
        int cart_id= (int) session.getAttribute("CARTID");//원래는 세션에서 가지고 와야함. 하드코딩임
        try {
            Map map=new HashMap<>();
            map.put("item_id",item_id);
            map.put("cart_id",cart_id);
            int delete_result=itemUserService.delete_cart(map);
            if(delete_result!=1){
                throw new Exception("삭제에 실패했습니다.");
            }
            return new ResponseEntity<Object>("장바구니에서 제거되었습니다.",HttpStatus.OK);
        } catch (Exception e) {
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            return new ResponseEntity<Object>(message,HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/addCart/{item_id}")//장바구니에 아이템 담기
    @ResponseBody
    public ResponseEntity<String> add_Cart(@PathVariable Integer item_id,HttpSession session){
        //세션에서 cart_id 받는다. 지금은 세션이 없으니깐, 임시로 cart_id 하드코딩
        Cart_ItemDto cart_itemDto=new Cart_ItemDto();
        try {
            int find_result=0;
            int cart_id= (int) session.getAttribute("CARTID");//세션에서 받아오기-> 지금은 하드코딩
            cart_itemDto.setCart_id(cart_id);
            String user_id= (String) session.getAttribute("USERID");
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
            return new ResponseEntity<>("장바구니에 추가되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            return new ResponseEntity<>("이미 담겨져있습니다.", HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping("/cart")//장바구니 조회
    public String cart_list(Model m, HttpSession session,HttpServletRequest request){
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        //1. 세션에 "유저"의 "장바구니번호"를 가져온다.
//        int cart_id=session.getAttribute("ldhoon0813"); //
        int cart_id= (int) session.getAttribute("CARTID");
        String user_id= (String) session.getAttribute("USERID");
        //url로 그냥 들어오는 경우는 어떻게 처리할 것인가? login_check 함수로 체크하자.
        //장바구니에 들어있는 아이템 정보들을 다 가져와야함.
        //장바구니_아이템 테이블과 아이템 테이블 아이템_아이디 로 조인해서 원하는 값만 뽑아내자.
        //가져와야하는 정보들: 아이템_아이디, 리스트_아이디, 등급_이름, 아이템_이름, 아이템_설명, 아이템_가격, 아이템_이미지
        try {//지금은 로그인이 항상 되어있다는 가정하에 진행. 추후, 수정해야함.
            int my_point= itemUserService.getUser_point(user_id);
            int total_point=0;
            List<ItemDto> list=itemUserService.getCart_list(cart_id);
            if(list.size()==0){
                throw new Exception("보여줄 아이템이 없습니다.");
            }
            for(ItemDto itemDto:list){
                total_point+=itemDto.getItem_price();
            }
            m.addAttribute("list",list);
            m.addAttribute("my_point",my_point);
            m.addAttribute("total_point",total_point);
            m.addAttribute("after_point",my_point-total_point);
            return "Item/cart";
        } catch (Exception e) {
            Message message = Message.builder()
                    .message1(e.getMessage())
                    .build();
            return "Item/cart";
        }
        //없으면 없는대로 보여주면 됨.
    }
}
