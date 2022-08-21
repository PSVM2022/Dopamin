package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import java.util.List;

public interface ReviewDao {
    List<ReviewDto> selectAllRevw(Integer cnts_id);
}
