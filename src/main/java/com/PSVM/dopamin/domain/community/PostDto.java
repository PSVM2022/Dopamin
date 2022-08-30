package com.PSVM.dopamin.domain.community;

import java.sql.Timestamp;
import java.util.Objects;

public class PostDto {

    private Integer post_id; // AI
    private Integer bbs_id; // FK
    private String user_id; // FK
    private String post_title;
    private String post_body;
    private int post_reply_cnt; // N 0
    private int post_view_cnt; // N 0
    private int post_visib; // N 1
    private int post_prior; // N 1
    private String post_atch1; // N
    private String post_atch2; // N
    private String post_atch3; // N
    private String post_atch4; // N
    private String post_atch5; // N
    private Integer post_rept_cnt; // N 0
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date; // N now()
    private String up_user;

    public PostDto(
        Integer bbs_id,
        String user_id,
        String post_title,
        String post_body,
        Timestamp in_date
    ) {
        this.bbs_id = bbs_id;
        this.user_id = user_id;
        this.post_title = post_title;
        this.post_body = post_body;
        this.in_date = in_date;
        this.in_user = this.up_user = user_id;
    }

    public PostDto(Integer bbs_id, String user_id, String post_title, String post_body) {
        this(bbs_id, user_id, post_title, post_body, new Timestamp(System.currentTimeMillis()));
    }


    public PostDto(Integer bbs_id, String user_id) {
        this(bbs_id, user_id, "changmoo1234", "changmoo12345555555555");
    }

    public PostDto() {
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

    public int getPost_reply_cnt() {
        return post_reply_cnt;
    }

    public void setPost_reply_cnt(Integer post_reply_cnt) {
        this.post_reply_cnt = post_reply_cnt;
    }

    public int getPost_view_cnt() {
        return post_view_cnt;
    }

    public void setPost_view_cnt(Integer post_view_cnt) {
        this.post_view_cnt = post_view_cnt;
    }

    public int getPost_visib() {
        return post_visib;
    }

    public void setPost_visib(int post_visib) {
        this.post_visib = post_visib;
    }

    public int getPost_prior() {
        return post_prior;
    }

    public void setPost_prior(Integer post_prior) {
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

    public Timestamp getIn_date() {
        return in_date;
    }

    public void setIn_date(Timestamp in_date) {
        this.in_date = in_date;
    }

    public String getIn_user() {
        return in_user;
    }

    public void setIn_user(String in_user) {
        this.in_user = in_user;
    }

    public Timestamp getUp_date() {
        return up_date;
    }

    public void setUp_date(Timestamp up_date) {
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
        return bbs_id.equals(postDto.bbs_id) && user_id.equals(postDto.user_id)
            && post_title.equals(
            postDto.post_title) && post_body.equals(postDto.post_body);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bbs_id, user_id, post_title, post_body);
    }

    @Override
    public String toString() {
        return "PostDto{" +
            "post_id=" + post_id +
            ", bbs_id=" + bbs_id +
            ", user_id='" + user_id + '\'' +
            ", post_title='" + post_title + '\'' +
            ", post_body='" + post_body + '\'' +
            ", post_reply_cnt=" + post_reply_cnt +
            ", post_view_cnt=" + post_view_cnt +
            ", post_visib=" + post_visib +
            ", post_prior=" + post_prior +
            ", post_atch1='" + post_atch1 + '\'' +
            ", post_atch2='" + post_atch2 + '\'' +
            ", post_atch3='" + post_atch3 + '\'' +
            ", post_atch4='" + post_atch4 + '\'' +
            ", post_atch5='" + post_atch5 + '\'' +
            ", post_rept_cnt=" + post_rept_cnt +
            ", in_date=" + in_date +
            ", in_user='" + in_user + '\'' +
            ", up_date=" + up_date +
            ", up_user='" + up_user + '\'' +
            '}';
    }
}
