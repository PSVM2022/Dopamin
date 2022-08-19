package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.SearchCondition;

import java.util.List;

public interface ContentsService {

    List<ContentsDto> contentsList() ;

    ContentsDto contentsView(Integer cnts_id);

    List<ContentsDto> getSearchCntsPage(SearchCondition sc);

    int getSearchResultCnt(SearchCondition sc);

}