package com.PSVM.dopamin.domain;

public class MyPageDto {
    private String user_id;
    private String prf_img; //프로필 이미지 url
    private String nic;     //닉네임
    private Integer dopa_exp;   //도파 exp
    private Integer dopa_point; //도파 포인트
    private Integer fav_genre1;    // 선호 장르 번호
    private String genre_nm;        //선호 장르 이름
    private String btdt;           //유저 생년월일
    private Integer age;        // 유저 나이
    private Integer sex;        // 유저 성별
    private String item_img;    // 착용중인 보유 스킨

    public MyPageDto(){                                           }
    public MyPageDto(String user_id, String prf_img, String nic, Integer dopa_exp, Integer dopa_point, Integer fav_genre1, String genre_nm, String btdt, Integer age, Integer sex, String item_img) {
        this.user_id = user_id;
        this.prf_img = prf_img;
        this.nic = nic;
        this.dopa_exp = dopa_exp;
        this.dopa_point = dopa_point;
        this.fav_genre1 = fav_genre1;
        this.genre_nm = genre_nm;
        this.btdt = btdt;
        this.age = age;
        this.sex = sex;
        this.item_img = item_img;
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

    public Integer getFav_genre1() {
        return fav_genre1;
    }

    public void setFav_genre1(Integer fav_genre1) {
        this.fav_genre1 = fav_genre1;
    }

    public String getGenre_nm() {
        return genre_nm;
    }

    public void setGenre_nm(String genre_nm) {
        this.genre_nm = genre_nm;
    }

    public String getBtdt() {
        return btdt;
    }

    public void setBtdt(String btdt) {
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

    public String getItem_img() {
        return item_img;
    }

    public void setItem_img(String item_img) {
        this.item_img = item_img;
    }
}