package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ReviewDto;
import com.PSVM.dopamin.service.ReviewService;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/contents")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    UserService userService;

    //지정 컨텐츠의 모든 한줄평 조회
    @GetMapping("/{cnts_id}/testReviewView")
    public String list(@PathVariable Integer cnts_id, Model model) {
        List<ReviewDto> reviewDtoList = null;
        try {
            reviewDtoList = reviewService.getRevwList(cnts_id);
            //System.out.println(list);
            model.addAttribute("cnts_id",cnts_id);
            model.addAttribute("reviewDtoList", reviewDtoList);
            //return new ResponseEntity<List<ReviewDto>>(list, HttpStatus.OK); //200
            return "Contents/testtTestReviewView";
        } catch (Exception e) {
            e.printStackTrace();
            return null;    //임시로 return null 바꿔줄것!!!!!
            //return new ResponseEntity<List<ReviewDto>>(HttpStatus.BAD_REQUEST); //400
        }
    }

    //한줄평 등록
    @PostMapping("/{cnts_id}/reviews1")
    @ResponseBody
    public ResponseEntity<String> insertRevw(@RequestParam("review") String revw_body, @PathVariable Integer cnts_id, HttpSession session) throws Exception {

        //System.out.println(revw_body);

        ReviewDto reviewDto = new ReviewDto();
        String user_id = (String) session.getAttribute("USERID");
//        System.out.println(reviewDto);
        reviewDto.setUser_id(user_id);
        reviewDto.setCnts_id(cnts_id);
        reviewDto.setRevw_body(revw_body);
        reviewDto.setIn_user(user_id);
        reviewDto.setUp_user(user_id);
        //System.out.println(reviewDto);
        //reviewService.insertRevw(reviewDto);

        try {
            reviewService.insertRevw(reviewDto);
//            if(reviewService.insertRevw(reviewDto)!=1)
//                throw new Exception("글쓰기 실패");
            return new ResponseEntity<>("write succsess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("review write fail", HttpStatus.BAD_REQUEST);
        }
    }


    //한줄평 수정
    @PostMapping("/{cnts_id}/reviews2")
    @ResponseBody
    public ResponseEntity<String> updateRevw(@PathVariable Integer cnts_id, ReviewDto reviewDto, HttpSession session) {
        String user_id = (String)session.getAttribute("USERID");
        //String bal = reviewDto.getRevw_body();
        //System.out.println(bal);
        reviewDto.setUser_id(user_id);
        reviewDto.setCnts_id(cnts_id);  //0827 추가함
        System.out.println(reviewDto);

        try {
            if (reviewService.updateRevw(reviewDto)!=1)
                throw new Exception("수정 실패");
            return new ResponseEntity<>("update succsess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("review update fail", HttpStatus.BAD_REQUEST);
        }
    }

    //한줄평 삭제
    @PostMapping("/{cnts_id}/reviews3")
    @ResponseBody
    public ResponseEntity<String> deleteRevw(@PathVariable Integer cnts_id, @RequestParam("revw_id") Integer revw_id, HttpSession session) {
        String user_id = (String)session.getAttribute("USERID");
        System.out.println("revw_id"+revw_id);
        try {
            int rowCnt = reviewService.deleteRevw(revw_id, cnts_id, user_id);
            if (rowCnt!=1)  //삭제되면 1 반환됨
                throw new Exception("삭제 실패");
            return new ResponseEntity<>("delete succsess", HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>("review delete fail", HttpStatus.BAD_REQUEST);
        }
    }
}