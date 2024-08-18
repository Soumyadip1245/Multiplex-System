package com.example.mulitplex_service.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Vouchers;
@Repository
public interface VoucherRepository extends JpaRepository<Vouchers, Long>{
    
}
