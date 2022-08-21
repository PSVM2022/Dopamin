package com.PSVM.dopamin.domain;

public class RevwDto {
    private Integer revw_id;     //한줄평 id
    private String user_id;      //user id
    private Integer cnts_id;     // 컨텐츠 id
    private String cnts_title;   // 컨텐츠 제목
    private String revw_body;    // 컨텐츠 내용
    private Integer revw_eval;  // 한줄평 평가
    private Integer revw_visib_stat; //한줄평 상태

    public RevwDto(){}
    public RevwDto(Integer revw_id, String user_id, Integer cnts_id, String cnts_title, String revw_body, Integer revw_eval, Integer revw_visib_stat) {
        this.revw_id = revw_id;
        this.user_id = user_id;
        this.cnts_id = cnts_id;
        this.cnts_title = cnts_title;
        this.revw_body = revw_body;
        this.revw_eval = revw_eval;
        this.revw_visib_stat = revw_visib_stat;
    }

    public Integer getRevw_id() {
        return revw_id;
    }

    public void setRevw_id(Integer revw_id) {
        this.revw_id = revw_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getCnts_id() {
        return cnts_id;
    }

    public void setCnts_id(Integer cnts_id) {
        this.cnts_id = cnts_id;
    }

    public String getCnts_title() {
        return cnts_title;
    }

    public void setCnts_title(String cnts_title) {
        this.cnts_title = cnts_title;
    }

    public String getRevw_body() {
        return revw_body;
    }

    public void setRevw_body(String revw_body) {
        this.revw_body = revw_body;
    }

    public Integer getRevw_eval() {
        return revw_eval;
    }

    public void setRevw_eval(Integer revw_eval) {
        this.revw_eval = revw_eval;
    }

    public Integer getRevw_visib_stat() {
        return revw_visib_stat;
    }

    public void setRevw_visib_stat(Integer revw_visib_stat) {
        this.revw_visib_stat = revw_visib_stat;
    }
}

