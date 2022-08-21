package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.ItemUserDaoImpl;
import com.PSVM.dopamin.domain.Cart_ItemDto;
import org.springframework.stereotype.Service;

@Service
public class ItemUserService {

    private final ItemUserDaoImpl itemUserDaoimpl;
    public ItemUserService(ItemUserDaoImpl itemUserDaoimpl) {
        this.itemUserDaoimpl = itemUserDaoimpl;
    }

    public int addCart(Cart_ItemDto cart_itemDto) throws Exception{
        return itemUserDaoimpl.addCart(cart_itemDto);
    }

    public int find_item(Integer item_id) {
        return itemUserDaoimpl.find_item(item_id);
    }

    public int getItem_stat(Integer item_id) {
        return itemUserDaoimpl.getItem_Stat(item_id);
    }
}
