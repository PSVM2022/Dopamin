package com.PSVM.dopamin.domain;

import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserDtoValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        //clazz가 UserDto 또는 그 자손인지 검증
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        String rqrMsg= "필수 정보입니다.";


        //1. 데이터 형식 검증(아이디, 비밀번호, 전화번호)
        UserDto userDto = (UserDto) target;
        String id = userDto.getUser_id();
        String pwd = userDto.getUser_pwd();
        String phone_num = userDto.getPhone_num();
        System.out.println("id="+id);
        System.out.println("pwd="+pwd);
        System.out.println("phon_num="+phone_num);


        final String idCheck = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,15}$";
        final String phone_numCheck="^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
        final String pwdCheck = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
        final String emailCheck = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";

        //2. 필수값 처리
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

        if(!userDto.getUser_id().equals("")) {
            Matcher mId = Pattern.compile(idCheck).matcher(id);
            System.out.println("mId.find()" + mId.find());
            if (!mId.find()) {
                errors.rejectValue("user_id", "id_invalid");
            }
        }

        if(!userDto.getUser_pwd().equals("4~15자 영문,숫자를 사용하세요.")){
            Matcher mPwd = Pattern.compile(pwdCheck).matcher(pwd);
            if (!mPwd.find()) {
                errors.rejectValue("user_pwd", "pwd_invalid","8~15자 영문,숫자,특수문자를 사용하세요.");
            }

        }
        if(!userDto.getPhone_num().equals("")){
            Matcher mPhone = Pattern.compile(phone_numCheck).matcher(phone_num);
            if (!mPhone.find()) {
                errors.rejectValue("phone_num", "phone_invalid" ,"전화번호가 유효하지 않습니다.") ;
            }
        }
        if(!userDto.getEmail().equals("")){
            Matcher mEmail = Pattern.compile(emailCheck).matcher(userDto.getEmail());
            if(!mEmail.find()){
                errors.rejectValue("email","email_invalid","이메일 양식을 확인해주세요.");
            }
        }

    }
}
