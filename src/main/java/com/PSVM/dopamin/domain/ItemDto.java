package com.PSVM.dopamin.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class  ItemDto {
    private Integer item_id;
    private Integer list_id;
    private Integer grd_id;
    private String item_nm;
    private String item_dsc;
    private BigDecimal item_price;
    private String item_img;
    private Integer stat;
    private Integer dc_rate;
    private Integer dc_price;
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date;
    private String up_user;
    //private String user_nic;
    public ItemDto(){}

    public ItemDto(Integer item_id, Integer list_id, Integer grd_id, String item_nm, String item_dsc, BigDecimal item_price, String item_img, Integer stat, Integer dc_rate, Integer dc_price, Timestamp in_date, String in_user, Timestamp up_date, String up_user, String user_nic) {
        this.item_id = item_id;
        this.list_id = list_id;
        this.grd_id = grd_id;
        this.item_nm = item_nm;
        this.item_dsc = item_dsc;
        this.item_price = item_price;
        this.item_img = item_img;
        this.stat = stat;
        this.dc_rate = dc_rate;
        this.dc_price = dc_price;
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
        //this.user_nic = user_nic;
    }

    public ItemDto(Integer list_id, Integer grd_id, String item_nm, String item_dsc, BigDecimal item_price, String item_img, Timestamp in_date, String user_nic) {
        this.list_id = list_id;
        this.grd_id = grd_id;
        this.item_nm = item_nm;
        this.item_dsc = item_dsc;
        this.item_price = item_price;
        this.item_img = item_img;
        this.in_date = in_date;
        //this.user_nic = user_nic;
    }

    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }

    public Integer getList_id() {
        return list_id;
    }

    public void setList_id(Integer list_id) {
        this.list_id = list_id;
    }

    public Integer getGrd_id() {
        return grd_id;
    }

    public void setGrd_id(Integer grd_id) {
        this.grd_id = grd_id;
    }

    public String getItem_nm() {
        return item_nm;
    }

    public void setItem_nm(String item_nm) {
        this.item_nm = item_nm;
    }

    public String getItem_dsc() {
        return item_dsc;
    }

    public void setItem_dsc(String item_dsc) {
        this.item_dsc = item_dsc;
    }

    public BigDecimal getItem_price() {
        return item_price;
    }

    public void setItem_price(BigDecimal item_price) {
        this.item_price = item_price;
    }

    public String getItem_img() {
        return item_img;
    }

    public void setItem_img(String item_img) {
        this.item_img = item_img;
    }

    public Integer getStat() {
        return stat;
    }

    public void setStat(Integer stat) {
        this.stat = stat;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getDc_price() {
        return dc_price;
    }

    public void setDc_price(Integer dc_price) {
        this.dc_price = dc_price;
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

//    public String getUser_nic() {
//        return user_nic;
//    }

//    public void setUser_nic(String user_nic) {
//        this.user_nic = user_nic;
//    }


}
