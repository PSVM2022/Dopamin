package com.PSVM.dopamin.service.User;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;

    @Override
    public boolean idPwdCheck(String id, String pwd) throws NullPointerException{
        String user_pwd = userDao.selectUserPwd(id);
        //비밀번호 pwd 를 암호화해서 user_pwd와 체크
        //비밀번호 암호화 메서드 호출. pwd는 암호화된 pwd로 바꿔줘야함.
        if(user_pwd==null) {
            throw new NullPointerException("존재하지 않는 아이디입니다.");
        }
        System.out.println("id="+id+", "+"pwd="+pwd);
        System.out.println("id, pwd 일치?? "+pwd.equals(user_pwd));
        return pwd.equals(user_pwd);
    }


    @Override
    @Transactional(rollbackFor = DuplicateKeyException.class)
    public int joinUser(UserDto userDto) throws DuplicateKeyException{
        System.out.println("call joinUser method in ServiceImpl");
        //비밀번호 암호화 메서드 호출 필요
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        int rowCnt3 = userDao.insertCart(userDto.getUser_id());
        return rowCnt1 + rowCnt2 + rowCnt3;
    }

    @Override
    public UserDto getUser(String user_id) {
        return userDao.selectUser(user_id);
    }

    @Override
    public int idDuplicateCheck(String user_id) throws Exception{
        return userDao.selectIdDuplCnt(user_id);
    }

    @Override
    public void withdrawUser(String user_id) {
        userDao.deleteUser(user_id);
    }

    @Override
    public String getCartId(String user_id) {

        return userDao.selectCartId(user_id);
    }

    @Override
    public boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null;
    }

    @Override
    public int surveyGenre(UserDto userDto)  throws NullPointerException{
        System.out.println("call serveyGenre method in UserSeviceImpl");
        int result = userDao.updateUserGenre(userDto);
        if(result==0){
            throw new NullPointerException("재시도해주시길 바랍니다.");
        }
        return result;
    }

    @Override
    public int modifyUserInform(UserDto userDto) {
        //변경 전 비밀번호 가져오기
        String beforePwd = userDao.selectUserPwd(userDto.getUser_id());
        //수정
        userDao.updateUser(userDto);
        userDao.updateUserPwd(userDto);
        //USER_PWD_UPD_HIST DB에서 delete 후 insert
        userDao.deleteUserPwdHist(userDto.getUser_id());
        //변경 전 비밀번호 넣기
        return userDao.insertUserPwdHist(userDto.getUser_id(),beforePwd);
    }

    @Override
    public boolean idValidCheck(String id) {
        final String idPattern = "^[A-Za-z]{1}[A-Za-z0-9]{3,19}$";
        return Pattern.matches(idPattern, id);
    }
}