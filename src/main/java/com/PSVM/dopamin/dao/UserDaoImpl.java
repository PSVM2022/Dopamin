package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.User.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
        return session.update(namespace+"updateUser",userDto);
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
    public int selectIdDuplCnt(String user_id)throws Exception {
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

    @Override
    public int updateUserSurvey(UserDto userDto) {
        return session.update(namespace+"updateUserSurvey",userDto);
    }

    @Override
    public int updateUserPwd(UserDto userDto) {
        return session.update(namespace+"updateUserPwd",userDto);
    }

    @Override
    public int deleteUserPwdHist(String user_id) {
        return session.delete(namespace+"deleteUserHist",user_id);
    }

    @Override
    public int insertUserPwdHist(String user_id, String user_pwd) {
        Map map = new HashMap();
        map.put("user_id",user_id);
        map.put("user_pwd",user_pwd);
        return session.insert(namespace+"insertUserHist",map);
    }

    @Override
    public String selectUserPwdHist(String user_id) {
        return session.selectOne(namespace+"selectUserPwdHist",user_id);
    }

    @Override
    public int updateUserPrfImg(String path,String user_id) {
        Map map = new HashMap();
        map.put("path",path);
        map.put("user_id",user_id);
        return session.update(namespace+"updateUserPrfImg", map);
    }
}