package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.UserDto;

public interface UserDao {

    int insertUser(UserDto userDto);

    int insertUserPwd(UserDto userDto);

    UserDto selectUser(String id);

    int updateUser(UserDto userDto);
    int deleteAll();

    int deleteUser(String user_id);

    int selectIdDuplCnt(String user_id);

    String selectUserPwd(String user_id);

    int insertCart(String user_id);

    String selectCartId(String user_id);

    int updateUserGenre(UserDto userDto);



}
