package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import java.util.List;

public interface ReviewDao {
    List<ReviewDto> selectAllRevw(Integer cnts_id);
    int countRevw(Integer cnts_id) throws Exception;
    int insertRevw(ReviewDto reviewDto) throws Exception;
    int updateRevw(ReviewDto reviewDto) throws Exception;
    int deleteRevw(Integer revw_id, Integer cnts_id, String user_id) throws Exception;

    int updateRevwCnt(Integer cnts_id, int i);
}
