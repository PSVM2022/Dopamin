package com.PSVM.dopamin.dao.community;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.PSVM.dopamin.dao.UserDao;
import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.domain.community.PostDto;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PostDaoImplTest {

    static UserDto dummyUser;
    @Autowired
    PostDao postDao;
    @Autowired
    BbsDao bbsDao;
    @Autowired
    UserDao userDao;

    @BeforeClass
    public static void beforeClass() {
        dummyUser = new UserDto(
            "mcm", "1234", "m", "cm", "01012341234",
            "seoul", "asdf@asdf.com", "문땅무", "19991231", (byte) 0);
    }

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void checkDbStatus() {
        assertNotNull(postDao);
        assertNotNull(bbsDao);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldSaveTempPost() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        userDao.insertUser(dummyUser);
        PostDto post = new PostDto(today_bbs_id, dummyUser.getUser_id());
        postDao.insert(post);

        assertEquals(postDao.findLatestOne(today_bbs_id), post);
    }

    @Test
    public void shouldFindPostWhenPostIdGiven() throws SQLException {
        Integer bbs_id = bbsDao.findByPrefixName("일일").getBbsId();

    }

    @Test
    @Transactional
    @Rollback(true)
    public void shoundReturnPostCntWhenBbsIdGiven() throws SQLException {
        Integer bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        postDao.deleteAll(bbs_id);
        UserDto user = new UserDto();
        user.setUser_id("changmoo");
        userDao.insertUser(user);

        postDao.insert(new PostDto(bbs_id, user.getUser_id()));
        int cnt = postDao.count(bbs_id);
        assertNotEquals(cnt, 0);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldReturnPreviewPost() throws SQLException {
        final int previewSize = 8;

        Map map = new HashMap();
        Integer today_bbs_id = bbsDao.findByPrefixName("데일리").getBbsId();
        map.put("bbs_id", today_bbs_id);
        map.put("view_size", previewSize);

        List<PostDto> previewList = postDao.previewPost(today_bbs_id, previewSize);
        assertEquals(previewList.size(), previewSize);
    }

    @Test
    public void selectPage() throws SQLException {
        Map map = new HashMap();
        map.put("bbsId", 1);
        map.put("offset", 0);
        map.put("pageSize", 5);

        List<PostDto> list = postDao.selectPage(map);
        assertEquals(list.size(), 5);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldUpdatePost() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto target = postDao.findLatestOne(today_bbs_id);
        target.setPost_title("수정했어요!");
        postDao.update(target);

        PostDto nTarget = postDao.findById(target.getPost_id());
        assertEquals(nTarget.getPost_title(), "수정했어요!");
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldHidePost() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto beforePost = postDao.findLatestOne(today_bbs_id);
        Map map = new HashMap();
        map.put("post_visib", 0);
        map.put("post_id", beforePost.getPost_id());

        postDao.hidePost(map);
        PostDto afterPost = postDao.findById(beforePost.getPost_id());
        assertEquals(afterPost.getPost_visib(), 0);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void increaseViewCnt() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto beforePost = postDao.findLatestOne(today_bbs_id);

        postDao.increaseViewCnt(beforePost.getPost_id());
        PostDto afterPost = postDao.findById(beforePost.getPost_id());
        assertEquals(afterPost.getPost_view_cnt(), beforePost.getPost_view_cnt() + 1);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void increaseCommentCnt() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto beforePost = postDao.findLatestOne(today_bbs_id);

        postDao.increaseCommentCnt(beforePost.getPost_id());
        PostDto afterPost = postDao.findById(beforePost.getPost_id());
        assertEquals(beforePost.getPost_reply_cnt(), afterPost.getPost_reply_cnt() + 1);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void decreaseCommentCnt() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto beforePost = postDao.findLatestOne(today_bbs_id);

        postDao.decreaseCommentCnt(beforePost.getPost_id());
        PostDto afterPost = postDao.findById(beforePost.getPost_id());
        assertEquals(beforePost.getPost_reply_cnt(), afterPost.getPost_reply_cnt() - 1);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void adjustPostPrior() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        PostDto beforePost = postDao.findLatestOne(today_bbs_id);

        postDao.adjustPostPrior(beforePost.getPost_id(), 0);
        PostDto afterPost = postDao.findById(beforePost.getPost_id());
        assertEquals(afterPost.getPost_prior(), 0);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldRemoveBbsPostWhenBbsIdGiven() throws SQLException {
        Integer today_bbs_id = bbsDao.findByPrefixName("일일").getBbsId();
        postDao.deleteAll(today_bbs_id);
        assertEquals(postDao.count(today_bbs_id), 0);
    }

    @Test
    public void select() throws SQLException {
        Integer post_id = 264;
        PostDto post = postDao.select(post_id);
        assertEquals(post.getPost_id(), post_id);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void delete() throws SQLException {
        Integer postId = 263;
        String writer = "user1";
        postDao.delete(postId, writer);

        assertNull(postDao.select(postId));
    }

    @Test
    public void getRecentlyPostedId() {
        String userId = "user1";
        assertEquals(267, postDao.getRecentlyPostedId(userId));
    }
}