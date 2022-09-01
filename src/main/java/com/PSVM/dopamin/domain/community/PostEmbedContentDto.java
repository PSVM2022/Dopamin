package com.PSVM.dopamin.domain.community;

import java.sql.Timestamp;
import java.util.Objects;

public class PostEmbedContentDto {

    private Integer post_id;
    private Integer cnts_id;
    private Timestamp in_date;
    private String in_user;
    private Timestamp up_date;
    private String up_user;

    public PostEmbedContentDto() {
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public Integer getCnts_id() {
        return cnts_id;
    }

    public void setCnts_id(Integer cnts_id) {
        this.cnts_id = cnts_id;
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
        PostEmbedContentDto that = (PostEmbedContentDto) o;
        return post_id.equals(that.post_id) && cnts_id.equals(that.cnts_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(post_id, cnts_id);
    }

    @Override
    public String toString() {
        return "PostEmbedContentDto{" +
            "post_id=" + post_id +
            ", cnts_id=" + cnts_id +
            ", in_date=" + in_date +
            ", in_user='" + in_user + '\'' +
            ", up_date=" + up_date +
            ", up_user='" + up_user + '\'' +
            '}';
    }
}
