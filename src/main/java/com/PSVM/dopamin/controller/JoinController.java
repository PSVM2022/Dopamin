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

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;

    @InitBinder
    public void userDtoValidator(WebDataBinder binder){

    }


    @GetMapping("/join")
    public String joinForm(){
        return "joinForm_before";
    }

    @PostMapping("join")
    public String join(UserDto userDto, BindingResult result, UserPwdDto userPwdDto, String pwdCheck) throws UnsupportedEncodingException {
        System.out.println("result="+result);
        System.out.println("userDto="+userDto);
        System.out.println("userPwdDto="+userPwdDto);
        System.out.println("");
        //아이디 중복 체크
        //비밀번호 암호화 필요
        //비밀번호 확인
        if(!pwdCheck.equals(userPwdDto.getUser_pwd())){
            String msg = URLEncoder.encode("비밀번호를 잘못 입력했습니다.","utf-8");
            return "redirect:/join/join?msg="+msg;
        }

        //회원가입 성공
        userService.userJoin(userDto,userPwdDto);

        return "success_join";

    }


    @PostMapping("/join/idduplck")
    @ResponseBody
    public int idDuplicateCheck(@RequestBody Map map){

        String user_id = (String) map.get("user_id");
        System.out.println("id="+user_id);
        int count = userService.idDuplicateCheck(user_id);
        System.out.println("count="+count);
        return count;
    }

}
