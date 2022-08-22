package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.BbsDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

// org.springframework.data.repository.CrudRepository 참고함
public interface BbsDao<T, ID> {

    int save(BbsDto dto) throws SQLException;

    Optional<T> findById(ID bbsId) throws SQLException;

    List<T> findAll() throws SQLException;

    List<T> findAllVisib() throws SQLException;

    BbsDto findByPrefixName(String nm) throws SQLException;

    int count() throws SQLException;

    int update(T bbs) throws SQLException;
}
