package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.UserDto;

public interface UserService {
    int idDuplicateCheck(String id);

    int userJoin(UserDto userDto);
}
