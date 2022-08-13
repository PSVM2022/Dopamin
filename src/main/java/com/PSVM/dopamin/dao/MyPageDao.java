package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.RevwDto;

import java.util.List;

public interface MyPageDao {
    List<RevwDto> selectRevw(String userId) throws Exception;

    List<RevwDto> selectRevwEval(String user_id);

    List<MyPageCntsDto> selectCntsWish(String user_id);
}
