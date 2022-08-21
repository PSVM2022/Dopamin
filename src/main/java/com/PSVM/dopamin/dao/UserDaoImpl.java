package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.PSVM.dopamin.dao.UserMapper.";

    @Override
    public int insertUser(UserDto userDto) throws DuplicateKeyException {
        System.out.println("call insertUser in UserDaoImpl");
        return session.insert(namespace+"insertUser",userDto);
    }

    @Override
    public int insertUserPwd(UserDto userDto) throws DuplicateKeyException {
        System.out.println("call insertUserPwdin UserDaoImpl");

        return session.insert(namespace+"insertUserPwd",userDto);
    }

    @Override
    public UserDto selectUser(String user_id) {
        return session.selectOne(namespace+"selectUser",user_id);
    }

    @Override
    public int updateUser(UserDto userDto) {
        return 0;
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int deleteUser(String user_id) {
        return session.delete(namespace+"deleteUser",user_id);
    }

    @Override
    public int selectIdDuplCnt(String user_id) {
        return session.selectOne(namespace+"selectIdDuplCnt",user_id);
    }

    @Override
    public String selectUserPwd(String user_id) {
        return session.selectOne(namespace+"selectUserPwd",user_id);
    }

    @Override
    public int insertCart(String user_id) {
        return session.insert(namespace+"insertCart",user_id);
    }

    @Override
    public String selectCartId(String user_id) {
        return session.selectOne(namespace+"selectCartId",user_id);
    }

}
