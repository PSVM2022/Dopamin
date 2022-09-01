//package com.PSVM.dopamin.dao;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNotEquals;
//import static org.junit.Assert.assertNull;
//import static org.junit.Assert.assertTrue;
//
//import com.PSVM.dopamin.domain.BbsDto;
//import java.sql.Timestamp;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class BbsDaoImplTest {
//
//    @Autowired
//    BbsDao bbsDao;
//
//    @Test
//    public void t1_connectDb() {
//        assertNotEquals(bbsDao, null);
//    }
//
////    @Test
////    public void t2_insert() throws Exception {
////        bbsDao.deleteAllByManager();
////
////        String[] names = {"창무", "효은", "소현", "동훈", "은비"};
////        for (int i = 0; i < 5; ++i) {
////            BbsDto bbsDto = new BbsDto(names[i] + "의 게시판", i, new Timestamp(System.currentTimeMillis()), names[i], names[i]);
////            bbsDao.insert(bbsDto);
////        }
////        assertTrue(bbsDao.count() == names.length);
////    }
//
//    @Test
//    public void t3_select() throws Exception {
//        BbsDto target = bbsDao.select(0);
//        assertEquals(target.getBbs_nm(), "창무의 게시판");
//    }
//
//    @Test
//    public void t4_update() throws Exception {
//        BbsDto target = bbsDao.select(4);
//        String newTitle = "여기는 은비땅이다~ 게시판입니다";
//        target.setBbs_nm(newTitle);
//        bbsDao.update(target);
//
//        BbsDto nTarget = bbsDao.select(4);
//        assertEquals(nTarget.getBbs_nm(), newTitle);
//    }
//
//    @Test
//    public void t5_deleteByManager() throws Exception {
//        bbsDao.deleteByManager(4);
//        assertNull(bbsDao.select(4));
//
//        BbsDto bbsDto = new BbsDto("은비의 게시판", 4, new Timestamp(System.currentTimeMillis()), "은비", "은비");
//        bbsDao.insert(bbsDto);
//    }
//
//    @Test
//    public void t6_count() throws Exception {
//        assertTrue(bbsDao.count() > 0);
//    }
//}