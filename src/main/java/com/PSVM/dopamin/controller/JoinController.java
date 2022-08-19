package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserDtoValidator;
import com.PSVM.dopamin.domain.ValidatorException;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;

    @ExceptionHandler(ValidatorException.class)
    @ResponseBody
    public Map catcher1(ValidatorException ve) {
        System.out.println(ve.getMessage());
        return ve.getError_msg();

    }


    @InitBinder
    public void userDtoValidator(WebDataBinder binder) {
        binder.setValidator(new UserDtoValidator());
    }


    @GetMapping("/join")
    public String joinForm() {
        return "joinForm";
    }

    @PostMapping("/join")
    public String join(@Valid @RequestBody UserDto userDto, BindingResult result) throws UnsupportedEncodingException, ValidatorException {
        System.out.println("userDto=" + userDto);
        System.out.println("result=" + result);
        System.out.println("");
        try {

            //비밀번호 확인
            //검증 실패면
            if (result.hasErrors()) {
                throw new ValidatorException(result, "검증 실패");
            }

            System.out.println("heehehehehe");
            //회원가입 성공
            int i = userService.joinUser(userDto);
            System.out.println("회원가입:"+i);
            return "success_join";
        } catch (DuplicateKeyException de) {
            de.printStackTrace();
        }
        return "success_join";

    }

    @PostMapping("/idduplck")
    @ResponseBody
    public int idDuplCheck(@RequestBody Map map){
        String user_id = (String) map.get("user_id");
        System.out.println("userId="+user_id);

        int cnt = userService.idDuplCk(user_id);
        return cnt;
    }
}