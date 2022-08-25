package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.MyPageDao;
import com.PSVM.dopamin.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class MyPageServiceImple implements MyPageService {
    @Autowired
    MyPageDao myPageDao;

    @Override
    public List<RevwDto> revwList(String user_id) throws Exception {
        return myPageDao.selectRevw(user_id);
    }

    @Override
    public List<RevwDto> revwRtList(String user_id) {
        return myPageDao.selectRevwRt(user_id);
    }

    @Override
    public List<MyPageCntsDto> cntsWishList(String user_id) {
        return myPageDao.selectCntsWish(user_id);
    }

    @Override
    public List<MyPageCntsDto> cntsViewList(String user_id) {
        return myPageDao.selectCntsView(user_id);
    }

    @Override
    public List<MyPagePostDto> postList(String user_id) {
        return myPageDao.selectPost(user_id);
    }

    @Override
    public MyPageDto selectMyInfo(String user_id) {
        MyPageDto myPageDto = myPageDao.selectMyInfo(user_id);
        try {
            String item_img = myPageDao.selectSkin(user_id);
            myPageDto.setItem_img(item_img);

            if (myPageDto.getGenre_nm() != null) {
                int genre_id = myPageDto.getFav_genre1();
                myPageDto.setGenre_nm(myPageDao.genreIdToNm(genre_id));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //유저의 생년월일 정보를 받아서 나이값 구하고 myPageDto에 넣어주기
        calAge(myPageDto);
        return myPageDto;
    }

    public void calAge(MyPageDto myPageDto) {
        int birthYear = Integer.parseInt(myPageDto.getBtdt().substring(0, 4));
        int curYear = LocalDate.now().getYear();
        int age = (int) (curYear - birthYear + 1) / 10 * 10;
        myPageDto.setAge(age);
    }

    @Override
    public List<MyPageItemsDto> profList(String user_id) {
        return myPageDao.selectProfItem(user_id);
    }

    @Override
    public List<MyPageItemsDto> skinList(String user_id) {
        return myPageDao.selectSkinItem(user_id);
    }

    @Override
    public List<MyPagePointDto> pntList(String user_id) {
        return myPageDao.selectPntList(user_id);
    }

    @Override
    public void modSkin(MyPageItemsDto myPageItemsDto) throws Exception {
        try {
            myPageDao.skinWearOff(myPageItemsDto);
            myPageDao.equipSkin(myPageItemsDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void defaultSkin(MyPageItemsDto myPageItemsDto){
        myPageDao.skinWearOff(myPageItemsDto);
    }

    @Override
    public void modProf(MyPageItemsDto myPageItemsDto) throws Exception {
        try {
            myPageDao.profWearOff(myPageItemsDto);
            myPageDao.equipProf(myPageItemsDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void defaultProf(MyPageItemsDto myPageItemsDto){
        myPageDao.profWearOff(myPageItemsDto);
    }


}
