package com.PSVM.dopamin.domain;

public class ContentsUserDto {

    private String user_id;
    private String nic;
    private String fav_genre1;
    private Integer cnts_id;
    private String cnts_title;
    private String cnts_subttl;
    private String cnts_postr_img;
    private String cnts_op_date;
    private String cnts_genre1;
    private String cnts_genre2;
    private String  cnts_genre3;
    private String cnts_genre4;
    private String cnts_genre5;
    private String cnts_cnty;
    private String cnts_director;
    private String cnts_actor;
    private String cnts_synop;
    private String cnts_rning_t;
    private String cnts_g_rated;
    private String cnts_szn_cnt;
    private String cnts_ep_cnt;
    private Integer ott1_stat;
    private Integer ott2_stat;
    private Integer ott3_stat;
    private Integer cnts_visib_stat;    //공개상태

    public ContentsUserDto() {

    }

    public ContentsUserDto(String user_id, String nic, String fav_genre1, Integer cnts_id, String cnts_title, String cnts_subttl, String cnts_postr_img, String cnts_op_date, String cnts_genre1, String cnts_genre2, String cnts_genre3, String cnts_genre4, String cnts_genre5, String cnts_cnty, String cnts_director, String cnts_actor, String cnts_synop, String cnts_rning_t, String cnts_g_rated, String cnts_szn_cnt, String cnts_ep_cnt, Integer ott1_stat, Integer ott2_stat, Integer ott3_stat, Integer cnts_visib_stat) {
        this.user_id = user_id;
        this.nic = nic;
        this.fav_genre1 = fav_genre1;
        this.cnts_id = cnts_id;
        this.cnts_title = cnts_title;
        this.cnts_subttl = cnts_subttl;
        this.cnts_postr_img = cnts_postr_img;
        this.cnts_op_date = cnts_op_date;
        this.cnts_genre1 = cnts_genre1;
        this.cnts_genre2 = cnts_genre2;
        this.cnts_genre3 = cnts_genre3;
        this.cnts_genre4 = cnts_genre4;
        this.cnts_genre5 = cnts_genre5;
        this.cnts_cnty = cnts_cnty;
        this.cnts_director = cnts_director;
        this.cnts_actor = cnts_actor;
        this.cnts_synop = cnts_synop;
        this.cnts_rning_t = cnts_rning_t;
        this.cnts_g_rated = cnts_g_rated;
        this.cnts_szn_cnt = cnts_szn_cnt;
        this.cnts_ep_cnt = cnts_ep_cnt;
        this.ott1_stat = ott1_stat;
        this.ott2_stat = ott2_stat;
        this.ott3_stat = ott3_stat;
        this.cnts_visib_stat = cnts_visib_stat;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getFav_genre1() {
        return fav_genre1;
    }

    public void setFav_genre1(String fav_genre1) {
        this.fav_genre1 = fav_genre1;
    }

    public Integer getCnts_id() {
        return cnts_id;
    }

    public void setCnts_id(Integer cnts_id) {
        this.cnts_id = cnts_id;
    }

    public String getCnts_title() {
        return cnts_title;
    }

    public void setCnts_title(String cnts_title) {
        this.cnts_title = cnts_title;
    }

    public String getCnts_subttl() {
        return cnts_subttl;
    }

    public void setCnts_subttl(String cnts_subttl) {
        this.cnts_subttl = cnts_subttl;
    }

    public String getCnts_postr_img() {
        return cnts_postr_img;
    }

    public void setCnts_postr_img(String cnts_postr_img) {
        this.cnts_postr_img = cnts_postr_img;
    }

    public String getCnts_op_date() {
        return cnts_op_date;
    }

    public void setCnts_op_date(String cnts_op_date) {
        this.cnts_op_date = cnts_op_date;
    }

    public String getCnts_genre1() {
        return cnts_genre1;
    }

    public void setCnts_genre1(String cnts_genre1) {
        this.cnts_genre1 = cnts_genre1;
    }

    public String getCnts_genre2() {
        return cnts_genre2;
    }

    public void setCnts_genre2(String cnts_genre2) {
        this.cnts_genre2 = cnts_genre2;
    }

    public String getCnts_genre3() {
        return cnts_genre3;
    }

    public void setCnts_genre3(String cnts_genre3) {
        this.cnts_genre3 = cnts_genre3;
    }

    public String getCnts_genre4() {
        return cnts_genre4;
    }

    public void setCnts_genre4(String cnts_genre4) {
        this.cnts_genre4 = cnts_genre4;
    }

    public String getCnts_genre5() {
        return cnts_genre5;
    }

    public void setCnts_genre5(String cnts_genre5) {
        this.cnts_genre5 = cnts_genre5;
    }

    public String getCnts_cnty() {
        return cnts_cnty;
    }

    public void setCnts_cnty(String cnts_cnty) {
        this.cnts_cnty = cnts_cnty;
    }

    public String getCnts_director() {
        return cnts_director;
    }

    public void setCnts_director(String cnts_director) {
        this.cnts_director = cnts_director;
    }

    public String getCnts_actor() {
        return cnts_actor;
    }

    public void setCnts_actor(String cnts_actor) {
        this.cnts_actor = cnts_actor;
    }

    public String getCnts_synop() {
        return cnts_synop;
    }

    public void setCnts_synop(String cnts_synop) {
        this.cnts_synop = cnts_synop;
    }

    public String getCnts_rning_t() {
        return cnts_rning_t;
    }

    public void setCnts_rning_t(String cnts_rning_t) {
        this.cnts_rning_t = cnts_rning_t;
    }

    public String getCnts_g_rated() {
        return cnts_g_rated;
    }

    public void setCnts_g_rated(String cnts_g_rated) {
        this.cnts_g_rated = cnts_g_rated;
    }

    public String getCnts_szn_cnt() {
        return cnts_szn_cnt;
    }

    public void setCnts_szn_cnt(String cnts_szn_cnt) {
        this.cnts_szn_cnt = cnts_szn_cnt;
    }

    public String getCnts_ep_cnt() {
        return cnts_ep_cnt;
    }

    public void setCnts_ep_cnt(String cnts_ep_cnt) {
        this.cnts_ep_cnt = cnts_ep_cnt;
    }

    public Integer getOtt1_stat() {
        return ott1_stat;
    }

    public void setOtt1_stat(Integer ott1_stat) {
        this.ott1_stat = ott1_stat;
    }

    public Integer getOtt2_stat() {
        return ott2_stat;
    }

    public void setOtt2_stat(Integer ott2_stat) {
        this.ott2_stat = ott2_stat;
    }

    public Integer getOtt3_stat() {
        return ott3_stat;
    }

    public void setOtt3_stat(Integer ott3_stat) {
        this.ott3_stat = ott3_stat;
    }

    public Integer getCnts_visib_stat() {
        return cnts_visib_stat;
    }

    public void setCnts_visib_stat(Integer cnts_visib_stat) {
        this.cnts_visib_stat = cnts_visib_stat;
    }
}
