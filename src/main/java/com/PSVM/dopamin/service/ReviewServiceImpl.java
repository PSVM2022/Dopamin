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

    @Override
    public int getRevwCount(Integer cnts_id) throws Exception {
        return reviewDao.countRevw(cnts_id);
    }

    @Override
    public int insertRevw(ReviewDto reviewDto) throws Exception{
        reviewDao.updateRevwCnt(reviewDto.getCnts_id(), 1);
        return reviewDao.insertRevw(reviewDto);
    }

    @Override
    public int updateRevw(ReviewDto reviewDto) throws Exception {
        return reviewDao.updateRevw(reviewDto);
    }

    @Override
    public int deleteRevw(Integer cnts_id, String user_id) throws Exception {
        return 0;
    }

    @Override
    public int deleteRevw(Integer revw_id, Integer cnts_id, String user_id) throws Exception {
        int rowCnt = reviewDao.updateRevwCnt(cnts_id, -1);
        rowCnt = reviewDao.deleteRevw(revw_id, cnts_id, user_id);
        return rowCnt;
    }
}
