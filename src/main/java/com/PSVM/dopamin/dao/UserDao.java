package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.User.UserDto;

public interface UserDao {

    int insertUser(UserDto userDto);

    int insertUserPwd(UserDto userDto);

    UserDto selectUser(String id);

    int updateUser(UserDto userDto);
    int deleteAll();

    int deleteUser(String user_id);

    int selectIdDuplCnt(String user_id) throws Exception;

    String selectUserPwd(String user_id);

    int insertCart(String user_id);

    String selectCartId(String user_id);

    int updateUserSurvey(UserDto userDto);

    int updateUserPwd(UserDto userDto);

    int deleteUserPwdHist(String user_id);

    int insertUserPwdHist(String user_id, String user_pwd);

    String selectUserPwdHist(String user_id);



}
