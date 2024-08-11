package com.example.mulitplex_service.exception;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Error {
    private String message;
    private int status;
    private long timeStamp;

}
