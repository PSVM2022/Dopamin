package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.ReviewDao;
import com.PSVM.dopamin.dao.ReviewDaoImpl;
import com.PSVM.dopamin.domain.ReviewDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewServiceImplTest extends TestCase {

    @Autowired
    private ReviewService reviewService;

    //한줄평 삭제 테스트
    @Test
    public void testDeleteRevw() {
        String user_id = "sohyeon9253";
        int revw_id=34;
        int cnts_id=26;

        try {
            int rowCnt = reviewService.deleteRevw(revw_id, cnts_id, user_id);
            if (rowCnt!=1)  //삭제되면 1 반환됨
                throw new Exception("삭제 실패");
            System.out.println("rowCnt = " + rowCnt);
        } catch (Exception e){
            e.printStackTrace();
            System.out.println("e.getMessage() = " + e.getMessage());
        }
    }

    //한줄평 등록 테스트
    @Test
    public void testInsertRevw() {

        ReviewDto reviewDto = new ReviewDto(34, "sohyeon9253", 26, "테스트영화보러가고싶다아아ㅏ아아", 1, 0, new Timestamp(System.currentTimeMillis()), "sohyeon9253", new Timestamp(System.currentTimeMillis()), "sohyeon9253");

        try {
            if(reviewService.insertRevw(reviewDto)!=1)
                throw new Exception("글쓰기 실패");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("e.getMessage() = " + e.getMessage());
        }
    }

    //한줄평 수정 테스트
    @Test
    public void testUpdateRevw()  throws Exception {
        ReviewDto reviewDto = new ReviewDto(35, "sohyeon9253", "test테스트영화보러가고싶다아아ㅏ아아", new Timestamp(System.currentTimeMillis()));

        try {
            if (reviewService.updateRevw(reviewDto)!=1)
                throw new Exception("수정 실패");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("e.getMessage() = " + e.getMessage());
        }
    }
}