package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.BbsDto;

public interface BbsDao {

    int insert(BbsDto dto) throws Exception;

    BbsDto select(Integer bbs_prior) throws Exception;

    int update(BbsDto dto) throws Exception;

    int deleteByManager(int bbs_id) throws Exception;

    int deleteAllByManager() throws Exception;

    int count() throws Exception;
}
