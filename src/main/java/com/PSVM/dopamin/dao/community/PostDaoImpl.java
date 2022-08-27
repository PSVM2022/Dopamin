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
    public PostDto findById(Integer post_id) throws SQLException {
        return session.selectOne(namespace + "selectPost", post_id);
    }

    @Override
    public PostDto findLatestOne(Integer bbs_id) throws SQLException {
        return session.selectOne(namespace + "selectLatestOne", bbs_id);
    }

    @Override
    public int count(Integer bbs_id) throws SQLException {
        return 0;
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
        return null;
    }

    @Override
    public int update(PostDto post) throws SQLException {
        return 0;
    }

    @Override
    public int hidePost(Map map) throws SQLException {
        return 0;
    }

    @Override
    public int increaseViewCnt(Integer post_id) throws SQLException {
        return 0;
    }

    @Override
    public int increaseCommentCnt(Integer post_id) throws SQLException {
        return 0;
    }

    @Override
    public int decreaseCommentCnt(Integer post_id) throws SQLException {
        return 0;
    }

    @Override
    public int adjustPostPrior(Integer post_id, int prior) throws SQLException {
        return 0;
    }

    @Override
    public int deleteAll(Integer bbs_id) throws SQLException {
        return 0;
    }
}
