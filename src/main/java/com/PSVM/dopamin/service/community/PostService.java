package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.List;

public interface PostService {

    int write(PostDto post) throws SQLException;

    int getCountInBbs(Integer bbsId) throws Exception;

    List<PostDto> getAllList(Integer bbsId) throws Exception;

    List<PostDto> getPage(Integer bbsId, Integer page) throws Exception;

    PostDto read(Integer postId) throws Exception;

    int modify(PostDto post) throws SQLException;

    int remove(Integer postId, String writer) throws SQLException;

    String getBbsName(Integer bbsId) throws SQLException;

    String getBbsNameByPostId(Integer postId) throws SQLException;

    Integer getRecenltyPostedId(String userId) throws SQLException;
}
