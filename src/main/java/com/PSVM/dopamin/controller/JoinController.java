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

    @ExceptionHandler(UserValidatorException.class)
    @ResponseBody
    public Map catcher1(UserValidatorException ve) {
        return ve.getError_msg();
    }

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseBody
    public Map catcher2(DuplicateKeyException de){
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

    @PostMapping("/idduplck")
    public int idDuplCheck(@RequestBody String user_id,BindingResult result){
        int cnt = userService.idDuplicateCheck(user_id);
        return cnt;
    }

    @PostMapping("/join")
    @ResponseBody
    public Map join(@Valid @RequestBody UserDto userDto, BindingResult result) throws UserValidatorException ,DuplicateKeyException{
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
        map.put("successJoin","축하드립니다! 도파민 회원가입을 완료했습니다!");
        return map;
    }

    @PostMapping("/survey")
    public String surveyGenre(UserDto userDto,BindingResult bindingResult, RedirectAttributes redirectAttributes,HttpSession session){

        try{
            int i = userService.surveyGenre(userDto);
            session.removeAttribute("SURVEY");
            redirectAttributes.addFlashAttribute("SUR_SUCCESS","설문 조사에 응답해주셔서 감사합니다.");

        }catch (NullPointerException ne){
            redirectAttributes.addFlashAttribute("SUR_ERR",ne.getMessage());
        }
        return "redirect:/";
    }
}