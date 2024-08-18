package com.example.mulitplex_service.entity;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class BookingDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double price;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    @JsonIgnore
    private Bookings booking;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private Seats seat;
}
