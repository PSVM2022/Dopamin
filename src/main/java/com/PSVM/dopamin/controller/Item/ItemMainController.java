package com.PSVM.dopamin.controller.Item;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/item")
public class ItemMainController {

    @GetMapping("/item")
    public String item_main(HttpSession session){
        return "Item/new_itemMain";
    }
    @GetMapping("/cart")
    public String cart_main(HttpSession session) {return "Item/new_cart";}
}