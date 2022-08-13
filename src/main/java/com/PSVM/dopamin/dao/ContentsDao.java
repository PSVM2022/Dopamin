package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.SearchCondition;

import java.util.List;

public interface ContentsDao {
    List<ContentsDto> selectAllCnts();

    ContentsDto selectCnts(Integer cnts_id);

    List<ContentsDto> searchSelectCnts(SearchCondition sc);

}
