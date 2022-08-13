package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ContentsDto;

import java.util.List;

public interface ContentsDao {
    List<ContentsDto> selectAllCnts();

    ContentsDto selectCnts(Integer cnts_id);
}
