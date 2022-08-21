package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.Cart_ItemDto;
import com.PSVM.dopamin.service.ItemUserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value="/item")
public class ItemUserController {

    private ItemUserService itemUserService;
    public ItemUserController(ItemUserService itemUserService) {
        this.itemUserService = itemUserService;
    }
    @PostMapping("/addCart/{item_id}")
    @ResponseBody
    public ResponseEntity<String> addCart(@PathVariable Integer item_id, Cart_ItemDto cart_itemDto){
        //세션에서 cart_id 받는다. 지금은 세션이 없으니깐, 임시로 cart_id 하드코딩
        try {
            int find_result=0;
            int cart_id=2;
            cart_itemDto.setCart_id(cart_id);
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
}
