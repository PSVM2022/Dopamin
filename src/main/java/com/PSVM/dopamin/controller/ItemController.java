package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ItemDto;
import com.PSVM.dopamin.domain.PageHandler;
import com.PSVM.dopamin.domain.SearchCondition;
import com.PSVM.dopamin.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class ItemController {
    ItemService itemService;
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }//생성자 주입
    @GetMapping("/")//상정 메인 페이지
    public String item_main(){//각 아이템 항목별 TOP5를 보여주기
        return "item";
    }
//    @GetMapping("/delete")
//    public String remove(Model m, Integer page, Integer pageSize, Integer item_id, HttpSession session){
//        //관리자인지 체크
//        if (check_Admin()==0){
//            try {
//                m.addAttribute(page);
//                m.addAttribute(pageSize);
//                int result = itemService.remove(item_id);
//                if (result!=1)
//                {
//                    throw new Exception("item remove error");
//                }
//                m.addAttribute("msg","Success");
//            } catch (Exception e) {
//                e.printStackTrace();
//                m.addAttribute("msg","Fail");
//            }
//            return "redirect:/아이템 리스트 화면으로 가기";
//        }
//        //관리자가 아닐때
//        return "기존화면 그대로 유지";
//    }

    private int check_Admin() {
        //관리자인지 검사해야함.
        return 0;
    }
    @GetMapping("/register")//아이템 등록
    public String wirte(Model m){
        m.addAttribute("mode","register");
        return "item"; //읽기와 쓰기에 사용. 쓰기 사용 시 mode=register;

    }
    @PostMapping("/register")
    public String write(ItemDto itemDto, Model m, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            Map map=new HashMap<>();
            String writer_id=(String) session.getAttribute("id");//session에서 작성자 id 가져온다.
            //가져온 id로 유저 테이블에서 닉네임 찾아 반환.
            String user_nic=itemService.getUser_nic(writer_id);
            //아이템 등록을 진행하자
            itemDto.setUser_nic(user_nic);
            map.put("writer_id",writer_id);
            map.put("itemDto",itemDto);
            int row_cnt = itemService.register(map);
            if(row_cnt!=1){
                throw new Exception("Register Failed");
            }
            redirectAttributes.addFlashAttribute("msg","Register Successed");
            return "redirect:/item/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(itemDto);
            redirectAttributes.addAttribute("msg","Register Failed");
            return "item";
        }
    }
    @GetMapping("/list")
    public String list(Model m, Integer page, Integer pageSize, SearchCondition sc, HttpServletRequest request){
        //로그인 여부와 상관없이
        //메인에서 <스킨> 누르면 스킨에 해당하는 아이템 목록
        //메인에서 <꾸미기> 누르면 꾸미이게 해당하는 아이템 목록 보여주기
        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int totalCnt=itemService.getCount();
            PageHandler pageHandler=new PageHandler(totalCnt,page,page);

            Map map = new HashMap();
            map.put("offset",(page-1)*pageSize);
            map.put("pageSize",pageSize);


            List<ItemDto> list=itemService.getPage(map);
            m.addAttribute("list",list);
            m.addAttribute("ph",pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "itemList";
    }
}
