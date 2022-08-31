package com.PSVM.dopamin.domain;

import lombok.Data;

@Data
public class MyPageItemsDto {
    private Integer item_id;
    private Integer list_id;    //아이템 리스트
    private String item_nm;     // 아이템 이름
    private String item_img;    //아이템 이미지
    private String user_id;     //유저 아이디
    private Integer equip_stat; //착용상태
}