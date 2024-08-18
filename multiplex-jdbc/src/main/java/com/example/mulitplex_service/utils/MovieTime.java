package com.example.mulitplex_service.utils;

import java.time.LocalTime;
import java.util.List;

import com.example.mulitplex_service.entity.Multiplexes;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MovieTime {
    Multiplexes multiplex;
    List<LocalTime> timeSlot;  
}
