package com.example.mulitplex_service.exception;

public class CustomErrorNotFoundException extends RuntimeException{
    public CustomErrorNotFoundException(String message){
        super(message);
    }
}