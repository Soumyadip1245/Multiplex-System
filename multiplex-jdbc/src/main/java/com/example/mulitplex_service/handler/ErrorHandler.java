package com.example.mulitplex_service.handler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.example.mulitplex_service.exception.CustomErrorNotFoundException;
import com.example.mulitplex_service.exception.Error;

@ControllerAdvice
public class ErrorHandler {
    @ExceptionHandler(CustomErrorNotFoundException.class)
    ResponseEntity<Error> handleNotFoundException(CustomErrorNotFoundException ex){
        Error error = new Error();
        error.setMessage(ex.getMessage());
        error.setStatus(HttpStatus.NOT_FOUND.value());
        error.setTimeStamp(System.currentTimeMillis());
        return new ResponseEntity<>(error,HttpStatus.NOT_FOUND);
    }
}