package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.PageHandler;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.domain.community.BbsDto;
import com.PSVM.dopamin.domain.community.PostDto;
import com.PSVM.dopamin.service.community.CommunityService;
import com.PSVM.dopamin.service.community.PostService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {

    @Autowired
    CommunityService communityService;

    @Autowired
    PostService postService;

    @GetMapping("/community")
    public String main(HttpServletRequest request, Model m) throws Exception {
        Map<BbsDto, List<PostDto>> map = communityService.getAvailBbsPreview();
        m.addAttribute("bbsPreviewMap", map);

        return "Community/communityMain";
    }

    @GetMapping("/community/{bbsId}")
    public String board(
        @PathVariable("bbsId") Integer bbsId,
        @RequestParam(required = false, defaultValue = "1") Integer page,
        Model m
    ) throws Exception {
        try {
            Map map = new HashMap<>();
            map.put("bbsId", bbsId);
            map.put("page", page);

            List<PostDto> list = postService.getPage(map);
            String bbsNm = postService.getBbsName(bbsId);

            m.addAttribute("postList", list);
            m.addAttribute("bbsNm", bbsNm);

            int totalCnt = postService.getCountInBbs(bbsId);
            PageHandler ph = new PageHandler(totalCnt, new SearchCondition(page, 25, ""));

            m.addAttribute("ph", ph);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

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
