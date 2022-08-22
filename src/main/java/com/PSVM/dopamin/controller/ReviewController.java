package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ReviewDto;
import com.PSVM.dopamin.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    //지정 컨텐츠의 모든 한줄평 조회
    @GetMapping("/contents/{cnts_id}/reviews")
    public ResponseEntity<List<ReviewDto>> list(@PathVariable Integer cnts_id) {
        List<ReviewDto> list = null;
        try {
            list = reviewService.getRevwList(cnts_id);
            return new ResponseEntity<List<ReviewDto>>(list, HttpStatus.OK); //200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ReviewDto>>(HttpStatus.BAD_REQUEST); //400
        }
    }
    /*  List<ReviewDto> list = null;
        List<ReviewDto> reviewDtoList = reviewService.getRevwList(cnts_id);
        model.addAttribute("reviewDtoList", reviewDtoList);
        return "Contents/contentsView";}*/

    //한줄평 등록
    @PostMapping("/contents/{cnts_id}/reviews")
    public ResponseEntity<String> insertRevw(@RequestBody ReviewDto reviewDto, @PathVariable Integer cnts_id, HttpSession session) {
        //String user_id = (String)session.getAttribute("user_id");
        String user_id = "hohoma5";
        reviewDto.setUser_id(user_id);
        reviewDto.setCnts_id(cnts_id);
        System.out.println("reviewDto: "+reviewDto);
        try {
            if(reviewService.insertRevw(reviewDto)!=1)
                throw new Exception("글쓰기 실패");

            return new ResponseEntity<>("글쓰기 성공", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("글쓰기 실패", HttpStatus.BAD_REQUEST);
        }
    }

    //한줄평 수정
    @PatchMapping("/contents/{cnts_id}/reviews/{revw_id}")
    public ResponseEntity<String> updateRevw(@PathVariable Integer cnts_id, @PathVariable Integer revw_id, @RequestBody ReviewDto reviewDto, HttpSession session) {
        //String user_id = (String)session.getAttribute("user_id");
        String user_id = "sohyeon9253";
        reviewDto.setUser_id(user_id);
        reviewDto.setRevw_id(revw_id);
        System.out.println("ReviewDto"+reviewDto);

        try {
            if (reviewService.updateRevw(reviewDto)!=1)
                throw new Exception("수정 실패");
            return new ResponseEntity<>("수정 성공!", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("수정 실패", HttpStatus.BAD_REQUEST);
        }
    }

    //한줄평 삭제
    @DeleteMapping("/contents/{cnts_id}/reviews/{revw_id}")
    public ResponseEntity<String> deleteRevw(@PathVariable Integer cnts_id, @PathVariable Integer revw_id, HttpSession session) {
        //String user_id = (String)session.getAttribute("user_id");
        String user_id = "sohyeon9253";

        try {
            int rowCnt = reviewService.deleteRevw(revw_id, cnts_id, user_id);
            if (rowCnt!=1)  //삭제되면 1 반환됨
                throw new Exception("삭제 실패");
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>("삭제 실패", HttpStatus.BAD_REQUEST);
        }
    }
}
