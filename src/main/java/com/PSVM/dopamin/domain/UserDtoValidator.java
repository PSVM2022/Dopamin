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
    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        System.out.println("in valiate supports");
        //clazz가 UserDto 또는 그 자손인지 검증
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("in vlidate");
        UserDto userDto = (UserDto) target;
        String rqrMsg= "필수 정보입니다.";


        //2. 모든 입력값 필수로 처리
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


        //아이디, 비밀번호, 전화번호, 이메일 정규표현식
        final String idPattern = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,15}$";
        final String phone_numPattern="^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
        final String pwdPattern = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
        final String emailPattern = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";


        if(!userDto.getUser_id().equals("")) {
            boolean idResult = Pattern.matches(idPattern, userDto.getUser_id());
            System.out.println("idReuslt=" + idResult);
            if (!idResult) {
                System.out.println("id 정규식 불일치");
                errors.rejectValue("user_id", "id_invalid", "4~15자 영문,숫자를 사용하세요.");
            }
            //아이디 중복 체크
            else{
                //NullPointerException 발생

//                int count = userService.idDuplicateCheck(userDto.getUser_id());
//                if(count==1){
//                    System.out.println("아이디 중복");
//                    errors.rejectValue("user_id","id_duplicate","중복된 아이디입니다.");
//                }

            }



        }



        if(!userDto.getUser_pwd().equals("")){
            boolean pwdResult = Pattern.matches(pwdPattern,userDto.getUser_pwd());
            System.out.println("pwdReuslt="+pwdResult);
            if (!pwdResult) {
                System.out.println("pwd 정규식 불일치");
                errors.rejectValue("user_pwd", "pwd_invalid","8~15자 영문,숫자,특수문자를 사용하세요.");
            }


        }

        if(!userDto.getPhone_num().equals("")){
            boolean emailResult = Pattern.matches(emailPattern,userDto.getEmail());
            System.out.println("emailReuslt="+emailResult);
            if (!emailResult) {
                System.out.println("email 정규식 불일치");
                errors.rejectValue("email","email_invalid","이메일 양식을 확인해주세요.");
            }
        }
    }
}
