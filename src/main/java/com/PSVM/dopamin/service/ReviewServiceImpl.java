package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.ContentsDao;
import com.PSVM.dopamin.dao.ReviewDao;
import com.PSVM.dopamin.domain.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDao reviewDao;

    @Autowired
    ContentsDao contentsDao;


    @Override
    public List<ReviewDto> getRevwList(Integer cnts_id) {
        return reviewDao.selectAllRevw(cnts_id);
    }

}
