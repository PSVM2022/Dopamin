package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserPwdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;

    @Override
    public UserPwdDto getUserPwd(String id) {
        return userDao.selectPwd(id);
    }

    @Override
    public int idDuplicateCheck(String id) {
        return userDao.selectIdDuplCk(id);
    }

    @Override
    public int userJoin(UserDto userDto,UserPwdDto userPwdDto) {
        //tx로 묶기
        userDao.insertUser(userDto);
        userDao.insertUserPwd(userPwdDto);
        return 1;

    }
}
