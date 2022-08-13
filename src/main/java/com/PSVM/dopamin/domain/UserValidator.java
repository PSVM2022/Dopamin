//package com.PSVM.dopamin.domain;
//
//import org.springframework.validation.Errors;
//import org.springframework.validation.Validator;
//
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
//public class UserValidator implements Validator {
//    @Override
//    public boolean supports(Class<?> clazz) {
//        //clazz가 UserDto 또는 그 자손인지 검증
//        return UserDto.class.isAssignableFrom(clazz);
//    }
//
//    @Override
//    public void validate(Object target, Errors errors) {
//        UserDto userDto = (UserDto) target;
//        String id = userDto.getUser_id();
//        String pwdCheck="^(?=.*\\\\d)(?=.*[~`!@#$%\\\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$";
//
//        Matcher m = Pattern.compile(pwdCheck).matcher(id);
//
//        String idCheck = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$";
//        Matcher mId = Pattern.compile(idCheck).matcher(idCheck);
//        if(!mId.find()){
//            errors.rejectValue("id","id_invalid");
//        }
//
//    }
//}
