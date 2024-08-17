package com.example.view_controller.entity;
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
public class Seats {
 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer rowNum; 
    private Integer seatNumber;
    private LocalDateTime createdAt;
    private boolean isGold = false;
    private boolean isPlatinum = false;
    @ManyToOne
    @JoinColumn(name = "screen_id")
    @JsonIgnore
    private Screens screen;
}
