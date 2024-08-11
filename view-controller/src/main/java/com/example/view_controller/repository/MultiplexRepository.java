package com.example.view_controller.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.view_controller.entity.Multiplexes;

public interface MultiplexRepository extends JpaRepository<Multiplexes, Long>{
    
}
