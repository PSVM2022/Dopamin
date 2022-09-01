package com.PSVM.dopamin.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyPagePostDto {
    private String user_id;
    private Integer bbs_id;     // 게시판 id
    private String bbs_nm;      // 게시판 이름
    private Integer post_id;    // 게시글 id
    private String post_title;  //게시글 제목
    private Integer post_view_cnt;  //게시글 조회수
    private Integer post_reply_cnt; //게시글 댓글수
    private Timestamp up_date;       //게시글 등록일
    private Integer post_visib; //게시글 공개 여부
}