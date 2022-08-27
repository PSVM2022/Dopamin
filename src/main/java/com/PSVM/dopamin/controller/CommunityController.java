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
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CommunityController {

    @Autowired
    CommunityService communityService;

    @GetMapping("/community")
    public String main(HttpServletRequest request, Model m) throws Exception {
        Map<BbsDto, List<PostDto>> map = communityService.getAvailBbsPreview();
        m.addAttribute("bbsPreviewMap", map);
        return "Community/communityMain";
    }

    @GetMapping("/community/{bbsId}")
    public String board(@PathVariable("bbsId") int bbsId) {
        System.out.println("저는 게시판 페이지 " + bbsId + " 입니다");
        return "Community/communityBbs";
    }

    @GetMapping("/post/{postId}")
    public String post(@PathVariable("postId") int postId) {
        System.out.println("저는 포스트 페이지 " + postId + " 입니다");
        return "Community/communityPost";
    }

    @GetMapping("/post/edit")
    public String editPost() {
        return "Community/communityPostEditor";
    }
}
