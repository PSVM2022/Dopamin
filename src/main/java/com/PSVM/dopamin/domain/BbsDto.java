package com.PSVM.dopamin.domain;

import java.util.Date;
import java.util.Objects;

public class BbsDto {

    private Integer bbs_id;
    private String bbs_nm;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    public BbsDto(String bbs_nm) {
        this.bbs_nm = bbs_nm;
    }

    public Integer getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(Integer bbs_id) {
        this.bbs_id = bbs_id;
    }

    public String getBbs_nm() {
        return bbs_nm;
    }

    public void setBbs_nm(String bbs_nm) {
        this.bbs_nm = bbs_nm;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BbsDto bbsDto = (BbsDto) o;
        return bbs_id.equals(bbsDto.bbs_id) && bbs_nm.equals(bbsDto.bbs_nm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bbs_id, bbs_nm);
    }
}
