package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping()
public class ContentsController {

    @Autowired
    ContentsService contentsService;

    //메인 페이지
    @GetMapping("/")
    public String contents(Model model) throws Exception {
        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        model.addAttribute("cntsDtoList", cntsDtoList);

        return "main";
    }

    //컨텐츠 상세 조회
    @GetMapping("/contents/{cnts_id}")
    public String contentView(@PathVariable("cnts_id") Integer cnts_id, Model model) throws Exception{

        try {
            ContentsDto contentsDto = contentsService.contentsView(cnts_id);
            model.addAttribute("contentsDto", contentsDto);
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

        return "main";
    }

}
