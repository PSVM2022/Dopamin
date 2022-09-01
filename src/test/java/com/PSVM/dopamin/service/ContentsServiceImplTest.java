package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ContentsWishDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ContentsServiceImplTest extends TestCase {

    @Autowired
    private ContentsService contentsService;

    //컨텐츠 찜 중복 테스트
    @Test
    public void testInsertDeleteWish() throws Exception {
        ContentsWishDto contentsWishDto = new ContentsWishDto(1, "user5", new Timestamp(System.currentTimeMillis()), "user5", new Timestamp(System.currentTimeMillis()), "user5");
        try {
            int inserttest = contentsService.insertWish(contentsWishDto);
            System.out.println("컨텐츠 찜 했다!");

        } catch (DuplicateKeyException e) {
            int deletetest = contentsService.deleteWish(contentsWishDto.getCnts_id(), contentsWishDto.getUser_id());
            System.out.println("컨텐츠 찜 취소했다!");
            //System.out.println("e.getMessage() = " + e.getMessage());
        }

    }


}