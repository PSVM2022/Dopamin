package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;


    @Override
    public int idDuplicateCheck(String id) {
        return userDao.selectIdDuplCk(id);
    }

    @Override
    @Transactional
    public int userJoin(UserDto userDto) {
        //비밀번호 암호화 메서드 호출 필요

        userDao.insertUser(userDto);
        userDao.insertUserPwd(userDto);
        return 0;
    }

}
