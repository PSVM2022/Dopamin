package com.PSVM.dopamin.domain;

import java.sql.Timestamp;

public class CntsEvalDto {

    private Integer cnts_id;
    private String user_id;
    private Integer cnts_eval;
    private java.sql.Timestamp in_date;
    private String in_user;
    private java.sql.Timestamp up_date;
    private String up_user;

    public CntsEvalDto() {}

    public CntsEvalDto(Integer cnts_id, String user_id, Integer cnts_eval, Timestamp in_date, String in_user, Timestamp up_date, String up_user) {
        this.cnts_id = cnts_id;
        this.user_id = user_id;
        this.cnts_eval = cnts_eval;
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

    public Integer getCnts_eval() {
        return cnts_eval;
    }

    public void setCnts_eval(Integer cnts_eval) {
        this.cnts_eval = cnts_eval;
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
        return "CntsEvalDto{" +
                "cnts_id=" + cnts_id +
                ", user_id='" + user_id + '\'' +
                ", cnts_eval=" + cnts_eval +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}
