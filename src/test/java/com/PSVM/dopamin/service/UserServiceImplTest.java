package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.UserDto;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserServiceImplTest {
    @Autowired
    UserService userService;


    @Before
    @Transactional
    public void setUp(){
    }
    @After
    @Transactional
    public void reset(){
    }
    @Test
    @Transactional
    public void testJoinUser() {
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //when
        int rowCnt = userService.joinUser(userDto);
        UserDto userDto1 = userService.getUser(userDto.getUser_id());
        //then
        assertEquals(2, rowCnt);
        assertEquals(userDto.getUser_id(),userDto1.getUser_id());
    }
    @Test
    @Transactional
    public void testGetUser(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //when
        int rowCnt = userService.joinUser(userDto);
        UserDto userDto1 = userService.getUser(userDto.getUser_id());
        //then
        assertEquals(2, rowCnt);
        assertEquals(userDto.getUser_id(),userDto1.getUser_id());
    }
    @Test(expected = DuplicateKeyException.class)
    @Transactional
    public void testJoinUserTx(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt = userService.joinUser(userDto);

        //when
        int rowCnt2 = userService.joinUser(userDto);

        //then
        assertEquals(1,rowCnt);
        assertEquals(1,rowCnt2);
    }

    @Test
    @Transactional
    public void testIdDuplicateCheck(){

        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt = userService.joinUser(userDto);

        //when
        int cnt = userService.idDuplCk(userDto.getUser_id());

        //then
        assertEquals(2, rowCnt);
        assertEquals(1, cnt);
    }

    @Test
    @Transactional
    public void testIdPwdCheck(){

    }


    @Test(expected = NullPointerException.class)
    public void shouldNullPointerExceptionWhenUserIdDoesntExist(){
        //given
        String user_id = "invalid_userId";
        String user_pwd = "invalid_userPwd";

        //when
        boolean result = userService.idPwdCheck(user_id, user_pwd);

        //then
        assertTrue(!result);

    }

}