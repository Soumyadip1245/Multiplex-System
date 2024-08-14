package com.example.view_controller.entity;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String password;
    private String email;

    private String role = "USER";

    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "user")
    private List<Bookings> bookings;

    @OneToMany(mappedBy = "owner")
    private List<Multiplexes> multiplexes;

    @ManyToMany(mappedBy = "admins")
    private List<Multiplexes> adminMultiplexes;

    @OneToMany(mappedBy = "user")
    private List<UserVouchers> userVouchers;
    @Override
    public String toString() {
        return "Users [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", role="
                + role + ", createdAt=" + createdAt + ", bookings=" + bookings + ", multiplexes=" + multiplexes + "]";
    }
}
