package com.PSVM.dopamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join")
public class JoinController {
    @GetMapping("/join")
    public String joinForm(){
        return "joinForm";
    }
//    @PostMapping("/join")
//    public String join(){
//
//    }


}
