package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserDtoValidator;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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
        binder.setValidator(new UserDtoValidator());
    }


    @GetMapping("/join")
    public String joinForm(){
        return "joinForm";
    }

    @PostMapping("join")
    public String join(@Valid UserDto userDto, BindingResult result, String pwdCheck) throws UnsupportedEncodingException {
        System.out.println("result="+result);
        System.out.println("userDto="+userDto);
        System.out.println("");
        //아이디 중복 체크
        //비밀번호 암호화 필요
        //비밀번호 확인
        if(!pwdCheck.equals(userDto.getUser_pwd())){
            String msg = URLEncoder.encode("비밀번호를 잘못 입력했습니다.","utf-8");
            return "redirect:/join/join?msg="+msg;
        }

        //회원가입 성공
        userService.userJoin(userDto);

        return "success_join";

    }


    @PostMapping("/idduplck")
    @ResponseBody
    public int idDuplicateCheck(@RequestBody Map map,BindingResult result){
        System.out.println("result="+result);
        String user_id = (String) map.get("user_id");
        System.out.println("id="+user_id);
        int count = userService.idDuplicateCheck(user_id);
        System.out.println("count="+count);
        return count;
    }

}
