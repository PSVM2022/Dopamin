package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.RevwDto;

import java.util.List;

public interface MyPageService {
    List<RevwDto> revwList(String userId) throws Exception;

    List<RevwDto> revwEvalList(String user_id);
}
