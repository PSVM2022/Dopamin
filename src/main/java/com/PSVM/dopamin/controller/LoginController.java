package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        if(userService.loginCheck(request)){
            return "redirect:"+toURL;
        }
        return "Login/loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,String toURL){
        //Httpsession을 매개변수로 받아올 때,
        //기존에 세션이 존재했다면 그 세션을 가져오지만!! 기존에 세션이 없으면 세션을 새로 생성함.
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        //세션 삭제
        session.invalidate();
        return "redirect:"+toURL;
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, HttpServletRequest request, Model model, boolean rememberId, boolean rememberLogin, HttpServletResponse response) throws Exception {
        try{
            //아이디, 비밀번호 일치 확인
            boolean result = userService.idPwdCheck(id,pwd);
            if(!result){
                throw new NullPointerException("존재하지 않는 유저입니다.");
            }
        }catch (NullPointerException ne){
            String msg = URLEncoder.encode(" 아이디 또는 비밀번호를 잘못 입력했습니다.\n" +
                    "입력하신 내용을 다시 확인해주세요.","utf-8");
            model.addAttribute("id",id);
            model.addAttribute("msg",msg);
            return "redirect:/login/login";
        }
//        id, pwd 일치하면 로그인 성공 ,세션 생성
        HttpSession session = request.getSession();
        //  세션 객체에 저장할 정보 - user_id, 장바구니_id, 유저 상태(관리자인지 일반유저인지), 설문조사 했는지 안했는지 여부
        UserDto user = userService.getUser(id);
        session.setAttribute("USERID", id);
        String cartId = userService.getCartId(id);
        session.setAttribute("CARTID",cartId);
        session.setAttribute("USERSTAT",user.getUser_stat());
        //설문조사 안했으면 세션에 SURVEY 생성
        if(user.getFav_genre1()==null){
            session.setAttribute("SURVEY",false);
        }

        if(rememberId){
            //아이디 쿠키 생성
            Cookie cookie = new Cookie("id",id);
            response.addCookie(cookie);
        }else{
            //쿠키 삭제
            Cookie cookie = new Cookie("id","");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        if(rememberLogin){
            session.setMaxInactiveInterval(60);
        }
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }
}
