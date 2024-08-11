package com.example.view_controller.utils;

import java.util.List;

import com.example.view_controller.entity.Seats;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class SeatsBooked {
    List<Seats> bookedSeats;
    List<Seats> allSeats;
    private Double basePrice;
    Long screenId;
    Long showtimeId;
}
