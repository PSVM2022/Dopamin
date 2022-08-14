package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.BbsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDaoImpl implements BbsDao {

    private static String namespace = "com.PSVM.dopamin.dao.BbsMapper.";
    @Autowired
    private SqlSession session;

    @Override
    public int insert(BbsDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public BbsDto select(Integer bbs_prior) throws Exception {
        return session.selectOne(namespace + "select", bbs_prior);
    }

    @Override
    public int update(BbsDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }


    @Override
    public int deleteByManager(BbsDto dto) throws Exception {
        return session.delete(namespace + "deleteByManager", dto);
    }

    @Override
    public int deleteAllByManager() throws Exception {
        return session.delete(namespace + "deleteAllByManager");
    }


    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
}
