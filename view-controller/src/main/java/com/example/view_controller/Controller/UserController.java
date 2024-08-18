package com.example.view_controller.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.example.view_controller.entity.Bookings;
import com.example.view_controller.entity.Movies;
import com.example.view_controller.entity.Users;
import com.example.view_controller.utils.MovieTime;
import com.example.view_controller.utils.SeatsBooked;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private HttpSession session;
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        String url1 = "http://MULTIPLEX-SERVICE/allMovies";
        ResponseEntity<Movies[]> response1 = restTemplate.getForEntity(url1, Movies[].class);
        model.addAttribute("movies", response1.getBody());
        return "user/manageBooking";
    }
   

    @PostMapping("/load-timings")
    public String loadTimings(@RequestParam("showDate") LocalDate showDate, @RequestParam("movieId") Long movieId, Model model ) {
        String url = "http://MULTIPLEX-SERVICE/findshowbyMovieIdandDate/"+movieId+"/"+showDate;
        ResponseEntity<MovieTime[]> response = restTemplate.getForEntity(url, MovieTime[].class); 
        model.addAttribute("movieTime",response.getBody()); 
        model.addAttribute("movieId", movieId);
        model.addAttribute("showDate", showDate);
        return "user/loadTimings";
    }
     @PostMapping("/selectShowtime")
    public String selectShowtime(@RequestParam("multiplexId") long multiplexId,@RequestParam("showDate")  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate showDate, @RequestParam("showTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)  LocalTime showTime, @RequestParam("movieId") long movieId, Model model, HttpSession session) {
       System.out.print("Multiplex Id: "+ multiplexId + " Show Date: "+showDate+" Show Time: "+showTime+ " Movie Id: "+movieId);
       String url = "http://MULTIPLEX-SERVICE/makeBookingLoadSeats/"+multiplexId+"/"+movieId+"/"+showDate+"/"+showTime;
       System.out.println(url);
       Users user = (Users) session.getAttribute("user");
       ResponseEntity<SeatsBooked> response = restTemplate.getForEntity(url, SeatsBooked.class);
       model.addAttribute("membershipType",user.getMembershipType());
       model.addAttribute("bookedSeats",response.getBody().getBookedSeats());
       model.addAttribute("seats",response.getBody().getAllSeats());
       model.addAttribute("showtimeId",response.getBody().getShowtimeId());
       model.addAttribute("basePrice",response.getBody().getBasePrice());
       model.addAttribute("multiplexId", multiplexId);
       model.addAttribute("showDate", showDate);
       model.addAttribute("showTime", showTime);
       model.addAttribute("movieId", movieId);
       model.addAttribute("userId",user.getId());
       model.addAttribute("screenId",response.getBody().getScreenId());
       return "user/bookSeats";
    }
      @GetMapping("/billBooking/{id}")
    public String invoiceGenerator(@PathVariable("id") long id,Model model) {
        String url = "http://MULTIPLEX-SERVICE/getBookingById/"+id;
        ResponseEntity<Bookings> response = restTemplate.getForEntity(url, Bookings.class);
        model.addAttribute("bookings",response.getBody());
        String encodedUrl = "http://localhost:8080/owner/billBooking/"+id;
        model.addAttribute("encodedUrl",encodedUrl);
        return "user/billBooking";
    }

    @GetMapping("manage-bookings")
    public String manageBooking(Model model) {
        var user = (Users) session.getAttribute("user");
        if (user.getId() > 0) {
            String url = "http://MULTIPLEX-SERVICE/getBookingsForUser/" + user.getId();
            System.out.println(url);
            ResponseEntity<Bookings[]> response = restTemplate.getForEntity(url, Bookings[].class);
            System.out.println(response.getBody());
            model.addAttribute("bookings", response.getBody());
        }
        return "user/viewReport";
    }
    
    @GetMapping("/membership")
    public String loadMembership(Model model){
        var user = (Users) session.getAttribute("user");
        System.out.print(user.getMembershipType());
        model.addAttribute("membershipType",user.getMembershipType());
        model.addAttribute("userId",user.getId());
        return "user/membershipPage";
    }
    
}
