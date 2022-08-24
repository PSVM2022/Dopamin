package com.PSVM.dopamin.domain.Item;

import com.PSVM.dopamin.domain.SearchCondition;

public class ItemPageHandler {
    private int navi_size=5;
    private int total_count;
    private int page_size;
    private int total_page;
    private int page;//현재페이지
    private int begin_page;
    private int end_page;
    boolean show_prev;
    boolean show_next;

    public ItemPageHandler(int total_count,int page){
        this(total_count,page,8);
    }
    public ItemPageHandler(int total_count,int page,int page_size){
        this.total_count=total_count;
        this.page=page;
        this.page_size=page_size;
        total_page=(int)Math.ceil(total_count/(double)page_size);
        begin_page=page/navi_size*navi_size+1;
        end_page=Math.min(begin_page+navi_size-1,total_page);
        show_prev=begin_page!=1;
        show_next=end_page!=total_page;
    }
    public int getNavi_size() {
        return navi_size;
    }

    public void setNavi_size(int navi_size) {
        this.navi_size = navi_size;
    }

    public int getTotal_count() {
        return total_count;
    }

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }

    public int getPage_size() {
        return page_size;
    }

    public void setPage_size(int page_size) {
        this.page_size = page_size;
    }

    public int getTotal_page() {
        return total_page;
    }

    public void setTotal_page(int total_page) {
        this.total_page = total_page;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBegin_page() {
        return begin_page;
    }

    public void setBegin_page(int begin_page) {
        this.begin_page = begin_page;
    }

    public int getEnd_page() {
        return end_page;
    }

    public void setEnd_page(int end_page) {
        this.end_page = end_page;
    }

    public boolean isShow_prev() {
        return show_prev;
    }

    public void setShow_prev(boolean show_prev) {
        this.show_prev = show_prev;
    }

    public boolean isShow_next() {
        return show_next;
    }

    public void setShow_next(boolean show_next) {
        this.show_next = show_next;
    }
}
