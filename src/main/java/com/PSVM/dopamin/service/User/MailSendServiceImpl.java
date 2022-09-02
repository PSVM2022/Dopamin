package com.PSVM.dopamin.service.User;

import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

@Service
public class MailSendServiceImpl implements MailSendService {

    private int authNumber;
    // 난수 발생

    @Override
    public void makeRandomNumber() {
        // 난수의 범위 111111 ~ 999999 (6자리 난수)
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        authNumber = checkNum;
    }


    //이메일 보낼 양식
    @Override
    public String joinEmail(String email) throws MessagingException {
        //인증번호 생성
        makeRandomNumber();
        String setFrom = "iks5951@naver.com";
        String toMail = email;
        String title = "도파민 회원 가입 인증 이메일 입니다."; // 이메일 제목
        String content = "[도파민] 본인확인 인증번호는 ["+authNumber+"]입니다. 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
    }

    //이메일 전송 메소드
    @Override
    public void mailSend(String setFrom, String toEmail, String title, String content) throws MessagingException {
        String host="smtp.naver.com";
        final String username="iks5951";
        final String password = "like0101@@$$";
        int port=465;
        Properties p = System.getProperties();
        p.put("mail.smtp.host", host);
        p.put("mail.smtp.port",port);
        p.put("mail.smtp.auth","true");
        p.put("mail.smtp.ssl.enable","true");
        p.put("mail.smtp.ssl.trust",host);

        Session session = Session.getDefaultInstance(p,new javax.mail.Authenticator(){
            String un = username;
            String pw= password;

            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(un,pw);
            }
        });
        session.setDebug(true);

        Message mimeMessage = new MimeMessage(session);

        mimeMessage.setFrom(new InternetAddress(setFrom));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        mimeMessage.setSubject(title);
        mimeMessage.setText(content);
        Transport.send(mimeMessage);

    }


}
