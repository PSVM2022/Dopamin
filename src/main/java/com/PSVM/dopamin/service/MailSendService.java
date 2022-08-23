package com.PSVM.dopamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
    private int authNum;

    public void makeRandomNum(){
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
    }
}
