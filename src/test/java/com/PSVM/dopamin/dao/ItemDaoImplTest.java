package com.PSVM.dopamin.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemDaoImplTest {
    @Autowired
    ItemDaoImpl itemDaoImpl;

    @Test
    public void getCount() throws Exception {
        int rowcnt= itemDaoImpl.getCount();
        System.out.println(rowcnt);
    }
}