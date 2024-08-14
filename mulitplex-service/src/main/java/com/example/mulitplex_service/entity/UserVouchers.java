package com.example.mulitplex_service.entity;

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
public class UserVouchers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String voucherCode;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonIgnore
    private Users user; 

    @ManyToOne
    @JoinColumn(name = "voucher_id")
    @JsonIgnore
    private Vouchers voucher; 

    private boolean redeemed; 

    private double amount;
    private LocalDateTime redeemedAt; 

    public boolean getRedeemed(){
        return this.redeemed;
    }
    @Override
    public String toString() {
        return "UserVouchers [id=" + id + ", user=" + user + ", voucher=" + voucher + 
                ", redeemed=" + redeemed + ", redeemedAt=" + redeemedAt + "]";
    }
}