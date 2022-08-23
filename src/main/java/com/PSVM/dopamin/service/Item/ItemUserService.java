package com.PSVM.dopamin.service.Item;

import com.PSVM.dopamin.dao.Item.ItemUserDaoImpl;
import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class ItemUserService {

    private final ItemUserDaoImpl itemUserDaoimpl;
    public ItemUserService(ItemUserDaoImpl itemUserDaoimpl) {
        this.itemUserDaoimpl = itemUserDaoimpl;
    }

    public int addCart(Cart_ItemDto cart_itemDto) throws Exception{
        return itemUserDaoimpl.addCart(cart_itemDto);
    }

    public int find_item(Integer item_id) throws Exception {
        return itemUserDaoimpl.find_item(item_id);
    }

    public int getItem_stat(Integer item_id) throws Exception {
        return itemUserDaoimpl.getItem_Stat(item_id);
    }

    public List<ItemDto> getCart_list(int cart_id) throws Exception {
        return itemUserDaoimpl.getCart_list(cart_id);
    }

    public int delete_cart(Map map) throws Exception {
        return itemUserDaoimpl.delete_cart(map);
    }

    @Transactional(rollbackFor = Exception.class)//오류 발생 시 모든 변경을 이전상태로 롤백시킴
    public int buy_item(List<OrderDto> orderDtoList,String user_id,int cart_id) throws Exception{
        //유저포인트 랑
        int total_point=0;
        List<Integer> id_list=new ArrayList<>();
        int user_point=itemUserDaoimpl.getUser_point(user_id);
        //장바구니에서 구매하겠다고 선택한 목록의 포인트의 총합 비교
        for(OrderDto orderDto:orderDtoList){
            total_point+=orderDto.getItem_price();
            id_list.add(orderDto.getItem_id());
            orderDto.setUser_id(user_id);
        }
        if(total_point>user_point){//구매하고자 하는 아이템의 총액이 유저가 가지고있는 포인트보다 적다면
            //구매 불가
            throw new Exception("포인트가 부족합니다. 충전하러 가시겠습니까?");
        }
        //여기까지 왔다는 것은 구매에 성공한다는 의미
        int remain_point=user_point-total_point;
        //유저 포인트 감소시키고 반영해야함.
        ConcurrentHashMap point_map=new ConcurrentHashMap<>();
        point_map.put("remain_point",remain_point);
        point_map.put("user_id",user_id);
        int point_result=itemUserDaoimpl.updateUser_point(point_map);
        if(point_result!=1){
            throw new Exception("구매에 실패했습니다. 다시 시도해 주세요.1");
        }
        //유저포인트 감소했다면, 장바구니에서 삭제하자.
        ConcurrentHashMap cart_map=new ConcurrentHashMap<>();
        cart_map.put("cart_id",cart_id);
        cart_map.put("id_list",id_list);
        int cart_list=itemUserDaoimpl.delete_item_in_Cart(cart_map);
        if(cart_list!=id_list.size()){
            throw new Exception("구매에 실패했습니다. 다시 시도해주세요.2");
        }
        //여기서부터는 아이템 보유 추가. 거래내역추가, 포인트 사용내역 추가
        int add_possesion=itemUserDaoimpl.add_item_to_user(orderDtoList);
        if(add_possesion!=orderDtoList.size()){
            throw new Exception("구매에 실패했습니다. 다시 시도해주세요.3");
        }
        int add_deal_detl=itemUserDaoimpl.add_deal_detl(orderDtoList);
        if(add_deal_detl!=orderDtoList.size()){
            throw new Exception("구매에 실패했습니다. 다시 시도해주세요.4");
        }//보유내역에 없으면 에러뜸.ㅎ 풔린키로 연결되어잇어서 그럼.
        int pnt_use_detl=itemUserDaoimpl.pnt_use_detl(orderDtoList);
        if(pnt_use_detl!=orderDtoList.size()){
            throw new Exception("구매에 실패했습니다. 다시 시도해주세요.5");
        }
        return 1;
    }
    public int getStat_from_possesion(OrderDto orderDto) throws Exception{
        return itemUserDaoimpl.getStat_from_possesion(orderDto);
    }

    @Transactional(rollbackFor = Exception.class)//오류 발생 시 모든 변경을 이전상태로 롤백시킴
    public boolean exchange_item(OrderDto orderDto) throws Exception{
        //1. 유저 포인트 증가
        int point=itemUserDaoimpl.getUser_point(orderDto.getUser_id());
        int total_point=point+orderDto.getItem_price();
        ConcurrentHashMap point_map=new ConcurrentHashMap();
        point_map.put("user_id",orderDto.getUser_id());
        point_map.put("total_point",total_point);
        int result=itemUserDaoimpl.increase_userPoint(point_map);
        if(result!=1){
            throw new Exception("환불에 실패했습니다. 포인트 갱신에 실패했습니다.");
        }
        //2.보유 목록에서 삭제
        int delete_in_possesion=itemUserDaoimpl.delete_in_possesion(orderDto);
        if(delete_in_possesion!=1){
            throw new Exception("환불에 실패했습니다. 보유목록에서 제거되지 않았습니다.");
        }
        //3. 거래내역에 환불정보 올려야함.
        int exchange_insert_deal_detl=itemUserDaoimpl.exchange_insert_deal_detl(orderDto);
        if(exchange_insert_deal_detl!=1){
            throw new Exception("환불에 실패했습니다. 거래내역에 추가되지 않았습니다.");
        }
        //4. 포인트 사용내역에 추가/ use_stat 0 환불
        int exchange_insert_pnt_detl=itemUserDaoimpl.exchange_insert_pnt_detl(orderDto);
        if(exchange_insert_pnt_detl!=1){
            throw new Exception("환불에 실패했습니다. 포인트 사용내역에 추가되지 않았습니다.");
        }
        return true;
    }
}
