package com.PSVM.dopamin.domain.Item;

import java.sql.Timestamp;

public class Cart_ItemDto {
    private int item_id;
    private int cart_id;
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date;
    private String up_user;

    public Cart_ItemDto(){}

    @Override
    public String toString() {
        return "Cart_ITemDto{" +
                "item_id=" + item_id +
                ", cart_id=" + cart_id +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public Timestamp getIn_date() {
        return in_date;
    }

    public void setIn_date(Timestamp in_date) {
        this.in_date = in_date;
    }

    public String getIn_user() {
        return in_user;
    }

    public void setIn_user(String in_user) {
        this.in_user = in_user;
    }

    public Timestamp getUp_date() {
        return up_date;
    }

    public void setUp_date(Timestamp up_date) {
        this.up_date = up_date;
    }

    public String getUp_user() {
        return up_user;
    }

    public void setUp_user(String up_user) {
        this.up_user = up_user;
    }
}
