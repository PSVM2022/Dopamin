package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewDaoImplTest {

    @Autowired
    ReviewDao reviewDao;

    //조회 테스트
    @Test
    public void selectAllRevw() throws Exception {
        List<ReviewDto> reviewDtoList = reviewDao.selectAllRevw(7);

        if (reviewDtoList.isEmpty()) {
            System.out.println("컨텐츠에 한줄평 데이터 없음");
        }
        System.out.println("한줄평(컨텐츠 리뷰): " + reviewDtoList);
    }

    //작성 테스트
    @Test
    public void insertRevw() throws Exception {
        ReviewDto reviewDto = new ReviewDto("tqtq", 30, "제발요", "tqtq", "tqtq");

        int rowCnt = reviewDao.insertRevw(reviewDto);

        assertEquals(1, rowCnt);
    }

    //수정테스트
    @Test
    public void updateRevw() throws Exception{
        ReviewDto reviewDto = new ReviewDto(36, "tqtq", "수정테스트입니다~~!제에발");

        int rowCnt = reviewDao.updateRevw(reviewDto);
        assertEquals(1, rowCnt);
    }

    //삭제 테스트
    /*
    @Test
    public void deleteRevw() {
        ReviewDto reviewDto = new ReviewDto(36, "tqtq");
        int rowCnt = reviewDao.deleteRevw(reviewDto);
        assertEquals(1, rowCnt);
    }*/

}