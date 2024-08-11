package com.example.view_controller.entity;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class SeatLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long seatId;
    private LocalDate showDate;
    private LocalTime showTime;
    private Long movieId;
    private Long screenId;
    private Long userId;
    private LocalDateTime lockedAt;
    private LocalDateTime expiresAt;
}
