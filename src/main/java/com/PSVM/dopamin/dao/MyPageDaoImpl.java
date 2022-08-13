package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyPageDaoImpl implements MyPageDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.PSVM.dopamin.dao.MyPageMapper.";

    @Override
    public List<RevwDto> selectRevw(String userId) throws Exception {
        return session.selectList(namespace + "selectrevw", userId);
    }

    @Override
    public List<RevwDto> selectRevwEval(String user_id) {
        return session.selectList(namespace + "selectrevwEval", user_id);
    }

    @Override
    public List<MyPageCntsDto> selectCntsWish(String user_id) {
        return session.selectList(namespace + "selectCntsWish", user_id);
    }

    @Override
    public List<MyPageCntsDto> selectCntsView(String user_id) {
        return session.selectList(namespace + "selectCntsView", user_id);
    }

    @Override
    public List<MyPagePostDto> selectPost(String user_id) {
        return session.selectList(namespace = "selectPost", user_id);
    }
}
