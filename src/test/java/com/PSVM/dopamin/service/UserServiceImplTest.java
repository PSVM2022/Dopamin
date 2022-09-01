//package com.PSVM.dopamin.service;
//
//import com.PSVM.dopamin.dao.UserDao;
//import com.PSVM.dopamin.domain.UserDto;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.dao.DuplicateKeyException;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.Date;
//
//import static org.junit.Assert.*;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class UserServiceImplTest {
//    @Autowired
//    UserService userService;
//    @Autowired
//    UserDao userDao;
//
//    @Before
//    @Transactional
//    public void setUp(){
//        userService.withdrawUser("testid");
//    }
//    @After
//    @Transactional
//    public void reset(){
//        userService.withdrawUser("testid");
//    }
//    @Test
//    @Transactional
//    public void testJoinUser() {
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        //when
//        int rowCnt = userService.joinUser(userDto);
//        UserDto userDto1 = userService.getUser(userDto.getUser_id());
//        //then
//        assertEquals(3, rowCnt);
//        assertEquals(userDto.getUser_id(),userDto1.getUser_id());
//    }
//    @Test
//    @Transactional
//    public void testGetUser(){
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        //when
//        int rowCnt = userService.joinUser(userDto);
//        UserDto userDto1 = userService.getUser(userDto.getUser_id());
//        //then
//        assertEquals(3, rowCnt);
//        assertEquals(userDto.getUser_id(),userDto1.getUser_id());
//    }
//    @Test(expected = DuplicateKeyException.class)
//    @Transactional
//    public void testJoinUserTx(){
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        int rowCnt = userService.joinUser(userDto);
//
//        //when
//        int rowCnt2 = userService.joinUser(userDto);
//
//        //then
//        assertEquals(1,rowCnt);
//        assertEquals(1,rowCnt2);
//    }
//
//    @Test
//    @Transactional
//    public void testIdDuplicateCheck(){
//
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        int rowCnt = userService.joinUser(userDto);
//
//        //when
//        int cnt = userService.idDuplicateCheck(userDto.getUser_id());
//
//        //then
//        assertEquals(3, rowCnt);
//        assertEquals(1, cnt);
//    }
//
//    @Test
//    @Transactional
//    public void isTrueIdPwdCheck(){
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        userService.joinUser(userDto);
//        String id = "testid";
//        String pwd = "testpwd";
//
//        //when
//        boolean result = userService.idPwdCheck(id, pwd);
//        //then
//        assertTrue(result);
//    }
//
//    @Test
//    @Transactional
//    public void isFalseIdPwdCheck(){
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        userService.joinUser(userDto);
//        String id = "testid";
//        String pwd = "invalid_pwd";
//        //when
//        boolean result = userService.idPwdCheck(id, pwd);
//        //then
//        assertTrue(!result);
//    }
//
//
//    @Test
//    public void shouldNullPointerExceptionWhenUserIdDoesntExist(){
//        try {
//            //given
//            String user_id = "invalid_userId";
//            String user_pwd = "invalid_userPwd";
//
//            //when
//            userService.idPwdCheck(user_id, user_pwd);
//        }catch (NullPointerException ne){
//            String msg =ne.getMessage();
//            //then
//            assertEquals("User doesn't exist",msg);
//        }
//    }
//
//    @Test(expected = NullPointerException.class)
//    public void shouldNullPointerExceptionWhenUserIdIsInvalid(){
//        //given
//        String user_id = "invalid_userId";
//        String user_pwd = "invalid_userPwd";
//
//        //when
//        userService.idPwdCheck(user_id, user_pwd);
//    }
//
//    @Test
//    public void testSurveyGenre(){
//        //given
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        userService.joinUser(userDto);
//        UserDto survey = new UserDto(userDto.getUser_id(),3,1,6,12,5);
//        //when
//        int rowCnt = userService.surveyGenre(survey);
//        UserDto user = userService.getUser(userDto.getUser_id());
//
//        //then
//        assertEquals(1,rowCnt);
//        assertEquals((Integer)12,user.getFav_genre4());
//        assertEquals((Integer) 5,user.getFav_genre5());
//    }
//
//    @Test
//    @Transactional
//    public void shouldNullPointerExceptionWhenSurveyIfUserIdIsNull(){
//        try{
//            //given
//            UserDto survey = new UserDto(null,3,1,6,12,5);
//            //when
//            int rowCnt = userService.surveyGenre(survey);
//
//        }catch (NullPointerException ne){
//            String msg = ne.getMessage();
//            //then
//            assertEquals("재시도해주시길 바랍니다.",msg);
//        }
//
//    }
//
//    @Test
//    @Transactional
//    public void testModifyUserInform(){
//        //given
//        //가입
//        UserDto userDto = new UserDto("testid","testpwd","성","이름","010-1234-1234","KOREA","test@email.com","testnic","20000101",(byte)1);
//        userService.joinUser(userDto);
//        UserDto upUserDto = new UserDto(userDto.getUser_id(),"upPwd", "upFnm", "upLnm", "010-9877-9877", "infp", "upCnty", "bbb@naver.com", "upNic", "19990101", (byte) 1, "upProfile", 7, 6, 5, 4, 3, new Date(), "testid");
//
//        //when
//        //수정
//        int rowCnt = userService.modifyUserInform(upUserDto);
//        userDto = userService.getUser("testid");
//        String pwd = userDao.selectUserPwd("testid");
//        //then
//
//        assertEquals("upPwd",pwd);
//        assertEquals("upFnm",userDto.getF_nm());
//    }
//
//
//}