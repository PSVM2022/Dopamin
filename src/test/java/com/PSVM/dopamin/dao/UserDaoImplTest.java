package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void selectPwdTest() {

    }
    @Test
    public void selectIdDuplCkTest(){
        String id = "tq";
        int count = userDao.selectIdDuplCk(id);
        assertEquals(0,count);

        UserDto userDto = new UserDto("tqtq","kim","hyoeun","8201012345678","ISFP", "KOREA","test@gmail.com", "testnick","20000101",(byte) 1,"","1","2","3","4","5");
        int rowCnt = userDao.insertUser(userDto);
        assertEquals(1,rowCnt);
        int count2 = userDao.selectIdDuplCk("tqtq");
        assertEquals(1,count2);
    }
    @Test
    public void insertUserTest(){
        UserDto userDto = new UserDto("testid3","kim","hyoeun","8201012345678","ISFP", "KOREA","test@gmail.com", "testnick","20000101",(byte) 1,"","1","2","3","4","5");
        int rowCnt = userDao.insertUser(userDto);

        assertEquals(1,rowCnt);

    }
    @Test
    public void insertUserPwdTest(){
        UserDto userDto = new UserDto("nnnn","kim","hyoeun","8201012345678","ISFP", "KOREA","test@gmail.com", "testnick","20000101",(byte) 1,"","1","2","3","4","5");
//        UserPwdDto userPwdDto = new UserPwdDto("nnnn","testpwd0",new Date(),new Date());

        int rowCnt1 = userDao.insertUser(userDto);
//        int rowCnt2 = userDao.insertUserPwd(userPwdDto);

        assertEquals(1,rowCnt1);
//        assertEquals(1,rowCnt2);
    }


}