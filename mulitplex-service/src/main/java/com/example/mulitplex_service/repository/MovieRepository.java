package com.example.mulitplex_service.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Movies;
@Repository
public interface MovieRepository extends JpaRepository<Movies, Long>{
    
}
