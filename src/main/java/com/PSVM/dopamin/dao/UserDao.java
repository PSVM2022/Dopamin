package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserPwdDto;

public interface UserDao {
    UserPwdDto selectPwd(String id);
    int selectIdDuplCk(String id);

    int insertUser(UserDto userDto);
    int insertUserPwd(UserPwdDto userPwdDto);



}
