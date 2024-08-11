package com.example.mulitplex_service.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Showtimes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate showDate;
    private LocalTime showTime;
    private Double price;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    // @JsonIgnore
    private Movies movie;

    @ManyToOne
    @JoinColumn(name = "screen_id")
    // @JsonIgnore
    private Screens screen;

    @OneToMany(mappedBy = "showtime")
    @JsonIgnore
    private List<Bookings> bookings;
}
