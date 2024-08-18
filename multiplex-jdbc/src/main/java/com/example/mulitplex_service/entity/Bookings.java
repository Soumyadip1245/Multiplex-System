package com.example.mulitplex_service.entity;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Bookings {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double totalPrice;
    private LocalDateTime bookingDate;

    @Enumerated(EnumType.STRING)
    private Status status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne
    // @JsonIgnore
    @JoinColumn(name = "showtime_id")
    private Showtimes showtime;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    private List<BookingDetails> bookingDetails;
    @OneToOne
    private UserVouchers userVouchers;
    
    public enum Status {
        CONFIRMED, CANCELLED
    }

    // @Override
    // public String toString() {
    //     return "Bookings [id=" + id + ", totalPrice=" + totalPrice + ", bookingDate=" + bookingDate + ", status="
    //             + status + ", user=" + user + ", showtime=" + showtime + ", bookingDetails=" + bookingDetails + "]";
    // }
}
