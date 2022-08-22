package com.PSVM.dopamin.domain;

import java.sql.Timestamp;
import java.util.Objects;
import java.util.Random;

public class BbsDto {

    private Integer bbs_id;
    private String bbs_nm;
    private Integer bbs_prior;
    private Integer bbs_visib;
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date;
    private String up_user;

    public BbsDto(
        Integer bbs_id,
        String bbs_nm,
        Integer bbs_prior,
        Integer bbs_visib,
        Timestamp in_date,
        String in_user,
        Timestamp up_date,
        String up_user
    ) {
        this.bbs_id = bbs_id;
        this.bbs_nm = bbs_nm;
        this.bbs_prior = bbs_prior;
        this.bbs_visib = bbs_visib;
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
    }

    public BbsDto(String bbsNm, Integer bbsPrior, String editorNm) {
        this.bbs_nm = bbsNm;
        this.bbs_prior = bbsPrior;
        this.bbs_visib = 1;
        this.in_date = new Timestamp(System.currentTimeMillis());
        this.in_user = this.up_user = editorNm;
    }

    public BbsDto(String bbsNm, String editorNm) {
        this(bbsNm, 0, editorNm);
    }

    public BbsDto() {
        this("임시 판#" + getRandomHexStr(), "관리자");
    }


    private static String getRandomHexStr() {
        StringBuilder ret = new StringBuilder();

        byte[] arr = new byte[4];
        new Random().nextBytes(arr);
        for (byte b : arr) {
            ret.append(String.format("%02x", b));
        }
        return ret.toString();
    }

    public Integer getBbsId() {
        return bbs_id;
    }

    public void setBbsId(Integer bbsId) {
        this.bbs_id = bbsId;
    }

    public String getBbsNm() {
        return bbs_nm;
    }

    public void setBbsNm(String bbsNm) {
        this.bbs_nm = bbsNm;
    }

    public int getBbsPrior() {
        return bbs_prior;
    }

    public void setBbsPrior(int bbsPrior) {
        this.bbs_prior = bbsPrior;
    }

    public Integer getBbsVisib() {
        return bbs_visib;
    }

    public void setBbsVisib(Integer bbsVisib) {
        this.bbs_visib = bbsVisib;
    }

    public Timestamp getInDate() {
        return in_date;
    }

    public void setInDate(Timestamp inDate) {
        this.in_date = inDate;
    }

    public String getInUser() {
        return in_user;
    }

    public void setInUser(String inUser) {
        this.in_user = inUser;
    }

    public Timestamp getUpDate() {
        return up_date;
    }

    public void setUpDate(Timestamp upDate) {
        this.up_date = upDate;
    }

    public String getUpUser() {
        return up_user;
    }

    public void setUpUser(String upUser) {
        this.up_user = upUser;
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
        return bbs_id.equals(bbsDto.bbs_id) && bbs_nm.equals(bbsDto.bbs_nm) && bbs_prior.equals(
            bbsDto.bbs_prior);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bbs_id, bbs_nm, bbs_prior);
    }

    @Override
    public String toString() {
        return "BbsDto{" +
            "bbs_id=" + bbs_id +
            ", bbs_nm='" + bbs_nm + '\'' +
            ", bbs_prior=" + bbs_prior +
            ", bbs_visible=" + bbs_visib +
            ", in_date=" + in_date +
            ", in_user='" + in_user + '\'' +
            ", up_date=" + up_date +
            ", up_user='" + up_user + '\'' +
            '}' + "\n";
    }
}
