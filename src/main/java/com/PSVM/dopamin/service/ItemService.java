package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ItemDto;
import com.PSVM.dopamin.dao.ItemDaoImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ItemService {
    private final ItemDaoImpl itemDaoImpl;
    public ItemService(ItemDaoImpl itemDaoImpl) {
        this.itemDaoImpl = itemDaoImpl;
    }
    public int getCount() throws Exception{
        return itemDaoImpl.getCount();
    }

    public List<ItemDto> getPage(String order) throws Exception{
        int index;
        if(order.equals("스킨")){
            index=1;
        }
        else{
            index=2;
        }
        return itemDaoImpl.getPage(index);
    }
    public List<ItemDto> getStat_0() {
        return itemDaoImpl.getStat_0();
    }
    public List<ItemDto> getStat_1() {
        return itemDaoImpl.getStat_1();
    }
//    public int remove(Integer item_id) throws Exception{
//        return itemDaoImpl.remove(item_id);
//    }
//    public int getSearchResultPage(SearchCondition sc) {
//        return 0;
//    }
//


//    public String getUser_nic(String writer_id) throws Exception{
//        return itemDaoImpl.getUser_nic(writer_id);
//    }
//
//    public int register(Map map) throws Exception {
//        return itemDaoImpl.register(map);
//    }
//
//    public int getStatus(int item_id) throws Exception{
//        return itemDaoImpl.getStatus(item_id);
//    }
//
//    public int getUser_stat(String user_id) throws Exception {
//        return itemDaoImpl.getUser_stat(user_id);
//    }
//


//    public ItemDto read(Integer item_id) {
//    }


//    public ItemDto read(Integer item_id){
//        //ItemDto itemDto=ItemDaoImpl.select(item_id);
//        return itemDto;
//    }
}
