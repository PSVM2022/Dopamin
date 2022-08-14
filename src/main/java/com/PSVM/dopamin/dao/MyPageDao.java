package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPageDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;

import java.util.List;

public interface MyPageDao {
    List<RevwDto> selectRevw(String user_id) throws Exception;

    List<RevwDto> selectRevwEval(String user_id);

    List<MyPageCntsDto> selectCntsWish(String user_id);

    List<MyPageCntsDto> selectCntsView(String user_id);

    List<MyPagePostDto> selectPost(String user_id);

    MyPageDto selectMyInfo(String user_id);
}
