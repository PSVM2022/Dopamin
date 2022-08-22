package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPageDto;
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
    public List<RevwDto> selectRevw(String user_id) throws Exception {
        return session.selectList(namespace + "selectrevw", user_id);
    }

    @Override
    public List<RevwDto> selectRevwRt(String user_id) {
        return session.selectList(namespace + "selectrevwRt", user_id);
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
        return session.selectList(namespace + "selectPost", user_id);
    }

    @Override
    public MyPageDto selectMyInfo(String user_id) {
        return session.selectOne(namespace + "selectUserInfo", user_id);
    }

    @Override
    public String selectSkin(String user_id) {
        return session.selectOne(namespace + "selectSkin", user_id);
    }

    @Override
    public String genreIdToNm(int genre_id) {
        return session.selectOne(namespace + "genreIdToNm", genre_id);
    }

}
