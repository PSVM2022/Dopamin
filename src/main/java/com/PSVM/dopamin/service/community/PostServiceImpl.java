package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.dao.community.BbsDao;
import com.PSVM.dopamin.dao.community.PostDao;
import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
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
    public List<PostDto> getPage(Map<String, Integer> map) throws Exception {
        final Integer pageSize = 25;
        Integer offset = (map.get("page") - 1) * pageSize;

        map.put("pageSize", pageSize);
        map.put("offset", offset);
        return postDao.selectPage(map);
    }

    @Override
    public int modify(PostDto post) throws SQLException {
        return postDao.update(post);
    }

    @Override
    public int remove(PostDto post) throws SQLException{
        return postDao.delete(post.getPost_id(), post.getUser_id());
    }

    @Override
    public String getBbsName(Integer bbsId) throws SQLException {
        return bbsDao.getName(bbsId);
    }
}
