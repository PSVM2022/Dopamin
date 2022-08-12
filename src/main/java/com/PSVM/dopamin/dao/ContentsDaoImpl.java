package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ContentsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ContentsDaoImpl implements ContentsDao {
    @Autowired
    private SqlSession session;
    private static String namespace="com.PSVM.dopamin.dao.ContentsMapper.";


    @Override
    public List<ContentsDto> selectcnts() {
        return session.selectList(namespace+"selectcnts");
    }
}

/*public ContentsDto selectcnts(int cnts_id) throws Exception{
    return session.selectList(namespace+"selectcnts", cnts_id);
    }*/