package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.domain.User.UserDtoValidator;
import com.PSVM.dopamin.domain.User.UserValidatorException;
//import com.PSVM.dopamin.service.MailSendService;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;
//    @Autowired
//    MailSendService mailSendService;

    @ExceptionHandler(UserValidatorException.class)
    @ResponseBody
    public Map catcher1(UserValidatorException ve) {
        return ve.getError_msg();
    }

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseBody
    public Map catcher2(DuplicateKeyException de) {
        Map error_msg = new HashMap();
        error_msg.put("id_dupl_err", de.getMessage());
        return error_msg;
    }

    @InitBinder
    public void userDtoValidator(WebDataBinder binder) {
        binder.setValidator(new UserDtoValidator());
    }

    @GetMapping("/join")
    public String joinForm() {
        return "Login/joinForm";
    }

    @ResponseBody
    @PostMapping("/idduplck")
    public Map test(@RequestParam("id") String id) {
        String msg;
        System.out.println(id);
        System.out.println("id = " + id);
        Map result = new HashMap();
        if (id.equals("")) {
            msg = "아이디를 입력하세요.";
        } else {
            int count = userService.idDuplicateCheck(id);
            System.out.println("userService.idValidCheck(id) = " + userService.idValidCheck(id));
            msg = (userService.idValidCheck(id) && count == 0 ? "사용 가능한 아이디입니다." : "사용 불가한 아이디입니다.");
        }


        return (Map) result.put("msg",msg);

    }

    @PostMapping("/join")
    @ResponseBody
    public Map join(@Valid @RequestBody UserDto userDto, BindingResult result, String pwdCheck) throws UserValidatorException, DuplicateKeyException {
        try {
            System.out.println("pwdCheck = " + pwdCheck);
            //검증 실패면
            if (result.hasErrors()) {
                throw new UserValidatorException(result, "검증 실패");
            }
            //회원가입 성공
            userService.joinUser(userDto);

        } catch (DuplicateKeyException de) {
            throw new DuplicateKeyException("중복된 아이디입니다.");
        }
        Map map = new HashMap();
        map.put("successJoin", "축하드립니다! 도파민 회원가입을 완료했습니다!");
        return map;
    }

    @PostMapping("/survey")
    public String surveyGenre(UserDto userDto, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpSession session) {

        try {
            int i = userService.surveyGenre(userDto);
            session.removeAttribute("SURVEY");
            redirectAttributes.addFlashAttribute("SUR_SUCCESS", "설문 조사에 응답해주셔서 감사합니다.");

        } catch (NullPointerException ne) {
            redirectAttributes.addFlashAttribute("SUR_ERR", ne.getMessage());
        }
        return "redirect:/";
    }

//    @GetMapping("/mailCheck")
//    @ResponseBody
//    public String mailCheck(@RequestParam(name = "email") String email){
//        System.out.println("이메일 인증 요청");
//        System.out.println("in method email = " + email);
//        return mailSendService.joinEmail(email);
//    }

}