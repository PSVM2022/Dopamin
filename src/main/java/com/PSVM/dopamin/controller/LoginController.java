package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserService userService;

//    @ExceptionHandler(NullPointerException.class)
//    public String catcher(){
//
//    }

    @GetMapping("/login")
    public String loginForm(HttpServletRequest request,String toURL){
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;

        //로그인 되어있다면
        if(loginCheck(request)){
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
    public String login(String id, String pwd, String toURL, HttpServletRequest request, Model model) throws Exception {
        try{
            //아이디, 비밀번호 일치 확인
            boolean result = userService.idPwdCheck(id,pwd);
            if(!result){
                throw new NullPointerException("존재하지 않는 유저입니다.");
            }
        }catch (NullPointerException ne){
            System.out.println("에러메세지="+ne.getMessage());
            String msg = URLEncoder.encode(" 아이디 또는 비밀번호를 잘못 입력했습니다.\n" +
                    "입력하신 내용을 다시 확인해주세요.","utf-8");
            model.addAttribute("id",id);
            return "redirect:/login/login?msg="+msg;

        }
//        id, pwd 일치하면 로그인 성공
//        세션 생성
        HttpSession session = request.getSession();
        //  세션 객체에 저장할 정보 - user_id, 장바구니_id, 유저 상태(관리자인지 일반유저인지), 설문조사 했는지 안했는지 여부
        session.setAttribute("user_id", id);
        String cartId = userService.getCartId(id);
        session.setAttribute("cart_id",cartId);


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



}
