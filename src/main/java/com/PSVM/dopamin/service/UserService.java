package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.UserDto;
import com.PSVM.dopamin.domain.UserPwdDto;

public interface UserService {
    UserPwdDto getUserPwd(String id);
    int idDuplicateCheck(String id);

    int userJoin(UserDto userDto,UserPwdDto userPwdDto);
}
