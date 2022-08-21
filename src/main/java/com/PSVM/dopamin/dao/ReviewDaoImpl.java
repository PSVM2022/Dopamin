package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDaoImpl implements ReviewDao {

    @Autowired
    private SqlSession session;
    private static String namespace="com.PSVM.dopamin.dao.ReviewMapper.";

    @Override
    public List<ReviewDto> selectAllRevw(Integer cnts_id) {
        return session.selectList(namespace+"selectAllRevw", cnts_id);
    }

}
