package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.MyPageDao;
import com.PSVM.dopamin.domain.RevwDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPageServiceImple implements MyPageService {
    @Autowired
    MyPageDao myPageDao;

    @Override
    public List<RevwDto> revwList(String userId) throws Exception{
        return myPageDao.selectRevw(userId);
    }

    @Override
    public List<RevwDto> revwEvalList(String user_id) {
        return myPageDao.selectRevwEval(user_id);
    }


}
