package com.example.mulitplex_service.entity;
import java.time.LocalDateTime;
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
public class Screens {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private Integer capacity;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "multiplex_id")
    // @JsonIgnore
    private Multiplexes multiplexes;

    @OneToMany(mappedBy = "screen")
    @JsonIgnore
    private List<Seats> seats;

    @OneToMany(mappedBy = "screen")
    @JsonIgnore
    private List<Showtimes> showtimes;

    @Override
    public String toString() {
        return "Screens [id=" + id + ", name=" + name + ", capacity=" + capacity + ", createdAt=" + createdAt
                + ", multiplexes=" + multiplexes + ", seats=" + seats + ", showtimes=" + showtimes + "]";
    }
}
