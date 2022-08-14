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
    public List<RevwDto> revwEvalList(String user_id) {
        return myPageDao.selectRevwEval(user_id);
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

        //유저의 생년월일 정보를 받아서 나이값 구하고 myPageDto에 넣어주기
        int birthYear = myPageDto.getBtdt().getYear() + 1900;
        int curYear = LocalDate.now().getYear();
        int age = (int) (curYear - birthYear + 1) / 10 * 10;
        myPageDto.setAge(age);

        return myPageDto;
    }

}
