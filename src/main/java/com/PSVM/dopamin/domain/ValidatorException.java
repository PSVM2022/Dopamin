package com.PSVM.dopamin.domain;


import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

public class ValidatorException extends Exception{
    private Map error_msg = new HashMap();

    public ValidatorException(BindingResult result, String msg){
        super(msg);
        for (FieldError fieldError : result.getFieldErrors()) {
            error_msg.put(fieldError.getField(),fieldError.getDefaultMessage());
        }


    }
    public Map getError_msg() {
        return error_msg;
    }
}
