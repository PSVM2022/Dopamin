package com.PSVM.service;

import com.PSVM.dopamin.domain.BbsDto;

public interface BbsService {

    int insert(BbsDto dto) throws Exception;

    BbsDto select(Integer bbs_prior) throws Exception;

    int update(BbsDto dto) throws Exception;

    int deleteByManager(int bbs_prior) throws Exception;

    int deleteAllByManager() throws Exception;

    int countBbs() throws Exception;
}
