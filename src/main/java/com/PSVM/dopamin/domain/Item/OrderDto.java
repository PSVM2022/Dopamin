package com.PSVM.dopamin.domain.Item;

import java.util.List;

public class OrderDto {
    private int item_id;
    private String item_nm;
    private int item_price;
    private String user_id;

    @Override
    public String toString() {
        return "OrderDto{" +
                "item_id=" + item_id +
                ", item_nm='" + item_nm + '\'' +
                ", item_price=" + item_price +
                ", user_id='" + user_id + '\'' +
                '}';
    }

    public OrderDto(){
    }

    public OrderDto(int item_id, String user_id) {
        this.item_id = item_id;
        this.user_id = user_id;
    }

    public OrderDto(int item_id, String item_nm, int item_price) {
        this.item_id = item_id;
        this.item_nm = item_nm;
        this.item_price = item_price;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_nm() {
        return item_nm;
    }

    public void setItem_nm(String item_nm) {
        this.item_nm = item_nm;
    }

    public int getItem_price() {
        return item_price;
    }

    public void setItem_price(int item_price) {
        this.item_price = item_price;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

}
