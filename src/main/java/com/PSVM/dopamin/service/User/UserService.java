package com.PSVM.dopamin.service.User;

import com.PSVM.dopamin.domain.User.UserDto;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface UserService {

    boolean idPwdCheck(String id, String pwd);

    int joinUser(UserDto userDto);

    UserDto getUser(String user_id);

    int idDuplicateCheck(String user_id) throws Exception;

    void withdrawUser(String user_id);

    String getCartId(String user_id);

    boolean loginCheck(HttpServletRequest request);

    int surveyDo(UserDto userDto);

    int modifyUserInfo(UserDto userDto);

    boolean idValidCheck(String id);

    int modifyUserPrfImg(String s3Url,String user_id) throws IOException;

    String convertFileToPath(MultipartFile multipartFile);

}
