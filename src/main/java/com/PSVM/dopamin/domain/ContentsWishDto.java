package com.PSVM.dopamin.domain;

import java.sql.Timestamp;

public class ContentsWishDto {

    private Integer cnts_id;    //찜한 컨텐츠 번호
    private String user_id;     //찜한 유저 아이디
    private java.sql.Timestamp in_date;  //찜한 일자
    private String in_user;
    private java.sql.Timestamp up_date;
    private String up_user;


    public ContentsWishDto() {
    }

    public ContentsWishDto(Integer cnts_id, String user_id, Timestamp in_date, String in_user, Timestamp up_date, String up_user) {
        this.cnts_id = cnts_id;
        this.user_id = user_id;
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
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
        return "ContentsWishDto{" +
                "cnts_id=" + cnts_id +
                ", user_id='" + user_id + '\'' +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}
