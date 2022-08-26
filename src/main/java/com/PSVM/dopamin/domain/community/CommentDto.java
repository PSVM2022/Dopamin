package com.PSVM.dopamin.domain.community;

import java.sql.Timestamp;
import java.util.Objects;

public class CommentDto {

    private Integer comt_id;
    private Integer post_id;
    private String user_id;
    private String comt_body;
    private Integer comt_p;
    private Integer comt_visibility;
    private Integer comt_rept_times;
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date;
    private String up_user;

    public CommentDto() {
    }

    public Integer getComt_id() {
        return comt_id;
    }

    public void setComt_id(Integer comt_id) {
        this.comt_id = comt_id;
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getComt_body() {
        return comt_body;
    }

    public void setComt_body(String comt_body) {
        this.comt_body = comt_body;
    }

    public Integer getComt_p() {
        return comt_p;
    }

    public void setComt_p(Integer comt_p) {
        this.comt_p = comt_p;
    }

    public Integer getComt_visibility() {
        return comt_visibility;
    }

    public void setComt_visibility(Integer comt_visibility) {
        this.comt_visibility = comt_visibility;
    }

    public Integer getComt_rept_times() {
        return comt_rept_times;
    }

    public void setComt_rept_times(Integer comt_rept_times) {
        this.comt_rept_times = comt_rept_times;
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
        CommentDto that = (CommentDto) o;
        return comt_id.equals(that.comt_id) && post_id.equals(that.post_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(comt_id, post_id);
    }

    @Override
    public String toString() {
        return "CommentDto{" +
            "comt_id=" + comt_id +
            ", post_id=" + post_id +
            ", user_id='" + user_id + '\'' +
            ", comt_body='" + comt_body + '\'' +
            ", comt_p=" + comt_p +
            ", comt_visibility=" + comt_visibility +
            ", comt_rept_times=" + comt_rept_times +
            ", in_date=" + in_date +
            ", in_user='" + in_user + '\'' +
            ", up_date=" + up_date +
            ", up_user='" + up_user + '\'' +
            '}';
    }
}
