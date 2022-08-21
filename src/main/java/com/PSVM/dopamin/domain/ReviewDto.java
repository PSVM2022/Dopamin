package com.PSVM.dopamin.domain;

import java.sql.Timestamp;

public class ReviewDto {

    private Integer revw_id;
    private String user_id;
    private Integer cnts_id;
    private String revw_body;
    private Integer revw_visib_stat;
    private Integer revw_rept_times;
    private java.sql.Timestamp in_date;
    private String in_user;
    private java.sql.Timestamp up_date;
    private String up_user;

    public ReviewDto() {

    }

    public ReviewDto(Integer revw_id, String user_id, Integer cnts_id, String revw_body, Integer revw_visib_stat, Integer revw_rept_times, Timestamp in_date, String in_user, Timestamp up_date, String up_user) {
        this.revw_id = revw_id;
        this.user_id = user_id;
        this.cnts_id = cnts_id;
        this.revw_body = revw_body;
        this.revw_visib_stat = revw_visib_stat;
        this.revw_rept_times = revw_rept_times;
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
    }

    public Integer getRevw_id() {
        return revw_id;
    }

    public void setRevw_id(Integer revw_id) {
        this.revw_id = revw_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getCnts_id() {
        return cnts_id;
    }

    public void setCnts_id(Integer cnts_id) {
        this.cnts_id = cnts_id;
    }

    public String getRevw_body() {
        return revw_body;
    }

    public void setRevw_body(String revw_body) {
        this.revw_body = revw_body;
    }

    public Integer getRevw_visib_stat() {
        return revw_visib_stat;
    }

    public void setRevw_visib_stat(Integer revw_visib_stat) {
        this.revw_visib_stat = revw_visib_stat;
    }

    public Integer getRevw_rept_times() {
        return revw_rept_times;
    }

    public void setRevw_rept_times(Integer revw_rept_times) {
        this.revw_rept_times = revw_rept_times;
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
        return "ReviewDto{" +
                "revw_id=" + revw_id +
                ", user_id='" + user_id + '\'' +
                ", cnts_id=" + cnts_id +
                ", revw_body='" + revw_body + '\'' +
                ", revw_visib_stat=" + revw_visib_stat +
                ", revw_rept_times=" + revw_rept_times +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}
