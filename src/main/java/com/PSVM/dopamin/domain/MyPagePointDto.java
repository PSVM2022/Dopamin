package com.PSVM.dopamin.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyPagePointDto {
    private String pnt_use_id;  // 포인트 사용 id
    private String pchs_item_id; //구매 id
    private Integer use_stat;   // 0환불, 1구매
    private Integer pnt;    //포인트
    private String user_id;
    private Integer list_id;    // 아이템 구분 스킨/꾸미기
    private String grd_nm;      //아이템 등급
    private String item_nm;     // 아이템 이름
    private String item_img;    // 아이템 이미지
    private Timestamp in_date;     // 구매/환불 날짜
}