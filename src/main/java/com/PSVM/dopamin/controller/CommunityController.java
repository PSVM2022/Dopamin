package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.community.BbsDto;
import com.PSVM.dopamin.domain.community.PostDto;
import com.PSVM.dopamin.service.community.CommunityService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {

    @Autowired
    CommunityService communityService;

    @GetMapping("/")
    public String main(HttpServletRequest request, Model m) throws Exception {
        Map<BbsDto, List<PostDto>> map = communityService.getAvailBbsPreview();
        m.addAttribute("bbsPreviewMap", map);
        System.out.println("커뮤니티 메인");
        System.out.println(map);
        return "Community/communityMain";
    }

    @GetMapping("/bbs/{bbs_id}")
    public String board() {
        return "Community/communityMain";
    }

    @GetMapping("/post/{post_id}")
    public String post() {
        return "Community/communityMain";
    }

    @GetMapping("/post/edit")
    public String editPost() {
        return "Community/communityMain";
    }
}
