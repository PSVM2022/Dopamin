package com.PSVM.dopamin.domain.Item;

import java.sql.Timestamp;

public class Item_ListDto {
    private int list_id;
    private String list_nm;
    private String in_user;
    private Timestamp up_date;
    private String up_user;

    public Item_ListDto(){}

    @Override
    public String toString() {
        return "Item_ListDto{" +
                "list_id=" + list_id +
                ", list_nm='" + list_nm + '\'' +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }

    public int getList_id() {
        return list_id;
    }

    public void setList_id(int list_id) {
        this.list_id = list_id;
    }

    public String getList_nm() {
        return list_nm;
    }

    public void setList_nm(String list_nm) {
        this.list_nm = list_nm;
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
