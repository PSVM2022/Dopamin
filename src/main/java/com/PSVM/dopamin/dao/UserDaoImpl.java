package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.PSVM.dopamin.dao.UserMapper.";


    @Override
    public int selectIdDuplCk(String id) {
        return session.selectOne(namespace+"selectIdDuplCk",id);
    }

    @Override
    public int insertUser(UserDto userDto) {
        return session.insert(namespace+"insertUser",userDto);
    }

    @Override
    public int insertUserPwd(UserDto userDto) {
        return session.insert(namespace+"insertUserPwd",userDto);
    }

//    @Override
//    public int insertUserPwd(UserPwdDto userPwdDto) {
//        return session.insert(namespace+"insertUserPwd",userPwdDto);
//    }




}
