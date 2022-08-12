package com.PSVM.dopamin.dao;

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
    MyPageDaoImpl myPageDao;

    @Test
    public void selectRevw() throws Exception{
        List<RevwDto> list = myPageDao.selectRevw("eunbi77");

        System.out.println("list = " + list);
        assertTrue(list.size()==8);
    }
}