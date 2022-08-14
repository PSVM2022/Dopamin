package com.PSVM.dopamin.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

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
        UserDto userDto = (UserDto) target;
        String id = userDto.getUser_id();
        String email = userDto.getEmail();
        String phone_num = userDto.getPhone_num();

        String idCheck = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$";
        String emailCheck = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
        String phone_numCheck="^\\\\d{3}-\\\\d{3,4}-\\\\d{4}$";

        Matcher mId = Pattern.compile(idCheck).matcher(id);
        Matcher mEmail = Pattern.compile(emailCheck).matcher(email);
        Matcher mPhone = Pattern.compile(phone_numCheck).matcher(phone_num);

        System.out.println("UserDtoValid="+mEmail.find()+","+mId.find()+","+mPhone.find());
        if(!mEmail.find())
        if(!mId.find()){
            errors.rejectValue("id","id_invalid");
        }
    }
}
