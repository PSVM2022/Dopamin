package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao {

    @Autowired
    private SqlSession session;
    private static String namespace="com.PSVM.dopamin.dao.ReviewMapper.";

    @Override
    public List<ReviewDto> selectAllRevw(Integer cnts_id) {
        return session.selectList(namespace+"selectAllRevw", cnts_id);
    }

    @Override
    public int countRevw(Integer cnts_id) throws Exception {
        return session.selectOne(namespace+"countRevw", cnts_id);
    }

    @Override
    public int insertRevw(ReviewDto reviewDto) throws Exception {
        return session.insert(namespace+"insertRevw", reviewDto);
    }

    @Override
    public int updateRevw(ReviewDto reviewDto) throws Exception {
        return session.update(namespace+"updateRevw", reviewDto);
    }

    @Override
    public int deleteRevw(Integer revw_id,Integer cnts_id, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("cnts_id", cnts_id);
        map.put("user_id", user_id);
        map.put("revw_id",revw_id);
        return session.delete(namespace+"deleteRevw", map);
    }

    @Override
    public int updateRevwCnt(Integer cnts_id, int i) {
        return 0;
    }

}
