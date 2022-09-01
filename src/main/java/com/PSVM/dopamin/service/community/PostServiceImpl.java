package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.dao.community.BbsDao;
import com.PSVM.dopamin.dao.community.PostDao;
import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Autowired
    private BbsDao bbsDao;

    @Override
    public int write(PostDto post) throws SQLException {
        return postDao.insert(post);
    }

    @Override
    public int getCountInBbs(Integer bbsId) throws Exception {
        return postDao.count(bbsId);
    }

    @Override
    public List<PostDto> getAllList(Integer bbsId) throws Exception {
        return postDao.selectAll(bbsId);
    }

    @Override
    public List<PostDto> getPage(Integer bbsId, Integer page) throws Exception {
        final Integer pageSize = 25;
        Integer offset = (page - 1) * pageSize;

        Map map = new HashMap<>();
        map.put("bbsId", bbsId);
        map.put("page", page);
        map.put("pageSize", pageSize);
        map.put("offset", offset);
        return postDao.selectPage(map);
    }

    @Override
    public PostDto read(Integer postId) throws Exception {
        postDao.increaseViewCnt(postId);
        return postDao.select(postId);
    }

    @Override
    public int modify(PostDto post) throws SQLException {
        return postDao.update(post);
    }

    @Override
    public int remove(Integer postId, String writer) throws SQLException {
        return postDao.delete(postId, writer);
    }

    @Override
    public String getBbsName(Integer bbsId) throws SQLException {
        return bbsDao.getName(bbsId);
    }

    @Override
    public String getBbsNameByPostId(Integer postId) throws SQLException {
        PostDto post = postDao.findById(postId);

        return bbsDao.getName(post.getBbs_id());
    }

    @Override
    public Integer getRecenltyPostedId(String userId) throws SQLException {
        return postDao.getRecentlyPostedId(userId);
    }
}
