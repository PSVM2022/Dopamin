package com.PSVM.dopamin.domain;

import lombok.Data;

@Data
public class MyPageDto {
    private String mbti;
    private String user_id;
    private String prf_img; //프로필 이미지 url
    private String nic;     //닉네임
    private Integer dopa_exp;   //도파 exp
    private Integer dopa_point; //도파 포인트
    private String fav_genre1;    // 선호 장르 번호
    private String genre_nm;        //선호 장르 이름
    private String btdt;           //유저 생년월일
    private Integer age;        // 유저 나이
    private Integer sex;        // 유저 성별
    private String item_img;    // 착용중인 보유 스킨

}