package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.RevwDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MyPageDaoImplTest {
    @Autowired
    MyPageDao myPageDao;

    @Test
    public void selectRevwEval() throws Exception {
        List<RevwDto> list = myPageDao.selectRevwEval("eunbi77");
        String title = list.get(0).getCnts_title();
        System.out.println("title = " + title);
        assertTrue(list.size() == 3);
    }

    @Test
    public void cntsWishList() throws Exception {
        List<MyPageCntsDto> list = myPageDao.selectCntsWish("hohoma5");
        for (int i = 0; i < list.size(); i++) {
            String test = list.get(i).getCnts_postr_img();
            System.out.println("test = " + test);
        }
        assertTrue(list.size() == 2);
    }

}