package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPageDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;

import java.util.List;

public interface MyPageService {
    List<RevwDto> revwList(String user_id) throws Exception;

    List<RevwDto> revwEvalList(String user_id);

    List<MyPageCntsDto> cntsWishList(String user_id);

    List<MyPageCntsDto> cntsViewList(String user_id);

    List<MyPagePostDto> postList(String user_id);

    MyPageDto selectMyInfo(String user_id);
}
