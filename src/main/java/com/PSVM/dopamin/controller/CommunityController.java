package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.PageHandler;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.domain.community.BbsDto;
import com.PSVM.dopamin.domain.community.PostDto;
import com.PSVM.dopamin.service.community.CommunityService;
import com.PSVM.dopamin.service.community.PostService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
        @PathVariable Integer bbsId,
        @RequestParam(required = false, defaultValue = "1") Integer page,
        Model m
    ) throws Exception {
        try {
            List<PostDto> list = postService.getPage(bbsId, page);
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
    public String post(
        @PathVariable int postId,
        @RequestParam(required = false, defaultValue = "1") Integer page,
        Model m,
        HttpServletRequest req,
        HttpSession session
    ) {
        try {
            PostDto post = postService.read(postId);
            Integer bbsId = post.getBbs_id();
            String bbsNm = postService.getBbsNameByPostId(postId);
            String nowUrl = String.valueOf(req.getRequestURL());
            int totalCnt = postService.getCountInBbs(bbsId);
            PageHandler ph = new PageHandler(totalCnt, new SearchCondition(page, 25, ""));
            List<PostDto> list = postService.getPage(bbsId, page);

            m.addAttribute("post", post);
            m.addAttribute("bbsId", bbsId);
            m.addAttribute("bbsNm", bbsNm);
            m.addAttribute("nowUrl", nowUrl);
            m.addAttribute("postList", list);
            m.addAttribute("ph", ph);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "Community/communityPost";
    }

    // TODO: writer session 추가
    @PostMapping("/post/remove/{postId}")
    public String remove(@PathVariable Integer postId, Model m, HttpSession session)
        throws Exception {
//        String writer = session.getAttribute("id");
        String writer = "user1";
        Integer bbsId = postService.read(postId).getBbs_id();

        try {
            postService.remove(postId, writer);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/community/" + bbsId;
    }

    @GetMapping("/post/edit")
    public String editPost() {
        return "Community/communityPostEditor";
    }
}
