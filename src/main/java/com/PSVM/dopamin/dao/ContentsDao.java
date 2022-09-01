package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.CntsEvalDto;
import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.ContentsWishDto;
import com.PSVM.dopamin.domain.SearchCondition;

import java.util.List;

public interface ContentsDao {
    List<ContentsDto> selectAllCnts();

    ContentsDto selectCnts(Integer cnts_id);

    List<ContentsDto> searchSelectCnts(SearchCondition sc);

    int searchResultCnt(SearchCondition sc);

    /*
    //컨텐츠 평가
    CntsEvalDto evalCheck(Integer cnts_id, String user_id);*/

    //컨텐츠 찜
    int insertWish(ContentsWishDto contentsWishDto) throws Exception;

    int deleteWish(Integer cnts_id, String user_id) throws Exception;

    void insertWish(Integer cnts_id, int i);
}
