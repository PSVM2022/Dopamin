package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserPwdDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void selectPwdTest() {
        UserPwdDto userPwdDto = userDao.selectPwd("eunbi1");
        assertEquals("eunbi1",userPwdDto.getUser_id());

    }
}