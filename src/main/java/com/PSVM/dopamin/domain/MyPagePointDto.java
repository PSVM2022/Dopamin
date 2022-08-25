package com.PSVM.dopamin.domain;

public class MyPagePointDto {
    private String pnt_use_id;  // 포인트 사용 id
    private String pchs_item_id; //구매 id
    private Integer use_stat;   // 0환불, 1구매
    private Integer pnt;    //포인트
    private String user_id;
    private Integer list_id;    // 아이템 구분 스킨/꾸미기
    private String grd_nm;      //아이템 등급
    private String item_nm;     // 아이템 이름
    private String item_img;    // 아이템 이미지
    private String in_date;     // 구매/환불 날짜

    @Override
    public String toString() {
        return "MyPagePointDto{" +
                "pnt_use_id='" + pnt_use_id + '\'' +
                ", pchs_item_id='" + pchs_item_id + '\'' +
                ", use_stat=" + use_stat +
                ", pnt=" + pnt +
                ", user_id='" + user_id + '\'' +
                ", list_id=" + list_id +
                ", grd_nm='" + grd_nm + '\'' +
                ", item_nm='" + item_nm + '\'' +
                ", item_img='" + item_img + '\'' +
                ", in_date='" + in_date + '\'' +
                '}';
    }

    public MyPagePointDto(){}
    public MyPagePointDto(String pnt_use_id, String pchs_item_id, Integer use_stat, Integer pnt, String user_id, Integer list_id, String grd_nm, String item_nm, String item_img, String in_date) {
        this.pnt_use_id = pnt_use_id;
        this.pchs_item_id = pchs_item_id;
        this.use_stat = use_stat;
        this.pnt = pnt;
        this.user_id = user_id;
        this.list_id = list_id;
        this.grd_nm = grd_nm;
        this.item_nm = item_nm;
        this.item_img = item_img;
        this.in_date = in_date;
    }

    public String getPnt_use_id() {
        return pnt_use_id;
    }

    public void setPnt_use_id(String pnt_use_id) {
        this.pnt_use_id = pnt_use_id;
    }

    public String getPchs_item_id() {
        return pchs_item_id;
    }

    public void setPchs_item_id(String pchs_item_id) {
        this.pchs_item_id = pchs_item_id;
    }

    public Integer getUse_stat() {
        return use_stat;
    }

    public void setUse_stat(Integer use_stat) {
        this.use_stat = use_stat;
    }

    public Integer getPnt() {
        return pnt;
    }

    public void setPnt(Integer pnt) {
        this.pnt = pnt;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getList_id() {
        return list_id;
    }

    public void setList_id(Integer list_id) {
        this.list_id = list_id;
    }

    public String getGrd_nm() {
        return grd_nm;
    }

    public void setGrd_nm(String grd_nm) {
        this.grd_nm = grd_nm;
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

    public String getIn_date() {
        return in_date;
    }

    public void setIn_date(String in_date) {
        this.in_date = in_date;
    }
}
