package com.example.mulitplex_service.services;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.example.mulitplex_service.entity.Bookings;
import com.example.mulitplex_service.entity.Movies;
import com.example.mulitplex_service.entity.Multiplexes;
import com.example.mulitplex_service.entity.Screens;
import com.example.mulitplex_service.entity.Seats;
import com.example.mulitplex_service.entity.Showtimes;
import com.example.mulitplex_service.entity.Users;
import com.example.mulitplex_service.utils.MovieTime;
import com.example.mulitplex_service.utils.SeatsBooked;

public interface MultiplexService {

    Multiplexes createMultiplexes(Multiplexes multiplexes, long ownerId);
    List<Multiplexes> getAllMultiplexesByOwnerId(Long ownerId);
    Screens createScreens(Screens screen, long multiplexId);
    List<Screens> getAllScreensByMultiplexId(Long multiplexId);
    List<Seats> getAllSeatsByScreen(Long screenId);
    Showtimes createShowtime(Showtimes showtime, long screenId, long movieId);
    Movies createMovies(Movies movie);
    Multiplexes findMultiplexById(long id);
    List<LocalTime> getAvailableShowTimes(long screenId, LocalDate showDate);
    List<Seats> showAllBookedSeatsForShowtime(long screenId,LocalDate selectedDate, LocalTime selectedTime );
    List<Movies> getAllMovies();
    List<Multiplexes> getAllMultiplex();
    SeatsBooked makeBookingLoadSeats(long multiplexId,long movieId, LocalDate date, LocalTime time);
    Movies getMovieById(long movieId);
    String handleSeatClick(Long seatId, LocalDate showDate, LocalTime showTime, Long movieId, Long screenId, Long userId);
    Bookings createBooking(Map<String, Object> payload);
    Bookings showBooking(long id);
    List<Showtimes> getAllShowtimesByScreenId(long id);
    HashSet<LocalDate> findAllShowtimesDatesByMovieId(long movieId);
    List<MovieTime> findallmultiplexwithTime(long movieId, LocalDate showDate);
    List<Bookings> showReports(LocalDate date);
    List<Users> getAllAdmins();
    List<Multiplexes> findByAdminId(long adminId);
}   
