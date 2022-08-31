package com.PSVM.dopamin.dao.community;

import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDaoImpl implements PostDao {

    private static String namespace = "com.PSVM.dopamin.dao.community.postMapper.";
    @Autowired
    private SqlSession session;

    @Override
    public int insert(PostDto post) throws SQLException {
        return session.insert(namespace + "insert", post);
    }

    @Override
    public PostDto findById(Integer postId) throws SQLException {
        return session.selectOne(namespace + "selectPost", postId);
    }

    @Override
    public PostDto findLatestOne(Integer bbsId) throws SQLException {
        return session.selectOne(namespace + "selectLatestOne", bbsId);
    }

    @Override
    public int count(Integer bbsId) throws SQLException {
        return session.selectOne(namespace + "countPostInBbs", bbsId);
    }

    @Override
    public List<PostDto> previewPost(Integer bbsId, Integer size) throws SQLException {
        Map<String, Integer> map = new HashMap();
        map.put("bbs_id", bbsId);
        map.put("view_size", size);
        return session.selectList(namespace + "previewPostInBbs", map);
    }

    @Override
    public List<PostDto> selectPage(Map map) throws SQLException {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public List<PostDto> selectAll(Integer bbsId) throws SQLException {
        return session.selectList(namespace + "selectAll", bbsId);
    }

    @Override
    public PostDto select(Integer postId) throws SQLException {
        return session.selectOne(namespace + "select", postId);
    }


    @Override
    public int update(PostDto post) throws SQLException {
        return session.update(namespace + "update", post);
    }

    @Override
    public int hidePost(Map map) throws SQLException {
        return 0;
    }

    @Override
    public int increaseViewCnt(Integer postId) throws SQLException {
        return session.update(namespace + "increase1View", postId);
    }

    @Override
    public int increaseCommentCnt(Integer postId) throws SQLException {
        return 0;
    }

    @Override
    public int decreaseCommentCnt(Integer postId) throws SQLException {
        return 0;
    }

    @Override
    public int adjustPostPrior(Integer postId, int prior) throws SQLException {
        return 0;
    }

    @Override
    public int deleteAll(Integer bbsId) throws SQLException {
        return 0;
    }

    @Override
    public int delete(Integer postId, String writer) throws SQLException {
        Map map = new HashMap();
        map.put("postId", postId);
        map.put("writer", writer);
        return session.delete(namespace + "deletePostInBbs", map);
    }

    @Override
    public int getRecentlyPostedId(String userId) {
        return session.selectOne(namespace + "recentlyPostedId", userId);
    }
}
