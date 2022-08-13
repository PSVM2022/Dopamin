package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.ContentsDao;
import com.PSVM.dopamin.domain.ContentsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentsServiceImpl implements ContentsService {

    @Autowired
    ContentsDao contentsDao;

    //컨텐츠 전체 읽어오기
    @Override
    public List<ContentsDto> contentsList() {
        return contentsDao.selectAllCnts();
    }

    //컨텐츠 상세 페이지 읽어오기
    public ContentsDto contentsView(Integer cnts_id) {
        ContentsDto contentsDto = contentsDao.selectCnts(cnts_id);
        return contentsDao.selectCnts(cnts_id);
    }

}
