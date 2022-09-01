package com.PSVM.dopamin.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyPageCntsDto {
    private Integer cnts_id;    // 컨텐츠 id
    private String cnts_title;  // 컨텐츠 제목
    private String user_id;
    private Timestamp in_date;  // 컨텐츠 등록일 (찜 or 조회수)
    private String cnts_postr_img;  //컨텐츠 포스터 이미지
    private Integer cnts_visib_stat; // 컨텐츠 상태 0/1
}
