package com.PSVM.dopamin.domain.Item;

import java.sql.Timestamp;

public class Pymt_DetlDto {
    private String user_id;
    private Integer pymt_amt;
    private Integer chg_pnt;
    private String pg_corp_detl_id;
    public Pymt_DetlDto() {
    }

    @Override
    public String toString() {
        return "Pymt_DetlDto{" +
                "user_id='" + user_id + '\'' +
                ", pymt_amt=" + pymt_amt +
                ", chg_pnt=" + chg_pnt +
                ", pg_corp_detl_id='" + pg_corp_detl_id + '\'' +
                '}';
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getPymt_amt() {
        return pymt_amt;
    }

    public void setPymt_amt(Integer pymt_amt) {
        this.pymt_amt = pymt_amt;
    }

    public Integer getChg_pnt() {
        return chg_pnt;
    }

    public void setChg_pnt(Integer chg_pnt) {
        this.chg_pnt = chg_pnt;
    }

    public String getPg_corp_detl_id() {
        return pg_corp_detl_id;
    }

    public void setPg_corp_detl_id(String pg_corp_detl_id) {
        this.pg_corp_detl_id = pg_corp_detl_id;
    }
}
