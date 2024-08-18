package com.example.mulitplex_service.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Movies {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String synopsis;
    private String cast;
    private String trailerUrl;
    private Double rating;
    private LocalDate releaseDate;
    private Integer duration;
    private LocalDateTime createdAt;
    private String imdbId;
    private String imageUrl;
}
