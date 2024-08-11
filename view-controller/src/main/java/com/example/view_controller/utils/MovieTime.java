package com.example.view_controller.utils;

import java.time.LocalTime;
import java.util.List;

import com.example.view_controller.entity.Multiplexes;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MovieTime {
    Multiplexes multiplex;
    List<LocalTime> timeSlot;  
}

