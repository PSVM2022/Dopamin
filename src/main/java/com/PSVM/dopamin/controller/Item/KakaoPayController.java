package com.PSVM.dopamin.controller.Item;

import com.PSVM.dopamin.domain.Item.Pymt_DetlDto;
import com.PSVM.dopamin.service.Item.ItemAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
public class KakaoPayController {
    @Autowired
    private ItemAdminService itemAdminService;
    private Pymt_DetlDto pymt_detlDto = new Pymt_DetlDto();
    @GetMapping("/kakaoPaysuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model m){
        pymt_detlDto.setPg_corp_detl_id(pg_token);
        try {
            boolean result=itemAdminService.pymt_detl(pymt_detlDto);
            m.addAttribute("msg","포인트 충전이 완료되었습니다.");
        } catch (Exception e) {
            m.addAttribute("msg",e.getMessage());
        }
        return "Item/new_point_charge";
    }
    //카카오페이 API사용: 단건결제
    @PostMapping("/item/recharge/{pymt_amt}")
    @ResponseBody
    //뷰에서 DTO로 넘겨주자. 여기서 회원 인증 후, DTO로 받고, 승인이 되면 그때 사용하자.
    public String recharge_kakaopay(@PathVariable Integer pymt_amt, HttpSession session){
        try {
            String user_id = (String) session.getAttribute("USERID");
            //0.세션이 없다면 예외처리

            Map map=new HashMap<>();
            map.put("1000",1000);
            map.put("5000",8000);
            map.put("10000",15000);
            map.put("30000",38000);
            map.put("50000",62000);
            pymt_detlDto.setPymt_amt(pymt_amt);
            Integer chg_pnt= (Integer) map.get(Integer.toString(pymt_amt));
            pymt_detlDto.setChg_pnt(chg_pnt);
            pymt_detlDto.setUser_id(user_id);

            //1.URL 이 있어야 원하는 곳으로감
            URL address=new URL("https://kapi.kakao.com/v1/payment/ready");
            //2.이 서버와 카카오서버를 연결.
            HttpURLConnection connectionServer=(HttpURLConnection) address.openConnection();
            connectionServer.setRequestMethod("POST");
            connectionServer.setRequestProperty("Authorization","KakaoAK 1bb7a47253f94274789330f6d0b0c00c");
            connectionServer.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
            connectionServer.setDoOutput(true);//connectionServer가 생성되면 default input:true, output:false
            String parameter="cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+Integer.toString(chg_pnt)+"DP&quantity=1&total_amount="+Integer.toString(pymt_amt)+"&tax_free_amount=0&approval_url=http://localhost:8080/psvm/kakaoPaysuccess&fail_url=http://localhost:8080/psvm/kakaoPaySuccessFail&cancel_url=http://localhost:8080/psvm/kakaoPaycancel";
            OutputStream outputStream=connectionServer.getOutputStream();
            DataOutputStream dataOutputStream=new DataOutputStream(outputStream);
            //주고받는 양식 : Byte형식
            dataOutputStream.writeBytes(parameter);
            dataOutputStream.close();//close 동시에 자동으로 flush 됨(자동으로 Byte형식으로 보냄)

            int result=connectionServer.getResponseCode();

            //반는애
            InputStream inputStream;
            if(result==200){
                inputStream=connectionServer.getInputStream();
            }else{
                inputStream=connectionServer.getErrorStream();
            }
            InputStreamReader inputStreamReader= new InputStreamReader(inputStream);
            //바이트를 문자열로 형변환
            BufferedReader bufferedReader=new BufferedReader(inputStreamReader);
            return bufferedReader.readLine();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch(IOException e){
            e.printStackTrace();
        }
        return null;
    }
}
