package com.PSVM.dopamin.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.Date;
@Data
public class UserDto {

    private String user_id;
    private String user_pwd;
    private String f_nm;
    private String l_nm;
    private String phone_num;
    private String mbti;
    private String cnty;

    @Email
    private String email;

    private String nic;

    private String btdt;

    @NotNull
    private byte sex;
    private String prf_img;
    private Integer dopa_exp;
    private Integer dopa_point;
    private Integer user_stat;
    private String fav_genre1;
    private String fav_genre2;
    private String fav_genre3;
    private String fav_genre4;
    private String fav_genre5;
    private Integer rept_times;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

}

