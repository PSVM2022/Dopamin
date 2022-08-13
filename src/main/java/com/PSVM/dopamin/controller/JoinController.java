package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserPwdDto;
//import com.PSVM.dopamin.domain.UserValidator;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;
//
//    @InitBinder
//    public void userDtoValidator(WebDataBinder binder){
//        binder.setValidator(new UserValidator());
//    }


    @GetMapping("/join")
    public String joinForm(){
        return "joinForm";
    }

    @PostMapping("join")
    public String join(UserDto userDto, BindingResult result, UserPwdDto userPwdDto, String pwdCheck) throws UnsupportedEncodingException {
        //아이디 중복 체크
        //비밀번호 암호화 필요
        //비밀번호 확인
        if(!pwdCheck.equals(userPwdDto.getUser_pwd())){
            String msg = URLEncoder.encode("비밀번호를 잘못 입력했습니다.","utf-8");
            return "redirect:/join/join?msg="+msg;
        }

        //회원가입 성공
        userService.userJoin(userDto,userPwdDto);



        return "redirect:/login/login";

    }


    @PostMapping("/join/idduplck")
    @ResponseBody
    public int idDuplicateCheck(String id){
        System.out.println("중복체크id=:"+id);
        int i = userService.idDuplicateCheck(id);
        return ;
    }


}
