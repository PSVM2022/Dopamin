package com.PSVM.dopamin.domain;

import com.PSVM.dopamin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserDtoValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        System.out.println("clazz.getName()=="+clazz.getName());
        Field[] f = clazz.getDeclaredFields();
        for(Field field : f){
            System.out.println("field="+field);
        }

        //clazz가 UserDto 또는 그 자손인지 검증
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {


        //1. 데이터 형식 검증(아이디, 비밀번호, 전화번호)
        UserDto userDto = (UserDto) target;
        String id = userDto.getUser_id();
        String pwd = userDto.getUser_pwd();
        String phone_num = userDto.getPhone_num();

        System.out.println("id="+id);
        System.out.println("pwd="+pwd);
        System.out.println("phon_num="+phone_num);

        final String idCheck = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$";
        final String phone_numCheck="^\\\\d{3}-\\\\d{3,4}-\\\\d{4}$";
        final String pwdCheck = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";


        Matcher mId = Pattern.compile(idCheck).matcher(id);
        Matcher mPhone = Pattern.compile(phone_numCheck).matcher(phone_num);
        Matcher mPwd = Pattern.compile(pwdCheck).matcher(pwd);
        System.out.println("mId.find()"+mId.find());
        if(!mId.find()){
            errors.rejectValue("user_id","id_invalid");
        }
        if(!mPwd.find()){
            errors.rejectValue("user_pwd","pwd_invalid");
        }
        if(!mPhone.find()){
            errors.rejectValue("phone_num","phone_invalid");
        }
    }
}
