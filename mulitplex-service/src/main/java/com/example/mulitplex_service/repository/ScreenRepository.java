package com.example.mulitplex_service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Screens;
@Repository
public interface ScreenRepository extends JpaRepository<Screens, Long>{
    @Query(value = "CALL GetScreenByMultiplexId(:p_id)", nativeQuery = true)
    List<Screens> findByMultiplexId(@Param("p_id") long id);
}
