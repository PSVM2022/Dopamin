package com.PSVM.dopamin.domain;

import java.util.Date;

public class MyPagePostDto {
    private String user_id;
    private Integer bbs_id;     // 게시판 id
    private Integer post_id;    // 게시글 id
    private String post_title;  //게시글 제목
    private Integer post_view_cnt;  //게시글 조회수
    private Integer post_reply_cnt; //게시글 댓글수
    private Date in_date;       //게시글 등록일
    private Integer post_visib; //게시글 공개 여부

    public MyPagePostDto() {}
    public MyPagePostDto(String user_id, Integer bbs_id, Integer post_id, String post_title, Integer post_view_cnt, Integer post_reply_cnt, Date in_date, Integer post_visib) {
        this.user_id = user_id;
        this.bbs_id = bbs_id;
        this.post_id = post_id;
        this.post_title = post_title;
        this.post_view_cnt = post_view_cnt;
        this.post_reply_cnt = post_reply_cnt;
        this.in_date = in_date;
        this.post_visib = post_visib;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(Integer bbs_id) {
        this.bbs_id = bbs_id;
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public Integer getPost_view_cnt() {
        return post_view_cnt;
    }

    public void setPost_view_cnt(Integer post_view_cnt) {
        this.post_view_cnt = post_view_cnt;
    }

    public Integer getPost_reply_cnt() {
        return post_reply_cnt;
    }

    public void setPost_reply_cnt(Integer post_reply_cnt) {
        this.post_reply_cnt = post_reply_cnt;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public Integer getPost_visib() {
        return post_visib;
    }

    public void setPost_visib(Integer post_visib) {
        this.post_visib = post_visib;
    }
}
