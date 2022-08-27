package com.PSVM.dopamin.dao.community;

import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface PostDao {

    int insert(PostDto post) throws SQLException;

    PostDto findById(Integer post_id) throws SQLException;

    PostDto findLatestOne(Integer bbs_id) throws SQLException;

    int count(Integer bbs_id) throws SQLException;

    List<PostDto> previewPost(Integer bbsId, Integer size) throws SQLException;

    List<PostDto> selectPage(Map map) throws SQLException;

    int update(PostDto post) throws SQLException;

    int hidePost(Map map) throws SQLException;

    int increaseViewCnt(Integer post_id) throws SQLException;

    int increaseCommentCnt(Integer post_id) throws SQLException;

    int decreaseCommentCnt(Integer post_id) throws SQLException;

    int adjustPostPrior(Integer post_id, int prior) throws SQLException;

    int deleteAll(Integer bbs_id) throws SQLException;
}
