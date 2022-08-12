package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserPwdDto;

public interface UserDao {
    UserPwdDto selectPwd(String id);
}
