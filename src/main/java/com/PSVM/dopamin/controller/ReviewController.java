package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ReviewDto;
import com.PSVM.dopamin.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @ResponseBody
    @GetMapping("/review")
    public List<ReviewDto> list(Integer cnts_id) {
        List<ReviewDto> list = null;
        try {
            list = reviewService.getRevwList(cnts_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
