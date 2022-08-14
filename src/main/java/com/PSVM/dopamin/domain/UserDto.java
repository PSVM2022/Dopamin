package com.PSVM.dopamin.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class UserDto {
    private String user_id;
    private String f_nm;
    private String l_nm;
    private String phone_num;
    private String mbti;
    private String cnty;
    private String email;
    private String nic;
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date btdt;
    private byte sex;
    private String prf_img;
    private Integer dopa_exp;
    private Integer dopa_point;
    private Integer user_stat;
    private String fav_genre1;
    private String fav_genre2;
    private String fav_genre3;
    private String fav_genre4;
    private String fav_genre5;
    private Integer rept_times;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    public UserDto(){}
    public UserDto(String user_id, String f_nm, String l_nm, String phone_num, String mbti, String cnty, String email, String nic, Date btdt, byte sex,
                   String prf_img, String fav_genre1, String fav_genre2, String fav_genre3, String fav_genre4, String fav_genre5) {
        this.user_id = user_id;
        this.f_nm = f_nm;
        this.l_nm = l_nm;
        this.phone_num = phone_num;
        this.mbti = mbti;
        this.cnty = cnty;
        this.email = email;
        this.nic = nic;
        this.btdt = btdt;
        this.sex = sex;
        this.prf_img = prf_img;
        this.fav_genre1 = fav_genre1;
        this.fav_genre2 = fav_genre2;
        this.fav_genre3 = fav_genre3;
        this.fav_genre4 = fav_genre4;
        this.fav_genre5 = fav_genre5;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "user_id='" + user_id + '\'' +
                ", f_nm='" + f_nm + '\'' +
                ", l_nm='" + l_nm + '\'' +
                ", phone_num='" + phone_num + '\'' +
                ", mbti='" + mbti + '\'' +
                ", cnty='" + cnty + '\'' +
                ", email='" + email + '\'' +
                ", nic='" + nic + '\'' +
                ", btdt=" + btdt +
                ", sex=" + sex +
                ", prf_img='" + prf_img + '\'' +
                ", dopa_exp=" + dopa_exp +
                ", dopa_point=" + dopa_point +
                ", user_stat=" + user_stat +
                ", fav_genre1=" + fav_genre1 +
                ", fav_genre2=" + fav_genre2 +
                ", fav_genre3=" + fav_genre3 +
                ", fav_genre4=" + fav_genre4 +
                ", fav_genre5=" + fav_genre5 +
                ", rept_times=" + rept_times +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getF_nm() {
        return f_nm;
    }

    public void setF_nm(String f_nm) {
        this.f_nm = f_nm;
    }

    public String getL_nm() {
        return l_nm;
    }

    public void setL_nm(String l_nm) {
        this.l_nm = l_nm;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getMbti() {
        return mbti;
    }

    public void setMbti(String mbti) {
        this.mbti = mbti;
    }

    public String getCnty() {
        return cnty;
    }

    public void setCnty(String cnty) {
        this.cnty = cnty;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public Date getBtdt() {
        return btdt;
    }

    public void setBtdt(Date btdt) {
        this.btdt = btdt;
    }

    public byte getSex() {
        return sex;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public String getPrf_img() {
        return prf_img;
    }

    public void setPrf_img(String prf_img) {
        this.prf_img = prf_img;
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

    public Integer getUser_stat() {
        return user_stat;
    }

    public void setUser_stat(Integer user_stat) {
        this.user_stat = user_stat;
    }

    public String getFav_genre1() {
        return fav_genre1;
    }

    public void setFav_genre1(String fav_genre1) {
        this.fav_genre1 = fav_genre1;
    }

    public String getFav_genre2() {
        return fav_genre2;
    }

    public void setFav_genre2(String fav_genre2) {
        this.fav_genre2 = fav_genre2;
    }

    public String getFav_genre3() {
        return fav_genre3;
    }

    public void setFav_genre3(String fav_genre3) {
        this.fav_genre3 = fav_genre3;
    }

    public String getFav_genre4() {
        return fav_genre4;
    }

    public void setFav_genre4(String fav_genre4) {
        this.fav_genre4 = fav_genre4;
    }

    public String getFav_genre5() {
        return fav_genre5;
    }

    public void setFav_genre5(String fav_genre5) {
        this.fav_genre5 = fav_genre5;
    }

    public Integer getRept_times() {
        return rept_times;
    }

    public void setRept_times(Integer rept_times) {
        this.rept_times = rept_times;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public String getIn_user() {
        return in_user;
    }

    public void setIn_user(String in_user) {
        this.in_user = in_user;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public String getUp_user() {
        return up_user;
    }

    public void setUp_user(String up_user) {
        this.up_user = up_user;
    }
}

