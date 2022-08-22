package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.CntsEvalDto;
import com.PSVM.dopamin.domain.ContentsDto;
import com.PSVM.dopamin.domain.SearchCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//@WebAppConfiguration
public class ContentsDaoImplTest {

    @Autowired
    ContentsDao contentsDao;

    //데이터 접근 테스트(stat=0에 접근하려는 경우 수정중.....)
    @Test
    public void selectcnts() throws Exception {
        List<ContentsDto> list = contentsDao.selectAllCnts();
        assertTrue(contentsDao != null);
        System.out.println("contentsDao = " + list);
    }

    //컨텐츠 평가 테스트


}