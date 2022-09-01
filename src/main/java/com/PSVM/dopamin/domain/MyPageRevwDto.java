package com.PSVM.dopamin.domain;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class MyPageRevwDto {
    private Integer revw_id;     //한줄평 id
    private String user_id;      //user id
    private Integer cnts_id;     // 컨텐츠 id
    private String cnts_title;   // 컨텐츠 제목
    private String revw_body;    // 컨텐츠 내용
    private Integer revw_eval;  // 한줄평 평가
    private Integer revw_visib_stat; //한줄평 상태
    private Timestamp up_date;       // 한줄평 등록일
//    private String date_format; // 등록일 형식지정
}

