package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.ReviewDto;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.service.ContentsService;
import com.PSVM.dopamin.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.*;
import java.util.List;


@Controller
@RequestMapping()
public class ContentsController {

    @Autowired
    ContentsService contentsService;
    //@Autowired
    //ReviewService reviewService;

    //예외처리(최상위)
    @ExceptionHandler(Exception.class)
        public String catcher(Exception e) {
        e.printStackTrace();
        return "error";
    }

    //메인 페이지
    @GetMapping("/")
    public String contentsList(Model model) {
        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        model.addAttribute("cntsDtoList", cntsDtoList);
        //System.out.println("model: "+model);

        return "main";
    }

    //컨텐츠 상세 조회
    @GetMapping("/contents/{cnts_id}")
    public String contentsView(@PathVariable(required = false) Integer cnts_id, Model model) {
        //if (cnts_id == null)
          //  return "error";
        List<ContentsDto> cntsDtoList = contentsService.contentsList();
        //List<ReviewDto> reviewDtoList = reviewService.getRevwList(cnts_id);

        //if (cnts_id >= this.cntsDtoList.size() || cnts_id < 0) {
        try {
            ContentsDto contentsDto = contentsService.contentsView(cnts_id);
            model.addAttribute("contentsDto", contentsDto);
          //  model.addAttribute("reviewDtoList", reviewDtoList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "contentsView";
    }

    //컨텐츠 검색
    @GetMapping("/contents/search/")
    public String getSearchCntsPage(SearchCondition sc, Model model) {

        List<ContentsDto> cntsDtoList = contentsService.getSearchCntsPage(sc);
        model.addAttribute("cntsDtoList", cntsDtoList);

        System.out.println("검색어: "+ sc);

        return "main";
    }

}
