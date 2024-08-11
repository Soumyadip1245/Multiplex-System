package com.example.mulitplex_service.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Bookings;

@Repository
public interface BookingRepository extends JpaRepository<Bookings, Long> {

    @Query(value = "call GetBookingByShowtimeId(:p_id)", nativeQuery = true)
    List<Bookings> getBookingByShowTimeId(@Param("p_id") long showtimeId);

    @Query(value = "CALL GetShowstimeByDate(:p_date)", nativeQuery = true)
    List<Bookings> getByShowDate(@Param("p_date") LocalDate showDate);

    @Query("SELECT b FROM Bookings b JOIN b.showtime s WHERE s.showDate = :showDate")
    List<Bookings> findAllByShowDate(LocalDate showDate);
}
