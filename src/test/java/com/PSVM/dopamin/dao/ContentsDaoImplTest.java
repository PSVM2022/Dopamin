package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ContentsDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//@WebAppConfiguration
public class ContentsDaoImplTest {

    @Autowired
    ContentsDao contentsDao;

    @Test
    public void selectcnts() throws Exception {
        List<ContentsDto> list = contentsDao.selectcnts();
        //assertTrue(contentsDao != null);
        System.out.println("contentsDao = " + list);
    }
}