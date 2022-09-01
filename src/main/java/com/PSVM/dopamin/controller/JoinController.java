package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.domain.User.UserDtoValidator;
import com.PSVM.dopamin.domain.User.UserValidatorException;
import com.PSVM.dopamin.service.User.MailSendService;
import com.PSVM.dopamin.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    UserService userService;
    @Autowired
    MailSendService mailSendService;
    //인증번호. 그런데 로직이 이게 맞는건지 모르겠음. 추후 리펙토링 필요.
    private String mailAuthNum;

    @ExceptionHandler(UserValidatorException.class)
    @ResponseBody
    public Map catcher1(UserValidatorException ve) {
        //{"필드이름" : "에러 메세지",...}
        return ve.getError_msg();
    }

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseBody
    public Map catcher2(DuplicateKeyException de) {
        Map error_msg = new HashMap();
        error_msg.put("user_id", de.getMessage());
        return error_msg;
    }

    @InitBinder
    public void userDtoValidator(WebDataBinder binder) {
        binder.setValidator(new UserDtoValidator());
    }

    @GetMapping("/join")
    public String joinForm(HttpServletRequest request) {
        if(userService.loginCheck(request)){
           return "redirect:/";
        }

        return "Login/joinForm";
    }


    @PostMapping("/idduplicate")
    @ResponseBody
    public Map idDuplicateCheck(@RequestParam("id") String id) {
        System.out.println("id = " + id);
        String msg;
        Map result = new HashMap();
        try {
            if (id.equals("")) {
                System.out.println("샹");
                msg = "아이디를 입력하세요.";
            } else {
                System.out.println("왜");
                int count = 0;

                count = userService.idDuplicateCheck(id);
                System.out.println("count = " + userService.idDuplicateCheck(id));

                msg = (userService.idValidCheck(id) && count == 0 ? "사용 가능한 아이디입니다." : "사용 불가한 아이디입니다.");
            }
            result.put("msg", msg);
        } catch (Exception e){
            e.printStackTrace();

        }

        return result;

    }

    @PostMapping("/join")
    @ResponseBody
    public Map join(@Valid @RequestBody UserDto userDto, BindingResult result) throws UserValidatorException, DuplicateKeyException {
        try {
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
    public String surveyGenre(UserDto userDto, RedirectAttributes redirectAttributes, HttpSession session) {
        System.out.println("userDto = " + userDto);

        try {
            int i = userService.surveyDo(userDto);
            session.removeAttribute("SURVEY");
            redirectAttributes.addFlashAttribute("SUR_SUCCESS", "설문 조사에 응답해주셔서 감사합니다.");

        } catch (NullPointerException ne) {
            redirectAttributes.addFlashAttribute("SUR_ERR", ne.getMessage());
        }
        return "redirect:/";
    }


    @PostMapping("/email")
    @ResponseBody
    public Map sendEmail(@RequestParam("email") String email) throws Exception {
        System.out.println("이메일 인증 요청");
        System.out.println("email = " + email);
        //인증번호 반환
        mailAuthNum = mailSendService.joinEmail(email);

        Map map = new HashMap();
        map.put("msg", "인증번호가 전송되었습니다!");
        return map;
    }

    @PostMapping("/emailauth")
    @ResponseBody
    public Map authNumCheck(@RequestParam("authNum") String authNum) {
        System.out.println("authNum = " + authNum);
        System.out.println("mailAuthNum = " + mailAuthNum);
        Map result = new HashMap();

        //인증번호가 일치하면
        if (authNum.equals(mailAuthNum)) {
            result.put("msg", "SUCCESS");
        } else {
            result.put("msg", "FAIL");
        }
        return result;
    }

}