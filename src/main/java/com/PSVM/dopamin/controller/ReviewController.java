package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.ReviewDto;
import com.PSVM.dopamin.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;


    @GetMapping("/review")
    public String getRevwList(Integer cnts_id, Model model) {
        //List<ReviewDto> list = null;

        List<ReviewDto> reviewDtoList = reviewService.getRevwList(cnts_id);

        model.addAttribute("reviewDtoList", reviewDtoList);


        return "contentsView";
    }
}
