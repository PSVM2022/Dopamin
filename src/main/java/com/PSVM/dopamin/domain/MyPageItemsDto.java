package com.PSVM.dopamin.domain;

public class MyPageItemsDto {
    private Integer item_id;
    private Integer list_id;    //아이템 리스트
    private String item_nm;     // 아이템 이름
    private String item_img;    //아이템 이미지
    private String user_id;     //유저 아이디
    private Integer equip_stat; //착용상태

    @Override
    public String toString() {
        return "MyPageItemsDto{" +
                "item_id=" + item_id +
                ", list_id=" + list_id +
                ", item_nm='" + item_nm + '\'' +
                ", item_img='" + item_img + '\'' +
                ", user_id='" + user_id + '\'' +
                ", equip_stat=" + equip_stat +
                '}';
    }

    public MyPageItemsDto(){}
    public MyPageItemsDto(Integer item_id, Integer list_id, String item_nm, String item_img, String user_id, Integer equip_stat) {
        this.item_id = item_id;
        this.list_id = list_id;
        this.item_nm = item_nm;
        this.item_img = item_img;
        this.user_id = user_id;
        this.equip_stat = equip_stat;
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

    public String getItem_nm() {
        return item_nm;
    }

    public void setItem_nm(String item_nm) {
        this.item_nm = item_nm;
    }

    public String getItem_img() {
        return item_img;
    }

    public void setItem_img(String item_img) {
        this.item_img = item_img;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getEquip_stat() {
        return equip_stat;
    }

    public void setEquip_stat(Integer equip_stat) {
        this.equip_stat = equip_stat;
    }
}