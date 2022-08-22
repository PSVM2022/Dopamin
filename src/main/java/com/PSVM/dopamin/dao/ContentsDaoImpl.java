package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.CntsEvalDto;
import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.SearchCondition;
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

}
