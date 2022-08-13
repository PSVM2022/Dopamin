package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserPwdDto;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String loginForm(HttpServletRequest request,String toURL){
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;

        //로그인 되어있다면
        if(loginCheck(request)){
            return "redirect:"+toURL;
        }
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,String toURL){
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;

        //세션 삭제
        session.invalidate();
        return "redirect:"+toURL;
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, HttpServletRequest request) throws Exception {

        //id, pwd 불일치, 로그인 실패
        if(!idPwdCheck(id,pwd)){
            String msg = URLEncoder.encode("아이디 또는 비밀번호를 잘못 입력했습니다.","utf-8");
            return "redirect:/login/login?msg="+msg;
        }
        //id, pwd 일치하면 로그인 성공
        //세션 생성
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", id);

        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        System.out.println("toURL="+toURL);
        return "redirect:"+toURL;

    }
    private boolean loginCheck(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        //로그인 안돼있음
        if(session==null)
            return false;
        else
            System.out.println("sessionId="+session.getAttribute("id"));
        return true;

    }


    private boolean idPwdCheck(String id, String pwd){
        //존재하지 않는 아이디면
        if(userService.getUserPwd(id)==null){
            return false;
        }
        return userService.getUserPwd(id).getUser_pwd().equals(pwd);
    }



}
