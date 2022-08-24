package com.PSVM.dopamin.domain.Item;

import com.PSVM.dopamin.domain.Item.ItemForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class ItemValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return ItemForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ItemForm itemForm = (ItemForm) target;
        String vali_message = "필수 정보입니다.";

        //모든 입력값 필수 처리.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "list_nm", "vali_message", vali_message);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "item_grd", "vali_message", vali_message);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "item_nm", "vali_message", vali_message);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "item_dsc", "vali_message", vali_message);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "item_price", "vali_message", vali_message);
//
        //이름, 설명, 가격 정규표현식 처리
        //이름: 한글,영어,숫자,띄어쓰기
//        final String item_nm_pattern = "^[가-힣a-sA-Z0-9\\s]+";
//        //가격: 숫자만 가능:
//        final String item_price_pattern = "^[0-9]+";
////
//        //item_nm의 유효성 검사
//        if (!itemForm.getItem_nm().equals("")) {
//            boolean nameResult = Pattern.matches(item_nm_pattern, itemForm.getItem_nm());
//            if(!nameResult){
//                errors.rejectValue("item_nm", "invalid", "한글,영어,숫자만 입력 가능합니다.");
//            }
//        }
//        //아이템이름 중복검사.
//
//        //item_price의 값 검사
//        if (!itemForm.getItem_price().equals("")) {
//            boolean priceResult = Pattern.matches(item_price_pattern, itemForm.getItem_price());
//            if(!priceResult){
//                errors.rejectValue("item_price", "invalid", "숫자만 가능합니다.");
//            }
//        }
    }
}
