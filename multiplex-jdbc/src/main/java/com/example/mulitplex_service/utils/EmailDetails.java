package com.example.mulitplex_service.utils;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class EmailDetails {
 
    private String recipient;
    private String msgBody;
    private String subject;
    private String attachment;
}