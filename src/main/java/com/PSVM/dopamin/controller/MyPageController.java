package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPageDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;
import com.PSVM.dopamin.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService myPageService;

    @GetMapping("/contents/{cnts_id}")
    public String test(@PathVariable Integer cnts_id, Model m, HttpServletRequest request){
        login(request);
        m.addAttribute("cnts_id","cnts_id");
        return "testcnts";
    }

    public void login(HttpServletRequest request) {
        //임시로 session에 id넣기
        //  세션 객체를 얻어오기
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", "aaaa");
    }

    // MyPage 메인 화면
    @GetMapping("")
    public String myPage(HttpServletRequest request, HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        MyPageDto myPageDto = myPageService.selectMyInfo(user_id);
        m.addAttribute("myPageDto", myPageDto);
        return "myPageMain";
    }

    //한줄평 리스트 가져오기
    @GetMapping("/revw")
    public String readRevwList(HttpServletRequest request, HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        List<RevwDto> revwDtoList = myPageService.revwList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "revw";
    }

    // 평가된 한줄평 가져오기
    @GetMapping("/revwrt")
    public String readRevwRtList(HttpServletRequest request, HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        List<RevwDto> revwDtoList = myPageService.revwRtList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "revwrt";
    }

    //컨텐츠 찜 목록 가져오기
    @GetMapping("/cntswish")
    public String readCntsWishList(HttpServletRequest request, HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsWishList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "cntswish";
    }

    //컨텐츠 조회 기록 목록 가져오기
    @GetMapping("/cntsview")
    public String readCntsViewList(HttpServletRequest request, HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsViewList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "cntsview";
    }

    //게시글 목록 가져오기
    @GetMapping("/post")
    public String readPostList(HttpServletRequest request,HttpSession session, Model m) throws Exception {
        login(request);
        String user_id = (String) session.getAttribute("id");
        List<MyPagePostDto> postDtoList = myPageService.postList(user_id);
        m.addAttribute("postDtoList", postDtoList);
        return "post";
    }

}
