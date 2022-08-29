package com.PSVM.dopamin.dao.community;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.PSVM.dopamin.domain.community.BbsDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BbsDaoImplTest {

    @Autowired
    BbsDao bbsDao;

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void checkDbStatus() {
        assertNotNull(bbsDao);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldSaveTempBbsWhenNoBbsParameter() throws SQLException {
        BbsDto bbs = new BbsDto();
        bbsDao.save(bbs);
        BbsDto target = (BbsDto) bbsDao.findAll().get(bbsDao.count() - 1);

        System.out.println(target);
        assertTrue(target.getBbsNm().startsWith("임시 판#"));
        assertEquals(target.getInUser(), "관리자");
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldSaveBbs() throws SQLException {
        BbsDto bbs = new BbsDto("은비까비", "창무");
        bbsDao.save(bbs);
        BbsDto target = (BbsDto) bbsDao.findAll().get(bbsDao.count() - 1);

        assertArrayEquals(
            new Object[]{
                target.getBbsNm(),
                target.getBbsPrior(),
                target.getUpUser(),
                target.getInUser()
            },
            new Object[]{
                "은비까비",
                0,
                "창무",
                "창무"
            }
        );
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldSaveAllBbsWhenBbsGiven() throws SQLException {
        int defaultLen = bbsDao.count();
        for (int i = 0; i < 10; ++i) {
            bbsDao.save(new BbsDto());
        }

        assertEquals(defaultLen + 10, bbsDao.count());
    }

    @Test
    public void shouldFindBbsById() throws SQLException {
        Optional<BbsDto> target = bbsDao.findById(10);
        if (target.isPresent()) {
            assertNotNull(target.get().getBbsId());
            return;
        }
        assertNull(target.get());
    }

    @Test
    public void shouldFindBbsByPrefixName() throws SQLException {
        BbsDto target = bbsDao.findByPrefixName("일일");
        assertEquals(target.getBbsNm(), "일일베스트");
    }

    @Test
    public void shouldFindAllVisibBbsAsList() throws SQLException {
        List list = bbsDao.findAllVisib();
        System.out.println(list);

        assertNotNull(list.get(0));
        assertEquals(bbsDao.count(), list.size());
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldUpdateBbsInfo() throws SQLException {
        BbsDto target = bbsDao.findByPrefixName("일일");
        int id = target.getBbsId();
        target.setBbsVisib(0);
        target.setBbsNm("test name");
        bbsDao.update(target);

        Optional<BbsDto> nBbs = bbsDao.findById(id);
        assertEquals(nBbs.get().getBbsNm(), "test name");
    }

    @Test
    public void getName() throws SQLException {
        int bbsId = 1;
        assertEquals(bbsDao.getName(1), "데일리 베스트");
    }
}