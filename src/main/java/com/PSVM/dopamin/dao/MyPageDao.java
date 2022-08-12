package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.RevwDto;

import java.util.List;

public interface MyPageDao {
    List<RevwDto> selectRevw(String userId) throws Exception; // List<E> selectList(String statement)

}
