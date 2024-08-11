package com.example.mulitplex_service.repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Showtimes;
@Repository
public interface ShowtimeRepository extends JpaRepository<Showtimes, Long>{
     @Query(value = "CALL GetShowtimesByScreenAndDate(:p_id , :p_date)", nativeQuery = true)
    List<Showtimes> findByScreenIdAndShowDate(@Param("p_id") long screenId,@Param("p_date") LocalDate showDate);
     @Query(value = "CALL GetShowtimeDetails(:p_id ,:p_date, :p_time)", nativeQuery = true)
    Showtimes findShowByScreenIdDateTime(@Param("p_id") long screenId,@Param("p_date") LocalDate showDate, @Param("p_time") LocalTime showTime);
    @Query(value = "CALL GetShowtimesByScreenAndDateAndTime(:p_id , :p_date, :p_time, :p_movieId)", nativeQuery = true)
    List<Showtimes> findByScreenIdAndShowDateTime(@Param("p_id") long screenId,@Param("p_date") LocalDate showDate, @Param("p_time") LocalTime showTime, @Param("p_movieId") long movieId);
    @Query(value = "CALL GetShowstimeByScreenID(:p_id)", nativeQuery = true)
    List<Showtimes> findByScreenId(@Param("p_id") long screenId);
    @Query(value = "CALL GetShowstimeByMovieID(:p_id)", nativeQuery = true)
    List<Showtimes> getShowstimeByMovieID(@Param("p_id") long movieId);
    @Query(value = "CALL GetShowtimeByMovieIdAndShowdate(:p_id,:p_date)", nativeQuery = true)
    List<Showtimes> getMovieIdAndShowdate(@Param("p_id") long movieId, @Param("p_date") LocalDate showDate);
  
}
