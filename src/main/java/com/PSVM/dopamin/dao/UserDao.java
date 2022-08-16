package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;

public interface UserDao {
    int selectIdDuplCk(String id);

    int insertUser(UserDto userDto);

    int insertUserPwd(UserDto userDto);
//    int insertUserPwd(UserPwdDto userPwdDto);



}
