package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.ContentsWishDto;
import com.PSVM.dopamin.domain.PageHandler;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping()
public class ContentsController {

    @Autowired
    ContentsService contentsService;
    //@Autowired
    //ReviewService reviewService;

    /*임시 로그인 세션
    public void login(HttpServletRequest request) {
        //임시로 session에 id넣기
        //  세션 객체를 얻어오기
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", "sohyeon9253");
    }*/

    //예외처리
    @ExceptionHandler(Exception.class)
        public String catcher(Exception e) {
        e.printStackTrace();
        return "Contents/error";
    }

    //메인 페이지
    @GetMapping("/")
    public String contentsList(HttpServletRequest request, Model model) {
        String user_id = "sohyeon9253";
        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        model.addAttribute("cntsDtoList", cntsDtoList);
        //System.out.println("model: "+model);

        return "main";
    }

    //컨텐츠 상세 조회
    @GetMapping("/contents/{cnts_id}")
    public String contentsView(@PathVariable(required = false) Integer cnts_id, HttpServletRequest request, HttpSession session, Model model) {
        String user_id = "sohyeon9253";

        //로그인 세션 얻어옴
        //login(request);
        //String user_id = (String) session.getAttribute("id");
        //System.out.println("id = "+ user_id);

        //로그인 되지 않은 경우, 로그인 화면으로 리다이렉트(임시페이지)
        if(session==null) {
            return "Contents/loginAction";
        }

        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        try {
            ContentsDto contentsDto = contentsService.contentsView(cnts_id);
            model.addAttribute("contentsDto", contentsDto);

            ContentsWishDto contentsWishDto = new ContentsWishDto();    //찜 읽어오기
            contentsWishDto.setCnts_id(cnts_id);
            contentsWishDto.setUser_id(user_id);

            model.addAttribute("contentsWishDto", contentsWishDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "Contents/contentsView";
    }

    //컨텐츠 검색
    @GetMapping("/contents/search/")
    public String getSearchCntsPage(SearchCondition sc, Model model) {
        String user_id = "sohyeon9253";

        int totalCnt = contentsService.getSearchResultCnt(sc);
        model.addAttribute("totalCnt", totalCnt);

        PageHandler pageHandler = new PageHandler(totalCnt, sc);

        List<ContentsDto> cntsDtoList = contentsService.getSearchCntsPage(sc);
        model.addAttribute("cntsDtoList", cntsDtoList);
        model.addAttribute("ph", pageHandler);

        System.out.println("검색어: "+ sc);

        return "Contents/contentsSearchList";
    }
/*
    //컨텐츠 찜
    @PostMapping("contents/{cnts_id}")
    public ResponseEntity<Integer> insertWish(@RequestBody ContentsWishDto contentsWishDto, @PathVariable Integer cnts_id, HttpSession session) {
        String user_id = "sohyeon9253";
        contentsWishDto.setUser_id(user_id);
        contentsWishDto.setCnts_id(cnts_id);
        System.out.println("contentsWishDto: "+contentsWishDto);
        try {
            if (contentsService.insertWish(contentsWishDto)!=1)
                throw new DuplicateKeyException ("찜 취소");
            return new ResponseEntity<>("찜 성공", HttpStatus.OK);
        } catch(DuplicateKeyException e) {

        }
    }*/
}
