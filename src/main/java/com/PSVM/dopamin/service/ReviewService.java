package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ReviewDto;

import java.util.List;

public interface ReviewService {
    List<ReviewDto> getRevwList(Integer cnts_id);
    int getRevwCount(Integer cnts_id) throws Exception;
    int insertRevw(ReviewDto reviewDto) throws Exception;
    int updateRevw(ReviewDto reviewDto) throws Exception;
    int deleteRevw(Integer cnts_id, String user_id) throws Exception;

    int deleteRevw(Integer revw_id, Integer cnts_id, String user_id) throws Exception;
}
