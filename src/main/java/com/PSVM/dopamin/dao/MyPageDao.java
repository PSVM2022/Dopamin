package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.*;

import java.util.List;

public interface MyPageDao {
    List<RevwDto> selectRevw(String user_id) throws Exception;

    List<RevwDto> selectRevwRt(String user_id);

    List<MyPageCntsDto> selectCntsWish(String user_id);

    List<MyPageCntsDto> selectCntsView(String user_id);

    List<MyPagePostDto> selectPost(String user_id);

    MyPageDto selectMyInfo(String user_id);

    String selectSkin(String user_id) throws Exception;

    String genreIdToNm(int genre_id);

    List<MyPageItemsDto> selectSkinItem(String user_id);

    List<MyPageItemsDto> selectProfItem(String user_id);

    List<MyPagePointDto> selectPntList(String user_id);

    int equipSkin(MyPageItemsDto myPageItemsDto);

    int skinWearOff(MyPageItemsDto myPageItemsDto);

    int profWearOff(MyPageItemsDto myPageItemsDto);

    int equipProf(MyPageItemsDto myPageItemsDto);
}
