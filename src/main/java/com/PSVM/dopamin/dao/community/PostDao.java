package com.PSVM.dopamin.dao.community;

import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface PostDao {

    int insert(PostDto post) throws SQLException;

    PostDto findById(Integer postId) throws SQLException;

    PostDto findLatestOne(Integer bbsId) throws SQLException;

    int count(Integer bbsId) throws SQLException;

    List<PostDto> previewPost(Integer bbsId, Integer size) throws SQLException;

    List<PostDto> selectPage(Map map) throws SQLException;

    List<PostDto> selectAll(Integer bbsId) throws SQLException;

    PostDto select(Integer postId) throws SQLException;

    int update(PostDto post) throws SQLException;

    int hidePost(Map map) throws SQLException;

    int increaseViewCnt(Integer postId) throws SQLException;

    int increaseCommentCnt(Integer postId) throws SQLException;

    int decreaseCommentCnt(Integer postId) throws SQLException;

    int adjustPostPrior(Integer postId, int prior) throws SQLException;

    int deleteAll(Integer bbsId) throws SQLException;

    int delete(Integer postId, String writer) throws SQLException;
}
