package com.PSVM.dopamin.error;

import lombok.Builder;

public class Message {
    private String message1;
    private String message2;
    public Message(){}

    @Builder
    public Message(String message1, String message2) {
        this.message1 = message1;
        this.message2 = message2;
    }

    public String getMessage1() {
        return message1;
    }

    public void setMessage1(String message1) {
        this.message1 = message1;
    }

    public String getMessage2() {
        return message2;
    }

    public void setMessage2(String message2) {
        this.message2 = message2;
    }
}