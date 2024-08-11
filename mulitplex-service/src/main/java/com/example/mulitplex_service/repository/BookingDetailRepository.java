package com.example.mulitplex_service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.BookingDetails;
@Repository
public interface BookingDetailRepository extends JpaRepository<BookingDetails, Long>{
    @Query(value = "call GetBookingDetailsByBookingId(:p_id)",nativeQuery=true)
    List<BookingDetails> getBookingDetailsByBookingId(@Param("p_id") long bookingId);
}
