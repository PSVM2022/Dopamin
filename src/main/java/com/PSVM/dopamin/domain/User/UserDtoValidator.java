package com.PSVM.dopamin.domain.User;

import com.PSVM.dopamin.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Arrays;
import java.util.Calendar;
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

        System.out.println("userDt0=" + userDto);

        final String rqrMsg = "필수 정보입니다.";
        final String exactMsg = "정확히 입력해주세요";


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_id", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_pwd", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "f_nm", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "l_nm", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nic", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "btdt", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone_num", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cnty", "rqrMsg", rqrMsg);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "rqrMsg", rqrMsg);
        //정규식 모음
        //이름: 한글 이름 2~4자
        final String namePattern = "^[가-힣]{1,4}$";
        //닉네임: 한글만 가능 1~15자
        final String nicPattern = "^[가-힣]{1,15}$";
        //아이디: (4~20자리, 첫글자 숫자 X)
        final String idPattern = "^[A-Za-z]{1}[A-Za-z0-9]{3,19}$";
        //비밀번호: 8~15자,대문자 1, 소문자1, 숫자1, 특수문자1
        final String pwdPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,15}";
        //전화번호: -없이 입력
        final String phone_numPattern = "(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})";
        final String emailPattern = "^[a-z0-9\\.\\-_]+@([a-z0-9\\-]+\\.)+[a-z]{2,6}$";
        //이름 검사


        int thisYear = Calendar.getInstance().get(Calendar.YEAR);

        String btdt = userDto.getBtdt();
        int year = Integer.parseInt(btdt.substring(0, 4));
        int month = Integer.parseInt(btdt.substring(4, 6));
        int day = Integer.parseInt(btdt.substring(6));
        System.out.println(year + "년" + month + "월" + day + "일");

        if ((thisYear - 100) > year || year > thisYear || 1 > month || 12 < month) {
            errors.rejectValue("btdt", "exactMsg", exactMsg);
        }

        final String[] CNTIES = {
                "GH", "NZ", "KR", "DK", "DE", "RU", "MX", "US", "BR", "SE", "CH",
                "SG", "IS", "IE", "IN", "ID", "JP", "ZM", "CN", "PT", "FR", "PH", "HU"
        };

        System.out.println("====="+Arrays.asList(CNTIES).contains(userDto.getCnty()));

        if (!Arrays.asList(CNTIES).contains(userDto.getCnty())) {
            errors.rejectValue("cnty", "exactMsg", exactMsg);
        }

        int[] smallMonth = {4, 6, 9, 11};
        int[] bigMonth = {1, 3, 5, 7, 8, 10, 12};
        //month가 bigMonth에 포함되있으면
        if (Arrays.stream(bigMonth).anyMatch(x -> x == month)) {
            if (0 > day || 31 < day) {
                errors.rejectValue("btdt", "exactMsg", exactMsg);
            }
        } else if (month == 2) {
            if (0 > day || 28 < day) {
                errors.rejectValue("btdt", "exactMsg", exactMsg);
            }
        } else {
            if (0 > day || 30 < day) {
                errors.rejectValue("btdt", "exactMsg", exactMsg);
            }
        }

        byte sex = userDto.getSex();
        if (sex != 0 && sex != 1) {
            errors.rejectValue("sex", "exactMsg", exactMsg);
        }


        if (!userDto.getNic().equals("")) {
            if (!Pattern.matches(nicPattern, userDto.getNic())) {
                errors.rejectValue("nic", "nic_invalid", "한글만 작성해주세요");
            }
        }

        if (!userDto.getF_nm().equals("")) {
            if (!Pattern.matches(namePattern, userDto.getF_nm())) {
                errors.rejectValue("f_nm", "exactMsg", exactMsg);
            }
        }
        if (!userDto.getL_nm().equals("")) {
            if (!Pattern.matches(namePattern, userDto.getL_nm())) {
                errors.rejectValue("l_nm", "exactMsg", exactMsg);
            }
        }


        if (!userDto.getUser_id().equals("")) {
            if (!Pattern.matches(idPattern, userDto.getUser_id())) {
                errors.rejectValue("user_id", "id_invalid", "4~20자,영문 및 숫자 조합을 사용하세요.");
            }
        }

        if (!userDto.getUser_pwd().equals("")) {
            if (!Pattern.matches(pwdPattern, userDto.getUser_pwd())) {

                errors.rejectValue("user_pwd", "pwd_invalid", "8~15자, 영문 대소문자, 숫자, 특수문자를 포함하세요.");
            }
        }

        if (!userDto.getEmail().equals("")) {
            if (!Pattern.matches(emailPattern, userDto.getEmail())) {

                errors.rejectValue("email", "email_invalid", "이메일 양식을 확인해주세요.");
            }
        }
        if (!userDto.getPhone_num().equals("")) {
            if (!Pattern.matches(phone_numPattern, userDto.getPhone_num())) {

                errors.rejectValue("phone_num", "phone_num_invalid", "-없이 작성해주세요.");
            }
        }
    }
}
