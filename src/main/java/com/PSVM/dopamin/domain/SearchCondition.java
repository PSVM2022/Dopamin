package com.PSVM.dopamin.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {

    private Integer page = 1;
    private Integer pageSize = 3;   //한 페이지에 보여줄 컨텐츠 개수
    private String  keyword = "";
    //private Integer  offset = 0;
    private String  option = "";


    public SearchCondition() {
    }

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
    }

    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)       //페이지 지정해준 경우
                .queryParam("pageSize", pageSize)
                .queryParam("keyword", keyword)
                .queryParam("option",   option)
                .build().toString();
    }

    public String getQueryString() {
        return getQueryString(page);
    }

    //getter setter
    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public Integer getOffset() {
        return (page-1) * pageSize;
    }

    /*public void setOffset(Integer offset) {
        this.offset = offset;
    }*/


    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                ", offset=" + getOffset() +
                '}';
    }
}
