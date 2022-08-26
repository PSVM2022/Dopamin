package com.PSVM.dopamin.domain.User;

import com.PSVM.dopamin.domain.User.UserDto;
import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import java.util.regex.Pattern;

public class UserDtoValidator implements Validator {
    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        System.out.println("supports");
        //clazz가 UserDto 또는 그 자손인지 검증
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserDto userDto = (UserDto) target;
        //userDt0=UserDto{user_id='asdsd', user_pwd='', f_nm='', l_nm='', phone_num='', mbti='null', cnty='KR',
        // email='@naver.com', nic='', btdt=20220826, sex=0, prf_img='null', dopa_exp=null, dopa_point=null, user_stat=null,
        // fav_genre1='null', fav_genre2='null', fav_genre3='null', fav_genre4='null', fav_genre5='null',
        // rept_times=null, in_date=null, in_user='null', up_date=null, up_user='null'}
        System.out.println("validate");

        System.out.println("userDt0="+userDto);

        //2. 모든 입력값 필수로 처리
        final String rqrMsg= "필수 정보입니다.";
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"user_id","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"user_pwd","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"f_nm","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"l_nm","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"phone_num","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"cnty","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"nic","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"btdt","rqrMsg",rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"sex","rqrMsg",rqrMsg);

//        if(userDto.getSex()==0){
//            System.out.println("ddd");
//            errors.rejectValue("sex","rqrMsg",rqrMsg);
//        }
//        if(userDto.getBtdt().equals("0")){
//            System.out.println("qqq");
//            errors.rejectValue("btdt","rqrMsg",rqrMsg);
//        }
        //이름 검사
        String f_nm = userDto.getF_nm();
//        if(f_nm.length())


        //아이디, 비밀번호, 전화번호, 이메일 정규표현식
        //4~15자, 영문+숫자 조합
        final String idPattern = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,15}$";
        final String phone_numPattern="^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
        //8~15자, 영문+숫자+특수 조합
        final String pwdPattern = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
        final String emailPattern = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";


        if(!userDto.getUser_id().equals("")) {
            boolean idResult = Pattern.matches(idPattern, userDto.getUser_id());
            if (!idResult) {
                System.out.println("아이디 정규식");
                errors.rejectValue("user_id", "id_invalid", "4~15자 영문,숫자 조합을 사용하세요.");
            }

        }

        if(!userDto.getUser_pwd().equals("")){


            boolean pwdResult = Pattern.matches(pwdPattern,userDto.getUser_pwd());
            if (!pwdResult) {
                System.out.println("비번 정규식");
                errors.rejectValue("user_pwd", "pwd_invalid","8~15자 영문,숫자,특수문자 조합을 사용하세요.");
            }
        }

        if(!userDto.getEmail().equals("")){


            boolean emailResult = Pattern.matches(emailPattern,userDto.getEmail());
            if (!emailResult) {
                System.out.println("이메일 정규식");
                errors.rejectValue("email","email_invalid","이메일 양식을 확인해주세요.");
            }
        }
        if(!userDto.getPhone_num().equals("")){


            boolean phone_numResult = Pattern.matches(phone_numPattern,userDto.getPhone_num());
            if (!phone_numResult) {
                System.out.println("전화번호 정규식");
                errors.rejectValue("phone_num","phone_num_invalid","예시대로 입력해주세요");
            }
        }
    }
}
