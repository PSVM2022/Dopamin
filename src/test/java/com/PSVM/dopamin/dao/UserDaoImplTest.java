package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.service.UserService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;
    @Autowired
    UserService userService;


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
    public void insertUser() {
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);

        //when
        int rowCnt = userDao.insertUser(userDto);
        //then
        assertEquals(1,rowCnt);
    }

    @Test(expected = DuplicateKeyException.class)
    @Transactional
    public void shouldDuplicateKeyExceptionWhenInsertDulicationUserId() {
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
    public void shouldDuplicateKeyExceptionWhenDulicationUserId()
    {
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
    public void selectUser(){
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
    public void selectIdDuplicateCount(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        userDao.insertUser(userDto);
        userDao.insertUserPwd(userDto);

        //when
        int cnt = userDao.selectIdDuplCnt(userDto.getUser_id());
        int cnt2 = userDao.selectIdDuplCnt("invalid_id");

        //then
        assertEquals(1, cnt);
        assertEquals(0,cnt2);
    }

    @Test
    @Transactional
    public void testSelectUserPwd(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);

        //when
        String actualPwd = userDao.selectUserPwd(userDto.getUser_id());
        //then
        assertEquals(1,rowCnt);
        assertEquals(1,rowCnt2);
        assertEquals(userDto.getUser_pwd(),actualPwd);
    }

    @Test
    @Transactional
    public void isNullWhenDoesntExistUserId(){
        //given
        String invalid_userId = "invalid_userId";
        //when

        String pwd = userDao.selectUserPwd(invalid_userId);
        //then
        assertEquals(null,pwd);
    }

    @Test
    @Transactional
    public void testInsertCart(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);

        //when
        int rowCnt3 = userDao.insertCart(userDto.getUser_id());

        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
        assertEquals(1,rowCnt3);
    }

    @Test
    @Transactional
    public void testSelectCartId(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        int rowCnt3 = userDao.insertCart(userDto.getUser_id());

        //when
        String cart_id = userDao.selectCartId(userDto.getUser_id());

        //then
        assertTrue(cart_id != null);

    }

    @Test
    @Transactional
    public void testUpdateUserGenre(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        UserDto survey = new UserDto(userDto.getUser_id(),8,2,3,4,5);
        //when
        int rowCnt3 = userDao.updateUserGenre(survey);
        UserDto user = userDao.selectUser(userDto.getUser_id());
        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
        assertEquals(1,rowCnt3);
        assertEquals((Integer) 8,user.getFav_genre1());
    }

    @Test
    @Transactional
    public void IsNullWhenSurveyIfGenreIsNull(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        UserDto survey = new UserDto(userDto.getUser_id(),null,null,null,null,null);

        //when
        int rowCnt3 = userDao.updateUserGenre(survey);
        UserDto user = userDao.selectUser(userDto.getUser_id());

        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
        assertEquals(1,rowCnt3);
        assertEquals(null,user.getFav_genre1());
    }
    @Test
    @Transactional
    public void testUpdateUser() {
            //given
            UserDto userDto = new UserDto("testid", "testpwd", "성", "이름", "010-1234-1234", "KOREA", "test@email.com", "testnic", "20000101", (byte) 1);
            int rowCnt1 = userDao.insertUser(userDto);
            UserDto upUserDto = new UserDto(userDto.getUser_id(),"upPwd", "upFnm", "upLnm", "010-9877-9877", "infp", "upCnty", "bbb@naver.com", "upNic", "19990101", (byte) 1, "upProfile", 7, 6, 5, 4, 3, new Date(), "testid");
            userDto = userDao.selectUser(userDto.getUser_id());

            //when
            int rowCnt2 = userDao.updateUser(upUserDto);
            userDto = userDao.selectUser(userDto.getUser_id());
            //then
            assertEquals(1, rowCnt1);
            assertEquals(1, rowCnt2);
            assertEquals("testid", userDto.getUser_id());
            assertEquals(userDto.getF_nm(), upUserDto.getF_nm());
    }

    @Test
    @Transactional
    public void testUpdateUserPwd(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        UserDto upUserDto = new UserDto(userDto.getUser_id(),"upPwd", "upFnm", "upLnm", "010-9877-9877", "infp", "upCnty", "bbb@naver.com", "upNic", "19990101", (byte) 1, "upProfile", 7, 6, 5, 4, 3, new Date(), "testid");

        //when
        int rowCnt3 = userDao.updateUserPwd(upUserDto);
        String userPwd = userDao.selectUserPwd(userDto.getUser_id());

        //then
        assertEquals(1,rowCnt1);
        assertEquals(1,rowCnt2);
        assertEquals(userPwd,upUserDto.getUser_pwd());
    }

    @Test
    @Transactional
    public void testInsertUserHistWhenUserModifyPwd(){
        //given
        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
        //가입
        userService.joinUser(userDto);
        //수정
        UserDto upUserDto = new UserDto(userDto.getUser_id(),"upPwd", "upFnm", "upLnm", "010-9877-9877", "infp", "upCnty", "bbb@naver.com", "upNic", "19990101", (byte) 1, "upProfile", 7, 6, 5, 4, 3, new Date(), "testid");
        String before_pwd = userDao.selectUserPwd("testid");
        //비번수정
        userDao.updateUserPwd(upUserDto);

        //when
        userDao.insertUserPwdHist("testid",before_pwd);
        userDto = userService.getUser("testid");
        //then
        assertEquals(userDao.selectUserPwd("testid"),upUserDto.getUser_pwd());
        assertEquals("testpwd",userDao.selectUserPwdHist("testid"));
    }
}