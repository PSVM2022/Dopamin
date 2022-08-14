package com.PSVM.dopamin.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserPwdDtoValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return UserPwdDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserPwdDto userPwdDto = (UserPwdDto) target;
        String pwd = userPwdDto.getUser_pwd();
        String pwdCheck = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
        Matcher m = Pattern.compile(pwdCheck).matcher(pwd);

        if(!m.find()){
            errors.rejectValue("pwd","pwd_invalid");
        }

    }
}
