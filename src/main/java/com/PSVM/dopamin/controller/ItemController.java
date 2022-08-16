package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ItemDto;
import com.PSVM.dopamin.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/item")
public class ItemController {
    ItemService itemService;
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }
    @GetMapping("/")//상정 메인 페이지
    public String item_main(){//각 아이템 항목별 TOP5를 보여주기
        //통계 각 항목별 TOP4 가져와 보여주면 됨.
        return "item";
    }
    @GetMapping("/list/{order}")
    public String list(@PathVariable String order, Model m, RedirectAttributes redirectAttributes){
        //로그인 여부와 상관없이
        //메인에서 <스킨> 누르면 스킨에 해당하는 아이템 목록 스킨==1
        //메인에서 <꾸미기> 누르면 꾸미이게 해당하는 아이템 목록 보여주기 꾸미기==2
        //그외 나머지는 예외처리해야함.
        try{
            if(Objects.equals(order,"스킨")||Objects.equals(order,"꾸미기")){
                int totalCnt=itemService.getCount();
                if(totalCnt==0){
                    throw new Exception("보여질 아이템이 없습니다.");
                }
                List<ItemDto> list=itemService.getPage(order);//ItemDto list에다가 order에 해당하는 아이템들 받아올 거임.
                m.addAttribute("list",list);
                return "ilist";
            }
            else{
                throw new Exception("잘못된 요청입니다");
            }
        }
        catch(Exception e){
            String msg=e.getMessage();
            redirectAttributes.addFlashAttribute("msg",msg);
            return "redirect:/item/";
        }
    }
    @GetMapping("/item_admin")//추가 구현!! 관리자에게만 버튼 보여지는 것
    public String item_admin(ItemDto itemDto, Model m, HttpServletRequest request) throws Exception{
        //관리자가에게만 버튼 보이는데
        //관리자가 아닌 사람이 url로 접근하려려고 할때, 권한 확인해서 "접근할 수 없는 페이지"입니다. 출력
        //여기서 고민해봐야 할 것들이. "접근할 수 없는 페이지"입니다. 라는 메시지를 띄우는게 좋을까?
        //어떠한 행위를 한다는 것 자체가, 어떤 유저에게는 "아 이 페이지에 뭐가 있구나" 알고,
        //어떻게든 접근하려하지 않을까?
        //그럴바에는 해당 ur로 접근 시, 관리자가 아니라면 에러메시지 보단, 상점 메인페이지 반환하자.
        if(check_Admin(request)){
            return "item";
        }
        try{
            List<ItemDto> list_0=itemService.getStat_0();//상태 0이 비공개
            List<ItemDto> list_1=itemService.getStat_1();//상태 1이 공개
            m.addAttribute("list_0",list_0);
            m.addAttribute("list_1",list_1);
            //m.addAttribute("mode","register");
            return "item_admin"; //읽기와 쓰기에 사용. 쓰기 사용 시 mode=register;
        }
        catch(Exception e){
            throw new Exception(e);
        }
    }
    private boolean check_Admin(HttpServletRequest request) {
        return false;
    }
    @GetMapping("/register")
    public String write(Model m){
        m.addAttribute("mode","new");
        return "item_register";
    }
    @PostMapping("/register")
    public String write(@PathVariable String user_id, ItemDto itemDto, Model m, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            if(!check_Admin(user_id)){//관리자가 아니라면
                String msg = URLEncoder.encode("너 관리자 아니자나!!!", "utf-8");
                return "redirect:/?msg="+msg;
            }
            Map map=new HashMap<>();
            String writer_id=(String) session.getAttribute("id");//session에서 작성자 id 가져온다.
            //가져온 id로 유저 테이블에서 닉네임 찾아 반환.
            String user_nic=itemService.getUser_nic(writer_id);
            //아이템 등록을 진행하자
            //itemDto.setUser_nic(user_nic);
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
//    @PostMapping("/change/{item_id}/{order}")//아이템 수정(order=0) 삭제(order=1)
//    public String change(@PathVariable(name="item_id") int item_id, @PathVariable(name="order") int order,ItemDto itemDto,Model m, HttpSession session, RedirectAttributes redirectAttributes){
//        try{
//            //1.일단 해당 아이템을 수정 및 삭제할 수 있는지 상태값을 먼저 받아오자.
//            int status=itemService.getStatus(item_id);
//            if(status==0){
//                //상태값이 0이라면 비공개처리 되어있는 것이기 때문에 수정 및 삭제 진행 불가.
//
//            }
//            //if문을 통과했다는 것은 상태값이 1 즉, 공개처리 되어있는 것이기 때문에 수정 및 삭제 진행 가능.
//            if(order==0){
//                //수정 처리
//            }
//            else{
//                //삭제 처리
//            }
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return "";
//    }


}
