package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ReviewDto;

import java.util.List;

public interface ReviewService {
    List<ReviewDto> getRevwList(Integer cnts_id);
}
