package com.example.view_controller.entity;
import java.time.LocalDateTime;
import java.util.List;
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
    private Multiplexes multiplexes;

    @OneToMany(mappedBy = "screen")
    private List<Seats> seats;

    @OneToMany(mappedBy = "screen")
    private List<Showtimes> showtimes;
}
