package com.PSVM.dopamin.domain;

import java.util.Date;

public class MyPageCntsDto {
    private Integer cnts_id;    // 컨텐츠 id
    private String user_id;
    private Date in_date;  // 컨텐츠 등록일 (찜 or 조회수)
    private String cnts_postr_img;  //컨텐츠 포스터 이미지
    private Integer cnts_visib_stat; // 컨텐츠 상태 0/1

    public MyPageCntsDto(){}
    public MyPageCntsDto(Integer cnts_id, String user_id, Date in_date, String cnts_postr_img, Integer cnts_visib_stat) {
        this.cnts_id = cnts_id;
        this.user_id = user_id;
        this.in_date = in_date;
        this.cnts_postr_img = cnts_postr_img;
        this.cnts_visib_stat = cnts_visib_stat;
    }

    public Integer getCnts_id() {
        return cnts_id;
    }

    public void setCnts_id(Integer cnts_id) {
        this.cnts_id = cnts_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public String getCnts_postr_img() {
        return cnts_postr_img;
    }

    public void setCnts_postr_img(String cnts_postr_img) {
        this.cnts_postr_img = cnts_postr_img;
    }

    public Integer getCnts_visib_stat() {
        return cnts_visib_stat;
    }

    public void setCnts_visib_stat(Integer cnts_visib_stat) {
        this.cnts_visib_stat = cnts_visib_stat;
    }
}
