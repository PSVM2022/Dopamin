package com.PSVM.dopamin.domain;

import java.util.Date;

public class MyPageDto {
    private String user_id;
    private String prf_img; //프로필 이미지 url
    private String nic;     //닉네임
    private Integer dopa_exp;   //도파 exp
    private Integer dopa_point; //도파 포인트
    private String fav_genre1;    // 선호 장르
    private Date btdt;           //유저 생년월일
    private Integer age;        // 유저 나이
    private Integer sex;        // 유저 성별
    private Integer item_id;    // 착용중인 보유 스킨

    public MyPageDto() {}
    public MyPageDto(String user_id, String prf_img, String nic, Integer dopa_exp, Integer dopa_point, String fav_genre1, Date btdt, Integer age, Integer sex, Integer item_id) {
        this.user_id = user_id;
        this.prf_img = prf_img;
        this.nic = nic;
        this.dopa_exp = dopa_exp;
        this.dopa_point = dopa_point;
        this.fav_genre1 = fav_genre1;
        this.btdt = btdt;
        this.age = age;
        this.sex = sex;
        this.item_id = item_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPrf_img() {
        return prf_img;
    }

    public void setPrf_img(String prf_img) {
        this.prf_img = prf_img;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public Integer getDopa_exp() {
        return dopa_exp;
    }

    public void setDopa_exp(Integer dopa_exp) {
        this.dopa_exp = dopa_exp;
    }

    public Integer getDopa_point() {
        return dopa_point;
    }

    public void setDopa_point(Integer dopa_point) {
        this.dopa_point = dopa_point;
    }

    public String getFav_genre1() {
        return fav_genre1;
    }

    public void setFav_genre1(String fav_genre1) {
        this.fav_genre1 = fav_genre1;
    }

    public Date getBtdt() {
        return btdt;
    }

    public void setBtdt(Date btdt) {
        this.btdt = btdt;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }
}
