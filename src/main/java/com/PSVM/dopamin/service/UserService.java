package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.UserDto;

public interface UserService {

    boolean idPwdCheck(String id, String pwd);

    int joinUser(UserDto userDto);

    UserDto getUser(String user_id);

    int idDuplCk(String user_id);
}
