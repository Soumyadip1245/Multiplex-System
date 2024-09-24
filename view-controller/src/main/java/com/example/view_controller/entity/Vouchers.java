package com.example.view_controller.entity;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;
@Entity
@Getter
@Setter
public class Vouchers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type; 

    private double value;

    private double minimumSpend; 

    private LocalDateTime expirationDate; 

    @OneToMany(mappedBy = "voucher")
    private List<UserVouchers> userVouchers;

    @Override
    public String toString() {
        return "Vouchers [id=" + id + ", type=" + type + ", value=" + value + 
                ", minimumSpend=" + minimumSpend + ", expirationDate=" + expirationDate + "]";
    }
}