package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserDtoValidator;
import com.PSVM.dopamin.domain.UserValidatorException;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;


import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;

    @ExceptionHandler(UserValidatorException.class)
    @ResponseBody
    public Map catcher1(UserValidatorException ve) {
        System.out.println(ve.getMessage());
        return ve.getError_msg();
    }

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseBody
    public Map catcher2(DuplicateKeyException de){
        System.out.println("dublicaeException!!");
        Map error_msg = new HashMap();
        error_msg.put("id_dupl_err", de.getMessage());
        return error_msg;
    }


    @InitBinder
    public void userDtoValidator(WebDataBinder binder) {
        binder.setValidator(new UserDtoValidator());
    }

    @GetMapping("/success")
    public String successJoin(){
        return "success_join";
    }
    @GetMapping("/join")
    public String joinForm() {
        return "joinForm";
    }

    @PostMapping("/join")
    public String join(@Valid @RequestBody UserDto userDto, BindingResult result) throws UnsupportedEncodingException, UserValidatorException {
        System.out.println("userDto=" + userDto);
        System.out.println("result=" + result);
        System.out.println("");
        try {

            //비밀번호 확인
            //검증 실패면
            if (result.hasErrors()) {
                throw new UserValidatorException(result, "검증 실패");
            }

            System.out.println("heehehehehe");
            //회원가입 성공
            int i = userService.joinUser(userDto);
            System.out.println("회원가입:"+i);

        } catch (DuplicateKeyException de) {
            System.out.println("예외 발생~~~");
            throw new DuplicateKeyException("중복된 아이디입니다.");
        }
        System.out.println("dddddd");
        return "success_join";

    }

    @PostMapping("/idduplck")
    @ResponseBody
    public int idDuplCheck(@RequestBody String user_id,BindingResult result){
        System.out.println("result = " + result);
        System.out.println("user_id = " + user_id);

        int cnt = userService.idDuplCk(user_id);
        System.out.println("cnt = " + cnt);
        return cnt;
    }
}