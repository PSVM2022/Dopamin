package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.*;
import com.PSVM.dopamin.service.MyPageService;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService myPageService;
    @Autowired
    UserService userService;



    // MyPage 메인 화면
    @GetMapping("")
    public String myPage( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");

        MyPageDto myPageDto = myPageService.selectMyInfo(user_id);
        m.addAttribute("myPageDto", myPageDto);
        return "Mypage/myPageMain";
    }

    //한줄평 리스트 가져오기
    @GetMapping("/revw")
    public String readRevwList( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<RevwDto> revwDtoList = myPageService.revwList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "Mypage/revw";
    }

    // 평가된 한줄평 가져오기
    @GetMapping("/revwrt")
    public String readRevwRtList(HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<RevwDto> revwDtoList = myPageService.revwRtList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "Mypage/revwrt";
    }

    //컨텐츠 찜 목록 가져오기
    @GetMapping("/cntswish")
    public String readCntsWishList( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsWishList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "Mypage/cntswish";
    }

    //컨텐츠 조회 기록 목록 가져오기
    @GetMapping("/cntsview")
    public String readCntsViewList( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPageCntsDto> cntsDtoList = myPageService.cntsViewList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "Mypage/cntsview";
    }

    //게시글 목록 가져오기
    @GetMapping("/post")
    public String readPostList( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPagePostDto> postDtoList = myPageService.postList(user_id);
        m.addAttribute("postDtoList", postDtoList);
        return "Mypage/post";
    }

    //보유 아이템 목록
    @GetMapping("/myItem")
    public String readMyItemList( HttpSession session, Model m,HttpServletRequest request) throws Exception {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPageItemsDto> skinList = myPageService.skinList(user_id);
        List<MyPageItemsDto> profList = myPageService.profList(user_id);

        m.addAttribute("skinList", skinList);
        m.addAttribute("profList", profList);

        return "Mypage/error";
    }

    @PostMapping("/equip")
    public ResponseEntity<?> equipMod(@RequestParam("item_id") Integer item_id, @RequestParam("equip_stat") Integer equip_stat, @RequestParam("list_id") Integer list_id,  HttpSession session) throws Exception {

        String user_id = (String) session.getAttribute("USERID");

        MyPageItemsDto myPageItemsDto = new MyPageItemsDto();
        myPageItemsDto.setItem_id(item_id);
        myPageItemsDto.setEquip_stat(equip_stat);
        myPageItemsDto.setList_id(list_id);
        myPageItemsDto.setUser_id(user_id);

        System.out.println("myPageItemsDto = " + myPageItemsDto);

        try {
            if (myPageItemsDto.getEquip_stat() == 0 || myPageItemsDto.getEquip_stat() == -1) {
                myPageService.modSkin(myPageItemsDto);
            } else if (myPageItemsDto.getEquip_stat() == 1) {
                myPageService.defaultSkin(myPageItemsDto);
            } else {
                throw new Exception("착용 초기화");
            }
        } catch (Exception e) {
            myPageService.defaultSkin(myPageItemsDto);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/point")
    public String pointList( HttpSession session, Model m,HttpServletRequest request) {
        if(!userService.loginCheck(request)){
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");

        List<MyPagePointDto> pntList = myPageService.pntList(user_id);

        m.addAttribute("pntList", pntList);

        System.out.println("pntList = " + pntList);
        return "Mypage/point";
    }
    @PostMapping("/usercheck")
    public String modifyUserCheck(HttpSession session, String pwd, RedirectAttributes redirectAttributes,Model model){
        System.out.println("getMapping /userinform");
        String id = (String) session.getAttribute("USERID");
        System.out.println("id = " + id);
        //비밀번호 불일치
        if(!userService.idPwdCheck(id,pwd)){
            redirectAttributes.addFlashAttribute("msg","비밀번호가 일치하지 않습니다!");
            return "redirect:/mypage";
        }
        UserDto userDto = userService.getUser(id);
        model.addAttribute("userDto",userDto);
        return "Mypage/modifyUserInform";
    }

    @PostMapping("/userinform")
    public String modifyUserInform(UserDto userDto, RedirectAttributes redirectAttributes,HttpSession session){
        //수정 완료
        String user_id = (String) session.getAttribute("USERID");
        userDto.setUser_id(user_id);
        userService.modifyUserInform(userDto);
        redirectAttributes.addFlashAttribute("msg","MODIFY_SUCCESS");
        return "redirect:/mypage";
    }

}
