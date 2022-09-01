package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.*;
import com.PSVM.dopamin.service.ContentsService;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;


@Controller
@RequestMapping()
public class ContentsController {

    @Autowired
    ContentsService contentsService;

    @Autowired
    UserService userService;
    //@Autowired
    //ReviewService reviewService;

    //예외처리
    @ExceptionHandler(Exception.class)
    public String catcher(Exception e) {
        e.printStackTrace();
        return "Contents/error";
    }

    //메인 페이지
    @GetMapping("/")
    public String contentsList(HttpServletRequest request, Model model) {
        //설문조사 안했다면
        HttpSession session = request.getSession(false);
        if (session != null) {
            //SURVEY가 존재한다면,아직 설문 조사안한것
            if (session.getAttribute("SURVEY") != null) {
                return "Login/survey";
            }
            //로그인 한 상태
            String user_id = (String) session.getAttribute("USERID");
            List<ContentsUserDto> userContentsDtoList = contentsService.selectUserAllCnts(user_id);
            ContentsUserDto contentsUserDto = contentsService.selectUserId(user_id);
            //System.out.println("로그인 유저정보: "+user_id);
            model.addAttribute("userContentsDtoList", userContentsDtoList);
            model.addAttribute("contentsUserDto", contentsUserDto);

        }

        //로그인 안한 상태
        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        model.addAttribute("cntsDtoList", cntsDtoList);
        //System.out.println("model: "+model);

        return "main";
    }

    //컨텐츠 상세 조회
    @GetMapping("/contents/{cnts_id}")
    public String contentsView(@PathVariable(required = false) Integer cnts_id, HttpServletRequest request, HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("USERID");

        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        try {
            ContentsDto contentsDto = contentsService.contentsView(cnts_id);
            model.addAttribute("contentsDto", contentsDto);

            ContentsWishDto contentsWishDto = new ContentsWishDto();    //찜 읽어오기
            contentsWishDto.setCnts_id(cnts_id);
            contentsWishDto.setUser_id(user_id);
            model.addAttribute("contentsWishDto", contentsWishDto);
            //System.out.println(contentsWishDto.getCnts_id());
            //System.out.println(contentsWishDto.getUser_id());
            //System.out.println(user_id);
            return "Contents/contentsView";

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //컨텐츠 검색
    @GetMapping("/contents/search/")
    public String getSearchCntsPage(SearchCondition sc, Model model) {

        int totalCnt = contentsService.getSearchResultCnt(sc);
        model.addAttribute("totalCnt", totalCnt);

        PageHandler pageHandler = new PageHandler(totalCnt, sc);

        List<ContentsDto> cntsDtoList = contentsService.getSearchCntsPage(sc);
        model.addAttribute("cntsDtoList", cntsDtoList);
        model.addAttribute("ph", pageHandler);

        System.out.println("검색어: " + sc);

        return "Contents/contentsSearchList";
    }

    //컨텐츠 찜
    @PostMapping("/contents/{cnts_id}/wish")
    @ResponseBody
    public ResponseEntity<?> InsertDeleteWish(@PathVariable Integer cnts_id, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("USERID");

        ContentsWishDto contentsWishDto = new ContentsWishDto();
        contentsWishDto.setCnts_id(cnts_id);
        contentsWishDto.setUser_id(user_id);
        contentsWishDto.setIn_user(user_id);
        contentsWishDto.setUp_user(user_id);
        //System.out.println("출력: " + cnts_id);
        //System.out.println("유저 츨력: " + user_id);

        //inset wish
        try {
            int insertWish = contentsService.insertWish(contentsWishDto);

            //System.out.println("컨텐츠 찜" + insertWish);

            return new ResponseEntity<>("wish insert succsess", HttpStatus.OK);
        } catch (DuplicateKeyException e) {
            e.printStackTrace();

            int deleteWish = contentsService.deleteWish(contentsWishDto.getCnts_id(), contentsWishDto.getUser_id());

            //System.out.println("컨텐츠 찜 취소" + deleteWish);
            return new ResponseEntity<>("wish delete succsess", HttpStatus.BAD_REQUEST);

        }
    }
}