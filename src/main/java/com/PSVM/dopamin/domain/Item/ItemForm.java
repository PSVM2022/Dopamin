package com.PSVM.dopamin.domain.Item;

import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;

public class ItemForm {
    private int item_id;
    private String list_nm;
    private String item_grd;
    private String item_nm;
    private String item_dsc;
    private String item_price;

    public ItemForm(){}

    @Override
    public String toString() {
        return "ItemForm{" +
                "item_id=" + item_id +
                ", list_nm='" + list_nm + '\'' +
                ", item_grd='" + item_grd + '\'' +
                ", item_nm='" + item_nm + '\'' +
                ", item_dsc='" + item_dsc + '\'' +
                ", item_price='" + item_price + '\'' +
                '}';
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getList_nm() {
        return list_nm;
    }

    public void setList_nm(String list_nm) {
        this.list_nm = list_nm;
    }

    public String getItem_grd() {
        return item_grd;
    }

    public void setItem_grd(String item_grd) {
        this.item_grd = item_grd;
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

    public String getItem_price() {
        return item_price;
    }

    public void setItem_price(String item_price) {
        this.item_price = item_price;
    }
}
