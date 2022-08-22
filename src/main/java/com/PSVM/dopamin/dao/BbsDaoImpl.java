package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.BbsDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDaoImpl<T, ID> implements BbsDao<T, ID> {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.PSVM.dopamin.dao.BbsMapper.";

    @Override
    public int save(BbsDto dto) throws SQLException {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public Optional<T> findById(ID bbsId) throws SQLException {
        return Optional.ofNullable(session.selectOne(namespace + "selectById", bbsId));
    }

    @Override
    public List<T> findAll() throws SQLException {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<T> findAllVisib() throws SQLException {
        return session.selectList(namespace + "selectAllVisib");
    }

    @Override
    public BbsDto findByPrefixName(String nm) throws SQLException {
        return session.selectOne(namespace + "selectByPrefixName", nm);
    }

    @Override
    public int count() throws SQLException {
        return session.selectOne(namespace + "count");
    }

    public int update(T bbs) throws SQLException {
        return session.update(namespace + "update", bbs);
    }
}
