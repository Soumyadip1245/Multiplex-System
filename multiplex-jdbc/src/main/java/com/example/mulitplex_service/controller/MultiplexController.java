package com.example.mulitplex_service.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.mulitplex_service.entity.Bookings;
import com.example.mulitplex_service.entity.Movies;
import com.example.mulitplex_service.entity.Multiplexes;
import com.example.mulitplex_service.entity.Screens;
import com.example.mulitplex_service.entity.Seats;
import com.example.mulitplex_service.entity.Showtimes;
import com.example.mulitplex_service.entity.Users;
import com.example.mulitplex_service.entity.Vouchers;
import com.example.mulitplex_service.services.MultiplexService;
import com.example.mulitplex_service.services.VoucherService;
import com.example.mulitplex_service.utils.MovieTime;
import com.example.mulitplex_service.utils.SeatsBooked;
import com.example.mulitplex_service.utils.VoucherResponse;






@RestController

public class MultiplexController {

    @Autowired
    private MultiplexService multiplexService;
    @Autowired
    private VoucherService voucherService;
    @Autowired
    private Environment environment;

    @PostMapping("/add-multiplex/{id}")
    public ResponseEntity<Void> addMultiplex(@RequestBody Multiplexes m, @PathVariable("id") long ownerId) {
        System.out.println(m.toString());
        multiplexService.createMultiplexes(m, ownerId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/multiplex-owner/{id}")
    public ResponseEntity<List<Multiplexes>> findMultiplexesByOwnerId(@PathVariable("id") long id) {
        List<Multiplexes> multiplexes = multiplexService.getAllMultiplexesByOwnerId(id);
        return new ResponseEntity<>(multiplexes, HttpStatus.OK);
    }

    @PostMapping("/add-screen/{id}")
    public ResponseEntity<Void> addScreens(@RequestBody Screens s, @PathVariable("id") long multiplexId) {
        multiplexService.createScreens(s, multiplexId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/screen-multiplex/{id}")
    public ResponseEntity<List<Screens>> findScreensByMultiplexId(@PathVariable("id") long id) {
        List<Screens> screen = multiplexService.getAllScreensByMultiplexId(id);
        return new ResponseEntity<>(screen, HttpStatus.OK);
    }

    @GetMapping("/seats-screen/{id}")
    public ResponseEntity<List<Seats>> findSeastByScreenId(@PathVariable("id") long id) {
        List<Seats> seats = multiplexService.getAllSeatsByScreen(id);
        return new ResponseEntity<>(seats, HttpStatus.OK);
    }

    @PostMapping("/add-showtime/{id}/{id11}")
    public ResponseEntity<Showtimes> addShowtime(@RequestBody Showtimes s, @PathVariable("id") long screenId, @PathVariable("id11") long movieId) {
        Showtimes show = multiplexService.createShowtime(s, screenId, movieId);
        return new ResponseEntity<>(show, HttpStatus.OK);
    }

    @GetMapping("/get-multiplex/{id}")
    public ResponseEntity<Multiplexes> getMultiplexesById(@PathVariable("id") long id) {
        Multiplexes show = multiplexService.findMultiplexById(id);
        return new ResponseEntity<>(show, HttpStatus.OK);
    }

    @PostMapping("/add-movie")
    public ResponseEntity<Movies> addMovie(@RequestBody Movies m) {

        Movies show = multiplexService.createMovies(m);
        return new ResponseEntity<>(show, HttpStatus.OK);
    }

    @GetMapping("/get-available-time-slots/{screenId}/{showDate}")
    public ResponseEntity<List<LocalTime>> getAvailableSlotsForShows(@PathVariable("screenId") long screenId, @PathVariable("showDate") LocalDate showDate) {
        List<LocalTime> listlocal = multiplexService.getAvailableShowTimes(screenId, showDate);
        return new ResponseEntity<>(listlocal, HttpStatus.OK);
    }

    @GetMapping("/get-bookedseats/{screenId}/{date}/{time}")
    public ResponseEntity<List<Seats>> getBookedSeats(@PathVariable("screenId") long screenId, @PathVariable("date") LocalDate date, @PathVariable("time") LocalTime time) {
        List<Seats> bookedSeats = multiplexService.showAllBookedSeatsForShowtime(screenId, date, time);
        return new ResponseEntity<>(bookedSeats, HttpStatus.OK);
    }

    @GetMapping("/allMovies")
    public ResponseEntity<List<Movies>> findMovies() {
        List<Movies> movieList = multiplexService.getAllMovies();
        return new ResponseEntity<>(movieList, HttpStatus.OK);
    }

    @GetMapping("/allMultiplex")
    public ResponseEntity<List<Multiplexes>> findMultiplexes() {
        List<Multiplexes> multiplexList = multiplexService.getAllMultiplex();
        return new ResponseEntity<>(multiplexList, HttpStatus.OK);
    }

    @GetMapping("/makeBookingLoadSeats/{multiplexId}/{movieId}/{date}/{time}")
    public ResponseEntity<SeatsBooked> findSeatsForBooking(@PathVariable("multiplexId") long multiplexId, @PathVariable("movieId") long movieId, @PathVariable("date") LocalDate date, @PathVariable("time") LocalTime time) {
        SeatsBooked seatList = multiplexService.makeBookingLoadSeats(multiplexId, movieId, date, time);
        return new ResponseEntity<>(seatList, HttpStatus.OK);
    }

    @GetMapping("/getMoviebyId/{id}")
    public ResponseEntity<Movies> getMovieById(@PathVariable("id") long id) {
        return new ResponseEntity<>(multiplexService.getMovieById(id), HttpStatus.OK);
    }

    @GetMapping("/click/{seatId}/{showDate}/{showTime}/{movieId}/{screenId}/{userId}")
    public ResponseEntity<String> handleSeatClick(
            @PathVariable Long seatId,
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate showDate,
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime showTime,
            @PathVariable Long movieId,
            @PathVariable Long screenId,
            @PathVariable Long userId) {

        String response = multiplexService.handleSeatClick(seatId, showDate, showTime, movieId, screenId, userId);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/createBooking")
    public ResponseEntity<Bookings> createBookings(@RequestBody Map<String, Object> payload) {
        Bookings createdBooking = multiplexService.createBooking(payload);
        return new ResponseEntity<>(createdBooking, HttpStatus.OK);
    }
    @GetMapping("/getBookingById/{id}")
    public ResponseEntity<Bookings> getBooking(@PathVariable("id") long id){
        Bookings b = multiplexService.showBooking(id);
        return new ResponseEntity<>(b,HttpStatus.OK);
    }
    @GetMapping("/getAllScreenId/{id}")
    public ResponseEntity<List<Showtimes>> getAllShowtimesScreenId(@PathVariable("id") long id){
        List<Showtimes> b = multiplexService.getAllShowtimesByScreenId(id);
        return new ResponseEntity<>(b,HttpStatus.OK);
    }
    @GetMapping("/findAllShowtimesByMovieId/{id}")
    public ResponseEntity<HashSet<LocalDate>> getAllShowtimesMovieId(@PathVariable("id") long id){
        HashSet<LocalDate> b = multiplexService.findAllShowtimesDatesByMovieId(id);
        return new ResponseEntity<>(b,HttpStatus.OK);
    }
    @GetMapping("/findshowbyMovieIdandDate/{id}/{date}")
    public ResponseEntity<List<MovieTime>> getAllShowtimesMovieId(@PathVariable("id") long id, @PathVariable("date") LocalDate date){
        List<MovieTime> b = multiplexService.findallmultiplexwithTime(id,date);
        return new ResponseEntity<>(b,HttpStatus.OK);
    }

    @GetMapping("/reports/{date}")
    public ResponseEntity<List<Bookings>> getReport(@PathVariable LocalDate date) {
        List<Bookings> r = multiplexService.showReports(date);
        return new ResponseEntity<>(r,HttpStatus.OK);
    }
   
    @GetMapping("/getAdmins")
    public ResponseEntity<List<Users>> getAdmins() {
        List<Users> r = multiplexService.getAllAdmins();
        return new ResponseEntity<>(r,HttpStatus.OK);
    }
    
    @GetMapping("/getAllMultiplexesByAdminId/{id}")
    public ResponseEntity<List<Multiplexes>> getAdminMultiplexesById(@PathVariable("id") long id) {
        List<Multiplexes> r = multiplexService.findByAdminId(id);
        return new ResponseEntity<>(r,HttpStatus.OK);
    }
    @GetMapping("/getBookingsForUser/{id}")
    public ResponseEntity<List<Bookings>> getBookingsForUser(@PathVariable("id") long id) {
        List<Bookings> r = multiplexService.findByUserId(id);
        return new ResponseEntity<>(r,HttpStatus.OK);
    }
    
    @PostMapping("/createVoucher")
    public ResponseEntity<Vouchers> createVouchers(@RequestBody Vouchers voucher) {
       Vouchers v = voucherService.createVoucher(voucher);
        return new ResponseEntity<>(v,HttpStatus.OK);
    }
    
    @GetMapping("/getAllVouchers")
    public ResponseEntity<List<Vouchers>> getAllVoucherList() {
        return new ResponseEntity<>(voucherService.getAllVouchers(),HttpStatus.OK);
    }

    @GetMapping("/voucher-status/{name}")
    public ResponseEntity<VoucherResponse> getVoucherStatus(@PathVariable("name") String name) {
        VoucherResponse message = voucherService.findVoucher(name);
        return new ResponseEntity<VoucherResponse>(message,HttpStatus.OK);
    }
    
    @GetMapping("/updateMembership/{id}/{membership}")
    public ResponseEntity<Users> updateMembership(@PathVariable("id") long userId, @PathVariable("membership") String membershipType){
        Users u = multiplexService.updateMembership(userId, membershipType);
        return new ResponseEntity<>(u,HttpStatus.OK);
    }
    @GetMapping("/multiplex-logs/{id}")
    public String getMultiplexOwner(@PathVariable Long id) {
        return "Handled by instance running on port: " + environment.getProperty("local.server.port");
    }
}
