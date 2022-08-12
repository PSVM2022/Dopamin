package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/contents")
public class ContentsController {

    @Autowired
    ContentsService contentsService;

    @GetMapping("/")
    public String contents(Model model) throws Exception {
        List<ContentsDto> cntsDtoList = contentsService.contentsList();

        model.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList"+cntsDtoList);

        return "contentsMain";
    }

}
