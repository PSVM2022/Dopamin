package com.PSVM.dopamin.domain.Item;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

public class ItemValidatorException extends Exception{
    private Map error_msg = new HashMap();

    public ItemValidatorException(BindingResult result, String msg){
        super(msg);
        System.out.println(msg+"1");
        for (FieldError fieldError : result.getFieldErrors()) {
            error_msg.put(fieldError.getField(),fieldError.getDefaultMessage());
        }
    }
    public Map getError_msg() {
        return error_msg;
    }
}
