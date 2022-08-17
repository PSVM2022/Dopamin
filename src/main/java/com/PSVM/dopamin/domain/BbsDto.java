package com.PSVM.dopamin.domain;

import java.sql.Timestamp;
import java.util.Objects;
import java.util.Random;

public class BbsDto {

    private int bbsId;
    private String bbsNm;
    private int bbsPrior;
    private Timestamp inDate;
    private String inUser;
    private String upUser;

    BbsDto(String bbsNm, Integer bbsPrior, String editorNm) {
        this.bbsNm = bbsNm;
        this.bbsPrior = bbsPrior;
        this.inDate = new Timestamp(System.currentTimeMillis());
        this.inUser = this.upUser = editorNm;
    }

    BbsDto(String bbsNm, String editorNm) {
        this(bbsNm, 0, editorNm);
    }

    BbsDto() {
        this("임시 판" + getRandomHexStr(), "관리자");
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

    public int getBbsId() {
        return bbsId;
    }

    public String getBbsNm() {
        return bbsNm;
    }

    public void setBbsNm(String bbsNm, String editorNm) {
        this.bbsNm = bbsNm;
        this.upUser = editorNm;
    }

    public int getBbsPrior() {
        return bbsPrior;
    }

    public void setBbsPrior(Integer bbsPrior, String editorNm) {
        this.bbsPrior = bbsPrior;
        this.upUser = editorNm;
    }

    public Timestamp getInDate() {
        return inDate;
    }

    public String getInUser() {
        return inUser;
    }


    public String getUpUser() {
        return upUser;
    }

    public void setUpUser(String upUser) {
        this.upUser = upUser;
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
        return bbsNm.equals(bbsDto.bbsNm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bbsNm);
    }

    @Override
    public String toString() {
        return "BbsDto{" +
            "bbsId=" + bbsId +
            ", bbsNm='" + bbsNm + '\'' +
            ", bbsPrior=" + bbsPrior +
            ", inDate=" + inDate +
            ", inUser='" + inUser + '\'' +
            ", upUser='" + upUser + '\'' +
            '}';
    }
}
