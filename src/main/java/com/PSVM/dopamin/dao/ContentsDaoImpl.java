package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ContentsDaoImpl implements ContentsDao {
    @Autowired
    private SqlSession session;
    private static String namespace="com.PSVM.dopamin.dao.ContentsMapper.";

    @Override
    public List<ContentsDto> selectAllCnts() {
        return session.selectList(namespace+"selectAllCnts");
    }

    @Override
    public List<ContentsUserDto> selectUserAllCnts(String user_id) {
        return session.selectList(namespace+"selectUserAllCnts", user_id);
    }

    @Override
    public ContentsUserDto selectUserId(String user_id) {
        return session.selectOne(namespace+"selectUserId", user_id);
    }

    public ContentsDto selectCnts(Integer cnts_id) {
        return session.selectOne(namespace + "selectCnts", cnts_id);
    }

    @Override
    public List<ContentsDto> searchSelectCnts(SearchCondition sc) {
        return session.selectList(namespace+"searchSelectCnts", sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) {
        return session.selectOne(namespace+"searchResultCnt", sc);
    }

    //컨텐츠 찜
    @Override
    public int insertWish(ContentsWishDto contentsWishDto) throws Exception {
        return session.insert(namespace+"insertWish", contentsWishDto);
    }

    @Override
    public int deleteWish(Integer cnts_id, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("cnts_id", cnts_id);
        map.put("user_id", user_id);
        return session.delete(namespace+"deleteWish", map);
    }

    @Override
    public void insertWish(Integer cnts_id, int i) {

    }

}
