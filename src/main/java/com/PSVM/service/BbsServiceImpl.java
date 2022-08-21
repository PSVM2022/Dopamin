package com.PSVM.service;

import com.PSVM.dopamin.dao.BbsDao;
import com.PSVM.dopamin.domain.BbsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsServiceImpl implements BbsService {

    @Autowired
    BbsDao bbsDao;

    @Override
    public int insert(BbsDto dto) throws Exception {
        return bbsDao.insert(dto);
    }

    @Override
    public BbsDto select(Integer bbs_prior) throws Exception {
        return bbsDao.select(bbs_prior);
    }

    @Override
    public int update(BbsDto dto) throws Exception {
        return bbsDao.update(dto);
    }

    @Override
    public int deleteByManager(int bbs_prior) throws Exception {
        return bbsDao.deleteByManager(bbs_prior);
    }

    @Override
    public int deleteAllByManager() throws Exception {
        return bbsDao.deleteAllByManager();

    }

    @Override
    public int countBbs() throws Exception {
        return bbsDao.count();
    }
}
