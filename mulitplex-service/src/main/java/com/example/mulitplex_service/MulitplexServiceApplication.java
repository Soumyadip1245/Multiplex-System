package com.example.mulitplex_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MulitplexServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(MulitplexServiceApplication.class, args);
	}

}
