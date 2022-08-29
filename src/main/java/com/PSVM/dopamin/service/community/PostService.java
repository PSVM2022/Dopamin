package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface PostService {

    int write(PostDto post) throws SQLException;

    int getCountInBbs(Integer bbsId) throws Exception;

    List<PostDto> getAllList(Integer bbsId) throws Exception;

    List<PostDto> getPage(Map<String, Integer> map) throws Exception;

    int modify(PostDto post) throws SQLException;

    int remove(PostDto post) throws SQLException;

    String getBbsName(Integer bbsId) throws SQLException;
}
