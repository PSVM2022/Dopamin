package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;

    @Override
    @Transactional(rollbackFor = DuplicateKeyException.class)
    public int joinUser(UserDto userDto) throws DuplicateKeyException{
        System.out.println("in ServiceImpl");
        //비밀번호 암호화 메서드 호출 필요
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        return rowCnt1 + rowCnt2;
    }

    @Override
    public UserDto getUser(String user_id) {
        return userDao.selectUser(user_id);
    }

    @Override
    public int idDuplCk(String user_id) {
        return userDao.selectIdDuplCnt(user_id);
    }
}
