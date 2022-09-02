package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.service.AmazonS3Utils;
import com.PSVM.dopamin.domain.*;
import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.service.MyPageService;
import com.PSVM.dopamin.service.User.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService myPageService;
    @Autowired
    UserService userService;

    private final AmazonS3Utils amazonS3Utils;

    @Value("${AWS_S3_BUCKET_URL}")
    private String AWS_S3_BUCKET_URL;


    // MyPage 메인 화면
    @GetMapping("")
    public String myPage(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);
        System.out.println("/mypage!!!!");
        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");

        MyPageDto myPageDto = myPageService.selectMyInfo(user_id);
        m.addAttribute("myPageDto", myPageDto);
        return "Mypage/myPageMain";
    }

    //한줄평 리스트 가져오기
    @GetMapping("/revw")
    public String readRevwList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPageRevwDto> revwDtoList = myPageService.revwList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "Mypage/revw";
    }

    // 평가된 한줄평 가져오기
    @GetMapping("/revwrt")
    public String readRevwRtList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPageRevwDto> revwDtoList = myPageService.revwRtList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "Mypage/revwrt";
    }

    //컨텐츠 찜 목록 가져오기
    @GetMapping("/cntswish")
    public String readCntsWishList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
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
    public String readCntsViewList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
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
    public String readPostList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");
        List<MyPagePostDto> postDtoList = myPageService.postList(user_id);
        m.addAttribute("postDtoList", postDtoList);
        return "Mypage/post";
    }

    //보유 아이템 목록
    @GetMapping("/myItem")
    public String readMyItemList(Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }

        String user_id = (String) session.getAttribute("USERID");
        MyPageDto myPageDto = myPageService.selectMyInfo(user_id);
        m.addAttribute("myPageDto", myPageDto);

        List<MyPageItemsDto> skinList = myPageService.skinList(user_id);
        List<MyPageItemsDto> profList = myPageService.profList(user_id);

        m.addAttribute("skinList", skinList);
        m.addAttribute("profList", profList);

        return "Mypage/myItem";
    }

    @PostMapping("/equip")
    @ResponseBody
    public ResponseEntity<?> equipMod(@RequestParam("item_id") Integer item_id, @RequestParam("equip_stat") Integer equip_stat, @RequestParam("list_id") Integer list_id, HttpSession session) throws Exception {

        String user_id = (String) session.getAttribute("USERID");

        MyPageItemsDto myPageItemsDto = new MyPageItemsDto();
        myPageItemsDto.setItem_id(item_id);
        myPageItemsDto.setEquip_stat(equip_stat);
        myPageItemsDto.setList_id(list_id);
        myPageItemsDto.setUser_id(user_id);

        System.out.println("myPageItemsDto = " + myPageItemsDto);

        if (list_id == 1) {
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
        } else {
            try {
                if (myPageItemsDto.getEquip_stat() == 0 || myPageItemsDto.getEquip_stat() == -1) {
                    myPageService.modProf(myPageItemsDto);
                } else if (myPageItemsDto.getEquip_stat() == 1) {
                    myPageService.defaultProf(myPageItemsDto);
                } else {
                    throw new Exception("착용 초기화");
                }
            } catch (Exception e) {
                myPageService.defaultProf(myPageItemsDto);
            }
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/point")
    public String pointList(Model m, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (!userService.loginCheck(request)) {
            return "redirect:/login/login";
        }
        String user_id = (String) session.getAttribute("USERID");

        List<MyPagePointDto> pntList = myPageService.pntList(user_id);

        m.addAttribute("pntList", pntList);

        System.out.println("pntList = " + pntList);
        return "Mypage/point";
    }


    //한줄평 삭제


    @PostMapping("/deleterevw")
    @ResponseBody
    public ResponseEntity<?> delrevw(@RequestBody List<Integer> valueArr, HttpSession session) throws Exception {

        String user_id = (String) session.getAttribute("USERID");
        System.out.println(valueArr);

        int res = myPageService.deleterevw(valueArr);
        if (res == 1) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //게시물 삭제
    @PostMapping("/deletepost")
    @ResponseBody
    public ResponseEntity<?> delpost(@RequestBody List<Integer> valueArr, HttpSession session) throws Exception {

        String user_id = (String) session.getAttribute("USERID");
        System.out.println(valueArr);

        int res = myPageService.deletePost(valueArr);
        if (res == 1) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @PostMapping("/userInfo")
    public String userInfocheck(HttpSession session, @RequestParam String pwd, Model model, RedirectAttributes redirectAttributes) {
        try {
            String id = (String) session.getAttribute("USERID");
            System.out.println("id = " + id);
            System.out.println("pwd = " + pwd);
            Map result = new HashMap();
            //비밀번호 불일치
            if (!userService.idPwdCheck(id, pwd)) {
                redirectAttributes.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다!");
                return "redirect:/mypage";
            }
            //비밀번호 일치하면 userInfo 페이지로.
            UserDto userDto = userService.getUser(id);
            model.addAttribute("userDto", userDto);
        } catch (Exception e) {
            //아직 예외처리 안함.
            return "redirect:/login/login";
        }
        return "Mypage/userInfo";
    }

    @GetMapping("/userInfo")
    public String userInfo() {
        return "redirect:/mypage";
    }

    @PostMapping("/modifyuserinfo")
    @ResponseBody
    public Map modifyUserInfo(@RequestBody UserDto userDto, HttpSession session) {
        //유효성 검사, 예외 처리 필요.
        String user_id = (String) session.getAttribute("USERID");
        userDto.setUser_id(user_id);
        userService.modifyUserInfo(userDto);
        Map result = new HashMap();
        result.put("msg", "내 정보가 수정되었습니다");
        return result;
    }

    @PostMapping("/modifyprfimg")
    @ResponseBody
    public String modifyProfileImg(@RequestParam("uploadImg") MultipartFile uploadImg, HttpSession session) throws IOException {
        String user_id = (String) session.getAttribute("USERID");
        String s3Url = amazonS3Utils.uploadFile("user", uploadImg);
        userService.modifyUserPrfImg(s3Url, user_id);
        return "success";
    }

}



