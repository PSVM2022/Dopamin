package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.MyPageDao;
import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPageDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;
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
        System.out.println("service 도착");
        MyPageDto myPageDto = myPageDao.selectMyInfo(user_id);
        System.out.println("selectMyInfo dao 성공");
        myPageDto = myPageDao.selectSkin(user_id);
        System.out.println("myPageDto = " + myPageDto);
        System.out.println("myPageDto.gets = " + myPageDto.getItem_img());

        System.out.println("myPageDto.getBtdt() = " + myPageDto.getBtdt());
        //유저의 생년월일 정보를 받아서 나이값 구하고 myPageDto에 넣어주기
        calAge(myPageDto);
        //myPageDto에 착용 스킨
        return myPageDto;
    }

    public void calAge(MyPageDto myPageDto) {
        int birthYear = Integer.parseInt(myPageDto.getBtdt().substring(0, 4));
        int curYear = LocalDate.now().getYear();
        int age = (int) (curYear - birthYear + 1) / 10 * 10;
        myPageDto.setAge(age);
    }


}
