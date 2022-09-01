package com.PSVM.dopamin.service;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AmazonConfig {

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

//    @Value("${cloud.aws.region}")
    private String region="ap-northeast-2";


//    @Value("${cloud.aws.credentials.accessKey}")
    private String accessKey="AKIAWOW5ZA7IAKJ53S7I";//todo

//    @Value("${cloud.aws.credentials.secretKey}")
    private String secretKey="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";//todo

    @Bean
    public AmazonS3 s3(){
        AWSCredentials awsCredentials = new BasicAWSCredentials(
                accessKey, secretKey
        );

        return AmazonS3ClientBuilder
                .standard()
                .withRegion(region)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
    }
}
