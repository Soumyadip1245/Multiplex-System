package com.example.mulitplex_service.repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.SeatLog;

@Repository
public interface SeatLogRepository extends JpaRepository<SeatLog, Long> {

    @Modifying
    @Query(value = "CALL deleteBySeatIdAndShowDate(:seat_id, :show_date, :show_time, :screen_id, :movie_id)", nativeQuery = true)
    void deleteBySeatIdAndShowDateAndShowTimeAndUserIdAndScreenIdAndMovieId(
            @Param("seat_id") Long seatId,
            @Param("show_date") LocalDate showDate,
            @Param("show_time") LocalTime showTime,
            @Param("screen_id") Long screenId,
            @Param("movie_id") Long movieId
    );

    @Query(value = "CALL findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(:seat_id, :show_date, :show_time, :screen_id, :movie_id)", nativeQuery = true)
    Optional<SeatLog> findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(
            @Param("seat_id") Long seatId,
            @Param("show_date") LocalDate showDate,
            @Param("show_time") LocalTime showTime,
            @Param("screen_id") Long screenId,
            @Param("movie_id") Long movieId
    );

    @Modifying
    @Query(value = "call deleteexpiredseatlogs()",nativeQuery=true)
    void deleteByExpiresAtBefore();
}
