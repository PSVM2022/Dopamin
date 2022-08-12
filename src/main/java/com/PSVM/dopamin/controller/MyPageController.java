package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.RevwDto;
import com.PSVM.dopamin.service.MyPageService;
import com.PSVM.dopamin.service.MyPageServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService MyPageService;

    @GetMapping("/revw/{userId}")
    public String viewRevw(@PathVariable String userId, Model m) throws Exception{
        List<RevwDto> revwDtoList = MyPageService.revwList(userId);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "home";

    }







}
