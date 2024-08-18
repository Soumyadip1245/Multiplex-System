package com.example.mulitplex_service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Seats;
@Repository
public interface SeatsRepository extends JpaRepository<Seats, Long>{
     @Query(value = "CALL GetSeatsByScreenId(:p_id)", nativeQuery = true)
    List<Seats> findByScreenID(@Param("p_id") long id);
}
