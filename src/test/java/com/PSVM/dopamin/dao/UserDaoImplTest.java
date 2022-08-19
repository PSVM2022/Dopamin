package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.security.spec.ECField;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;


    @Before
    @Transactional
    public void setUp(){
        userDao.deleteUser("testid");
    }
    @After
    @Transactional
    public void reset(){
        userDao.deleteUser("testid");
    }

    @Test
    @Transactional
    public void testInsertUser() {
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);

        //when
        int rowCnt = userDao.insertUser(userDto);
        //then
        assertEquals(1,rowCnt);
    }

    @Test(expected = DuplicateKeyException.class)
    @Transactional
    public void testInsertUserWhenDuplicateUserId() {
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //when
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUser(userDto);
        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
    }



    @Test
    @Transactional
    public void testInsertUserPwd() throws Exception {
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //when
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        //then
        assertEquals(1,rowCnt1);
        assertEquals(1, rowCnt2);
    }

    @Test(expected = DuplicateKeyException.class)
    @Transactional
    public void testInsertUserPwdWhenDuplicateUserId(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //when
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        int rowCnt3 = userDao.insertUserPwd(userDto);
        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
        assertEquals(1,rowCnt3);


    }

    @Test
    @Transactional
    public void testSelectUser(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);

        //when
        int rowCnt = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);

        UserDto userDto1 = userDao.selectUser(userDto.getUser_id());
        //then
        assertEquals(1,rowCnt);
        assertEquals(1,rowCnt2);
        assertEquals(userDto1.getUser_id(),userDto.getUser_id());
    }

    @Test
    @Transactional
    public void testSelectIdDuplCnt(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);

        //when
        int cnt = userDao.selectIdDuplCnt(userDto.getUser_id());
        int cnt2 = userDao.selectIdDuplCnt("invalid_id");

        //then
        assertEquals(1, cnt);
        assertEquals(0,cnt2);
    }

}