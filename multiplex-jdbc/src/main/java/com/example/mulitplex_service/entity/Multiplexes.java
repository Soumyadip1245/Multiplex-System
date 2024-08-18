package com.example.mulitplex_service.entity;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Multiplexes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "owner_id")
     @JsonIgnore
    private Users owner;

    @OneToMany(mappedBy = "multiplexes")
    @JsonIgnore
    private List<Screens> screens;

     @ManyToMany
    @JoinTable(
        name = "multiplex_admins",
        joinColumns = @JoinColumn(name = "multiplex_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<Users> admins;
    
}
