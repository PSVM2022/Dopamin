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

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService myPageService;

    // MyPage 메인 화면
    @GetMapping("")
    public String myPage(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        MyPageDto myPageDto = myPageService.selectMyInfo(user_id);
//        m.addAttribute("user_id", user_id);  <c:url 태그에서 session에 있는 id를 쓸 수 있으면 굳이 모델에 담지 않아도 된다.
        m.addAttribute("myPageDto", myPageDto);
        return "myPageMain";
    }

    //한줄평 리스트 가져오기
    @GetMapping("/revw")
    public String readRevwList(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        List<RevwDto> revwDtoList = myPageService.revwList(user_id);
//        m.addAttribute("user_id",user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "revw";
    }

    // 평가된 한줄평 가져오기
    @GetMapping("/revweval")
    public String readRevwEvalList(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        List<RevwDto> revwDtoList = myPageService.revwEvalList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "revweval";
    }

    //컨텐츠 찜 목록 가져오기
    @GetMapping("/cntswish")
    public String readCntsWishList(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsWishList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "cntswish";
    }

    //컨텐츠 조회 기록 목록 가져오기
    @GetMapping("/cntsview")
    public String readCntsViewList(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsViewList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "cntsview";
    }

    //게시글 목록 가져오기
    @GetMapping("/post")
    public String readPostList(HttpSession session, Model m) throws Exception {
        String user_id = (String) session.getAttribute("id");
        List<MyPagePostDto> postDtoList = myPageService.postList(user_id);
        m.addAttribute("postDtoList", postDtoList);
        return "post";
    }

}
