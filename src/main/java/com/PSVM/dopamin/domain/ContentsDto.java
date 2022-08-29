package com.PSVM.dopamin.domain;

import java.sql.Timestamp;

public class ContentsDto {

    private ContentsWishDto cntsw;
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
    private Long ott1_click_cnt;
    private Long ott2_click_cnt;
    private Long ott3_click_cnt;
    private Integer cnts_harmful_imit_rsk;
    private Integer cnts_harmful_sexuality;
    private Integer cnts_harmful_vioc;
    private Integer cnts_harmful_fear;
    private Integer cnts_harmful_drug;
    private String cnts_grd;
    private String cnts_lang;
    private Integer cnts_dub;
    private Integer cnts_visib_stat;    //공개상태
    private java.sql.Timestamp in_date;
    private String in_user;
    private java.sql.Timestamp up_date;
    private String up_user;

    //기본생성자

    public ContentsDto(){

    }
    public ContentsDto(ContentsWishDto cntsw) {
        this.cntsw = cntsw;

    }

    public ContentsDto(ContentsWishDto cntsw, Integer cnts_id, String cnts_title, String cnts_subttl, String cnts_postr_img, String cnts_op_date, String cnts_genre1, String cnts_genre2, String cnts_genre3, String cnts_genre4, String cnts_genre5, String cnts_cnty, String cnts_director, String cnts_actor, String cnts_synop, String cnts_rning_t, String cnts_g_rated, String cnts_szn_cnt, String cnts_ep_cnt, Integer ott1_stat, Integer ott2_stat, Integer ott3_stat, Long ott1_click_cnt, Long ott2_click_cnt, Long ott3_click_cnt, Integer cnts_visib_stat) {
        this.cntsw = cntsw;
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
        this.ott1_click_cnt = ott1_click_cnt;
        this.ott2_click_cnt = ott2_click_cnt;
        this.ott3_click_cnt = ott3_click_cnt;
        this.cnts_visib_stat = cnts_visib_stat;
    }

    //getter setter
    public ContentsWishDto getCntsw() {
        return cntsw;
    }

    public void setCntsw(ContentsWishDto cntsw) {
        this.cntsw = cntsw;
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

    public Long getOtt1_click_cnt() {
        return ott1_click_cnt;
    }

    public void setOtt1_click_cnt(Long ott1_click_cnt) {
        this.ott1_click_cnt = ott1_click_cnt;
    }

    public Long getOtt2_click_cnt() {
        return ott2_click_cnt;
    }

    public void setOtt2_click_cnt(Long ott2_click_cnt) {
        this.ott2_click_cnt = ott2_click_cnt;
    }

    public Long getOtt3_click_cnt() {
        return ott3_click_cnt;
    }

    public void setOtt3_click_cnt(Long ott3_click_cnt) {
        this.ott3_click_cnt = ott3_click_cnt;
    }

    public Integer getCnts_harmful_imit_rsk() {
        return cnts_harmful_imit_rsk;
    }

    public void setCnts_harmful_imit_rsk(Integer cnts_harmful_imit_rsk) {
        this.cnts_harmful_imit_rsk = cnts_harmful_imit_rsk;
    }

    public Integer getCnts_harmful_sexuality() {
        return cnts_harmful_sexuality;
    }

    public void setCnts_harmful_sexuality(Integer cnts_harmful_sexuality) {
        this.cnts_harmful_sexuality = cnts_harmful_sexuality;
    }

    public Integer getCnts_harmful_vioc() {
        return cnts_harmful_vioc;
    }

    public void setCnts_harmful_vioc(Integer cnts_harmful_vioc) {
        this.cnts_harmful_vioc = cnts_harmful_vioc;
    }

    public Integer getCnts_harmful_fear() {
        return cnts_harmful_fear;
    }

    public void setCnts_harmful_fear(Integer cnts_harmful_fear) {
        this.cnts_harmful_fear = cnts_harmful_fear;
    }

    public Integer getCnts_harmful_drug() {
        return cnts_harmful_drug;
    }

    public void setCnts_harmful_drug(Integer cnts_harmful_drug) {
        this.cnts_harmful_drug = cnts_harmful_drug;
    }

    public String getCnts_grd() {
        return cnts_grd;
    }

    public void setCnts_grd(String cnts_grd) {
        this.cnts_grd = cnts_grd;
    }

    public String getCnts_lang() {
        return cnts_lang;
    }

    public void setCnts_lang(String cnts_lang) {
        this.cnts_lang = cnts_lang;
    }

    public Integer getCnts_dub() {
        return cnts_dub;
    }

    public void setCnts_dub(Integer cnts_dub) {
        this.cnts_dub = cnts_dub;
    }

    public Integer getCnts_visib_stat() {
        return cnts_visib_stat;
    }

    public void setCnts_visib_stat(Integer cnts_visib_stat) {
        this.cnts_visib_stat = cnts_visib_stat;
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

    @Override
    public String toString() {
        return "ContentsDto{" +
                "cntsw=" + cntsw +
                ", cnts_id=" + cnts_id +
                ", cnts_title='" + cnts_title + '\'' +
                ", cnts_subttl='" + cnts_subttl + '\'' +
                ", cnts_postr_img='" + cnts_postr_img + '\'' +
                ", cnts_op_date='" + cnts_op_date + '\'' +
                ", cnts_genre1='" + cnts_genre1 + '\'' +
                ", cnts_genre2='" + cnts_genre2 + '\'' +
                ", cnts_genre3='" + cnts_genre3 + '\'' +
                ", cnts_genre4='" + cnts_genre4 + '\'' +
                ", cnts_genre5='" + cnts_genre5 + '\'' +
                ", cnts_cnty='" + cnts_cnty + '\'' +
                ", cnts_director='" + cnts_director + '\'' +
                ", cnts_actor='" + cnts_actor + '\'' +
                ", cnts_synop='" + cnts_synop + '\'' +
                ", cnts_rning_t='" + cnts_rning_t + '\'' +
                ", cnts_g_rated='" + cnts_g_rated + '\'' +
                ", cnts_szn_cnt='" + cnts_szn_cnt + '\'' +
                ", cnts_ep_cnt='" + cnts_ep_cnt + '\'' +
                ", ott1_stat=" + ott1_stat +
                ", ott2_stat=" + ott2_stat +
                ", ott3_stat=" + ott3_stat +
                ", ott1_click_cnt=" + ott1_click_cnt +
                ", ott2_click_cnt=" + ott2_click_cnt +
                ", ott3_click_cnt=" + ott3_click_cnt +
                ", cnts_harmful_imit_rsk=" + cnts_harmful_imit_rsk +
                ", cnts_harmful_sexuality=" + cnts_harmful_sexuality +
                ", cnts_harmful_vioc=" + cnts_harmful_vioc +
                ", cnts_harmful_fear=" + cnts_harmful_fear +
                ", cnts_harmful_drug=" + cnts_harmful_drug +
                ", cnts_grd='" + cnts_grd + '\'' +
                ", cnts_lang='" + cnts_lang + '\'' +
                ", cnts_dub=" + cnts_dub +
                ", cnts_visib_stat=" + cnts_visib_stat +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}

