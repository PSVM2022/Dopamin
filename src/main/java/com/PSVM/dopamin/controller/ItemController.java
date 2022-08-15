package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.ItemDto;
import com.PSVM.dopamin.domain.PageHandler;
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
import java.net.URLEncoder;
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
        //통계 각 항목별 TOP4 가져와 보여주면 됨.
        return "item";
    }
    @PostMapping("/change/{item_id}/{order}")//아이템 수정(order=0) 삭제(order=1)
    public String change(@PathVariable(name="item_id") int item_id, @PathVariable(name="order") int order,ItemDto itemDto,Model m, HttpSession session, RedirectAttributes redirectAttributes){
        try{
            //1.일단 해당 아이템을 수정 및 삭제할 수 있는지 상태값을 먼저 받아오자.
            int status=itemService.getStatus(item_id);
            if(status==0){
                //상태값이 0이라면 비공개처리 되어있는 것이기 때문에 수정 및 삭제 진행 불가.

            }
            //if문을 통과했다는 것은 상태값이 1 즉, 공개처리 되어있는 것이기 때문에 수정 및 삭제 진행 가능.
            if(order==0){
                //수정 처리
            }
            else{
                //삭제 처리
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return "";
    }
    @GetMapping("/item_admin")//
    public String item_admin(ItemDto itemDto,Model m){
        List<ItemDto> list_0=itemService.geStat_0();//상태 0이 비공개
        List<ItemDto> list_1=itemService.geStat_1();//상태 1이 공개
        m.addAttribute("list_0",list_0);
        m.addAttribute("list_1",list_1);
        //m.addAttribute("mode","register");
        return "item_admin"; //읽기와 쓰기에 사용. 쓰기 사용 시 mode=register;
    }
//    @PostMapping("/register/{user_id}")
//    public String write(@PathVariable String user_id, ItemDto itemDto, Model m, HttpSession session, RedirectAttributes redirectAttributes){
//        try {
//            if(!check_Admin(user_id)){//관리자가 아니라면
//                String msg = URLEncoder.encode("너 관리자 아니자나!!!", "utf-8");
//                return "redirect:/?msg="+msg;
//            }
//            Map map=new HashMap<>();
//            String writer_id=(String) session.getAttribute("id");//session에서 작성자 id 가져온다.
//            //가져온 id로 유저 테이블에서 닉네임 찾아 반환.
//            String user_nic=itemService.getUser_nic(writer_id);
//            //아이템 등록을 진행하자
//            //itemDto.setUser_nic(user_nic);
//            map.put("writer_id",writer_id);
//            map.put("itemDto",itemDto);
//            int row_cnt = itemService.register(map);
//            if(row_cnt!=1){
//                throw new Exception("Register Failed");
//            }
//            redirectAttributes.addFlashAttribute("msg","Register Successed");
//            return "redirect:/item/list";
//        } catch (Exception e) {
//            e.printStackTrace();
//            m.addAttribute(itemDto);
//            redirectAttributes.addAttribute("msg","Register Failed");
//            return "item";
//        }
//    }
//    private boolean check_Admin(String user_id) {
//        try{
//            int check_admin=itemService.getUser_stat(user_id);
//            if(check_admin!=0){
//                throw new Exception("Access Failed");
//            }
//            return true;
//        }catch(Exception e)
//        {
//            e.printStackTrace();
//            return false;
//        }
//    }

    @GetMapping("/list/{index}")
    public String list(@PathVariable String index, Model m, Integer page, Integer pageSize, HttpServletRequest request){
        //로그인 여부와 상관없이
        //메인에서 <스킨> 누르면 스킨에 해당하는 아이템 목록
        //메인에서 <꾸미기> 누르면 꾸미이게 해당하는 아이템 목록 보여주기
        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int order;
            int totalCnt=itemService.getCount();
            PageHandler pageHandler=new PageHandler(totalCnt,page,page);
            if(index.equals("스킨")){
                order=1;
            }
            else{
                order=2;
            }
            System.out.println(index);
            System.out.println(order);
            Map map = new HashMap();
            map.put("offset",(page-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("order",order);
            //페이지 관련 정보 받아오고

            List<ItemDto> list=itemService.getPage(map);//ItemDto list에다가 order에 해당하는 아이템들 받아올 거임.
            m.addAttribute("list",list);
            m.addAttribute("ph",pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "ilist";
    }
}
