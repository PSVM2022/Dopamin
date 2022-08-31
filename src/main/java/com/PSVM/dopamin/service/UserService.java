package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.UserDto;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    boolean idPwdCheck(String id, String pwd);

    int joinUser(UserDto userDto);

    UserDto getUser(String user_id);

    int idDuplicateCheck(String user_id);

    void withdrawUser(String user_id);

    String getCartId(String user_id);

    boolean loginCheck(HttpServletRequest request);

    int surveyGenre(UserDto userDto);

    int modifyUserInform(UserDto userDto);

}
