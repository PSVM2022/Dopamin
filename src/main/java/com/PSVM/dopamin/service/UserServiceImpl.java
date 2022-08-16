package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;


    @Override
    public int idDuplicateCheck(String id) {
        return userDao.selectIdDuplCk(id);
    }

    @Override
    public int userJoin(UserDto userDto) {

        userDao.insertUser(userDto);
        userDao.insertUserPwd(userDto);
        return 0;
    }


}
