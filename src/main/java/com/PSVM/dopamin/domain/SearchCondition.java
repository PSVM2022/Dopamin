package com.PSVM.dopamin.domain;

public class SearchCondition {

    //검색조건
/*    private Integer page = 1;
    private Integer pageSize = 10;
    private Integer offset = 0;

 */
    private String keyword = "";

    public SearchCondition() {

    }
    public SearchCondition(String keyword) {
        /*this.page = page;
        this.pageSize = pageSize;

         */
        this.keyword = keyword;
    }

    /*
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

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
*/
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "keyword='" + keyword + '\'' +
                '}';
    }
}
