package com.PSVM.dopamin.domain;

import java.util.Date;
import java.util.Objects;

public class PostDto {

    private Integer post_id;
    private Integer bbs_id;
    private String user_id;
    private String post_title;
    private String post_body;
    private Integer post_reply_cnt;
    private Integer post_view_cnt;
    private Byte post_visib;
    private Byte post_prior;
    private String post_atch1;
    private String post_atch2;
    private String post_atch3;
    private String post_atch4;
    private String post_atch5;
    private Integer post_rept_cnt;
    private Date int_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    public PostDto(String user_id, String post_title, String post_body) {
        this.user_id = user_id;
        this.post_title = post_title;
        this.post_body = post_body;
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public Integer getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(Integer bbs_id) {
        this.bbs_id = bbs_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_body() {
        return post_body;
    }

    public void setPost_body(String post_body) {
        this.post_body = post_body;
    }

    public Integer getPost_reply_cnt() {
        return post_reply_cnt;
    }

    public void setPost_reply_cnt(Integer post_reply_cnt) {
        this.post_reply_cnt = post_reply_cnt;
    }

    public Integer getPost_view_cnt() {
        return post_view_cnt;
    }

    public void setPost_view_cnt(Integer post_view_cnt) {
        this.post_view_cnt = post_view_cnt;
    }

    public Byte getPost_visib() {
        return post_visib;
    }

    public void setPost_visib(Byte post_visib) {
        this.post_visib = post_visib;
    }

    public Byte getPost_prior() {
        return post_prior;
    }

    public void setPost_prior(Byte post_prior) {
        this.post_prior = post_prior;
    }

    public String getPost_atch1() {
        return post_atch1;
    }

    public void setPost_atch1(String post_atch1) {
        this.post_atch1 = post_atch1;
    }

    public String getPost_atch2() {
        return post_atch2;
    }

    public void setPost_atch2(String post_atch2) {
        this.post_atch2 = post_atch2;
    }

    public String getPost_atch3() {
        return post_atch3;
    }

    public void setPost_atch3(String post_atch3) {
        this.post_atch3 = post_atch3;
    }

    public String getPost_atch4() {
        return post_atch4;
    }

    public void setPost_atch4(String post_atch4) {
        this.post_atch4 = post_atch4;
    }

    public String getPost_atch5() {
        return post_atch5;
    }

    public void setPost_atch5(String post_atch5) {
        this.post_atch5 = post_atch5;
    }

    public Integer getPost_rept_cnt() {
        return post_rept_cnt;
    }

    public void setPost_rept_cnt(Integer post_rept_cnt) {
        this.post_rept_cnt = post_rept_cnt;
    }

    public Date getInt_date() {
        return int_date;
    }

    public void setInt_date(Date int_date) {
        this.int_date = int_date;
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
        PostDto postDto = (PostDto) o;
        return post_id.equals(postDto.post_id) && bbs_id.equals(postDto.bbs_id) && user_id.equals(postDto.user_id) && post_title.equals(postDto.post_title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(post_id, bbs_id, user_id, post_title);
    }
}
