package com.example.view_controller.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

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
import com.example.view_controller.entity.Multiplexes;
import com.example.view_controller.entity.Screens;
import com.example.view_controller.entity.Seats;
import com.example.view_controller.entity.Showtimes;
import com.example.view_controller.entity.Users;
import com.example.view_controller.entity.Vouchers;
import com.example.view_controller.repository.MultiplexRepository;
import com.example.view_controller.service.user.UserService;
import com.example.view_controller.utils.MovieTime;
import com.example.view_controller.utils.SeatsBooked;

import jakarta.servlet.http.HttpSession;




@Controller
@RequestMapping("/owner")
public class OwnerController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userRepository;
    @Autowired
    private MultiplexRepository multiplexRepository;
    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Users user = (Users) session.getAttribute("user");
        if (user.getId() > 0) {
            String url = "http://localhost:3080/multiplex-owner/" + user.getId();
            System.out.println(url);
            ResponseEntity<Multiplexes[]> response = restTemplate.getForEntity(url, Multiplexes[].class);
            System.out.println(response.getBody());
            model.addAttribute("multiplexes", response.getBody());
        }
        model.addAttribute("userName", user.getUsername());
        return "owner/ownerDashboard";
    }

    @PostMapping("/add-multiplex")
    public String addMultiplex(@RequestParam("multiplexName") String name,
            @RequestParam("multiplexLocation") String location) {
        Users user = (Users) session.getAttribute("user");
        if (user.getId() > 0) {
            Multiplexes multiplex = new Multiplexes();
            multiplex.setName(name);
            multiplex.setAddress(location);
            String url = "http://localhost:3080/add-multiplex/" + user.getId();
            ResponseEntity<Void> response = restTemplate.postForEntity(url, multiplex, Void.class);
        }
        return "redirect:/owner/dashboard";
    }

    @GetMapping("manage-multiplex/{id}")
    public String openManage(@PathVariable("id") long multiplexId, Model model) {
        String url = "http://localhost:3080/get-multiplex/" + multiplexId;
        System.out.println(url);
        ResponseEntity<Multiplexes> response = restTemplate.getForEntity(url, Multiplexes.class);
        System.out.println(response.getBody());
        model.addAttribute("multiplex", response.getBody());
        String url1 = "http://localhost:3080/screen-multiplex/" + multiplexId;
        System.out.println(url1);
        model.addAttribute("multiplexId", multiplexId);
        ResponseEntity<Screens[]> response1 = restTemplate.getForEntity(url1, Screens[].class);
        model.addAttribute("screens", response1.getBody());

        return "owner/manageOwnerMultiplex";
    }

    @PostMapping("/add-screen/{id}")
    public String addScreen(@PathVariable("id") long multiplexId,
            @RequestParam("screenName") String screenName,
            @RequestParam("screenCapacity") String screenCapacity) {
        Screens screen = new Screens();
        screen.setName(screenName);
        screen.setCapacity(Integer.parseInt(screenCapacity));
        String url = "http://localhost:3080/add-screen/" + multiplexId;
        ResponseEntity<Void> response = restTemplate.postForEntity(url, screen, Void.class);
        return "redirect:/owner/manage-multiplex/" + multiplexId;
    }

    @GetMapping("/screen-seats/{id}")
    public String screenSeats(@PathVariable("id") long screenId, Model model) {
        String url = "http://localhost:3080/seats-screen/" + screenId;
        ResponseEntity<Seats[]> response = restTemplate.getForEntity(url, Seats[].class);
        String url1 = "http://localhost:3080/allMovies";
        ResponseEntity<Movies[]> responseMovie = restTemplate.getForEntity(url1, Movies[].class);
        model.addAttribute("moviesList", responseMovie.getBody());
        model.addAttribute("seats", response.getBody());
        model.addAttribute("screenId", screenId);
        return "owner/seatScreen";
    }

    @GetMapping("/manage-movies")
    public String manageMovies(Model model) {
        String url = "http://localhost:3080/allMovies";
        ResponseEntity<Movies[]> response = restTemplate.getForEntity(url, Movies[].class);
        model.addAttribute("movies", response.getBody());
        return "owner/manageMovies";
    }

    @PostMapping("/add-movie")
    public String addMovie(
            @RequestParam("title") String title,
            @RequestParam("synopsis") String synopsis,
            @RequestParam("cast") String cast,
            @RequestParam("trailerUrl") String trailerUrl,
            @RequestParam("rating") double rating,
            @RequestParam("releaseDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate releaseDate,
            @RequestParam("duration") Integer duration,
            @RequestParam("imdbId") String imdbId,
            @RequestParam("imageUrl") String imgUrl,
            Model model) {

        Movies movie = new Movies();
        movie.setTitle(title);
        movie.setSynopsis(synopsis);
        movie.setCast(cast);
        movie.setTrailerUrl(trailerUrl);
        movie.setRating(rating);
        movie.setReleaseDate(releaseDate);
        movie.setDuration(duration);
        movie.setCreatedAt(LocalDateTime.now());
        movie.setImageUrl(imgUrl);
        movie.setImdbId(imdbId);
        String url = "http://localhost:3080/add-movie";
        ResponseEntity<Movies> response = restTemplate.postForEntity(url, movie, Movies.class);

        return "redirect:/owner/manage-movies";
    }

    @PostMapping("/getBookedSeats")
    public String getBookedSeats(
            @RequestParam("bookingDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
            @RequestParam("timeSlot") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime time,
            @RequestParam("screenId") long screenId,
            Model model) {
        System.out.println("Booking Date: " + date + " Booking Time: " + time + " ScreenId: " + screenId);
        String url = "http://localhost:3080/get-bookedseats/" + screenId + "/" + date + "/" + time;
        ResponseEntity<Seats[]> listSeats = restTemplate.getForEntity(url, Seats[].class);
        model.addAttribute("bookedSeats", listSeats.getBody());
        String url1 = "http://localhost:3080/seats-screen/" + screenId;
        ResponseEntity<Seats[]> response = restTemplate.getForEntity(url1, Seats[].class);
        model.addAttribute("seats", response.getBody());
        model.addAttribute("screenId", screenId);
        return "owner/seatScreen";
    }

    @PostMapping("/fetchAvailability")
    public String fetchAvailabality(@RequestParam("showtimeDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date, @RequestParam("screenId") long screenId, Model model) {
        model.addAttribute("screenId", screenId);
        String url = "http://localhost:3080/get-available-time-slots/" + screenId + "/" + date;
        ResponseEntity<LocalTime[]> response = restTemplate.getForEntity(url, LocalTime[].class);
        model.addAttribute("selectedDate", date);
        model.addAttribute("availableTimes", response.getBody());
        String url1 = "http://localhost:3080/allMovies";
        ResponseEntity<Movies[]> response1 = restTemplate.getForEntity(url1, Movies[].class);
        model.addAttribute("movies", response1.getBody());
        return "owner/addShowtime";
    }

    @PostMapping("/addShowtime")
    public String addShowtime(@RequestParam("screenId") Long screenId,
            @RequestParam("showDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate showDate,
            @RequestParam("showTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime showTime,
            @RequestParam("movieId") Long movieId,
            @RequestParam("price") Double basePrice,
            Model model) {

        Showtimes showtime = new Showtimes();
        showtime.setShowDate(showDate);
        showtime.setShowTime(showTime);
        showtime.setPrice(basePrice);
        String url = "http://localhost:3080/add-showtime/" + screenId + "/" + movieId;
        ResponseEntity<Showtimes> response = restTemplate.postForEntity(url, showtime, Showtimes.class);
        return "redirect:/owner/manage-shows/" + screenId;
    }

    @GetMapping("/manage-bookings")
    public String manageBooking(Model model) {
        String url1 = "http://localhost:3080/allMovies";
        ResponseEntity<Movies[]> response1 = restTemplate.getForEntity(url1, Movies[].class);
        model.addAttribute("movies", response1.getBody());
        return "owner/manageBooking";
    }
    @PostMapping("/selectMovie")
    public String selectMovie(@RequestParam("movieId") long movieId, Model model) {
        String url = "http://localhost:3080/allMultiplex";
        ResponseEntity<Multiplexes[]> response = restTemplate.getForEntity(url, Multiplexes[].class);
        model.addAttribute("multiplexes", response.getBody());
        model.addAttribute("movieId",movieId);
        return "owner/selectMultiplex";
    }
    @PostMapping("/selectShowtime")
    public String selectShowtime(@RequestParam("multiplexId") long multiplexId,@RequestParam("showDate")  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate showDate, @RequestParam("showTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)  LocalTime showTime, @RequestParam("movieId") long movieId, Model model, HttpSession session) {
       System.out.print("Multiplex Id: "+ multiplexId + " Show Date: "+showDate+" Show Time: "+showTime+ " Movie Id: "+movieId);
       String url = "http://localhost:3080/makeBookingLoadSeats/"+multiplexId+"/"+movieId+"/"+showDate+"/"+showTime;
       System.out.println(url);
       Users user = (Users) session.getAttribute("user");
       ResponseEntity<SeatsBooked> response = restTemplate.getForEntity(url, SeatsBooked.class);
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
       return "owner/bookSeats";
    }
    @GetMapping("/billBooking/{id}")
    public String invoiceGenerator(@PathVariable("id") long id,Model model) {
        String url = "http://localhost:3080/getBookingById/"+id;
        ResponseEntity<Bookings> response = restTemplate.getForEntity(url, Bookings.class);
        model.addAttribute("bookings",response.getBody());
        String encodedUrl = "http://localhost:8080/owner/billBooking/"+id;
        model.addAttribute("encodedUrl",encodedUrl);
        return "owner/billBooking";
    }
    
    @GetMapping("/manage-shows/{id}")
    public String manageShows(@PathVariable("id") long id, Model model) {
        String url = "http://localhost:3080/getAllScreenId/"+id;
        ResponseEntity<Showtimes[]> response = restTemplate.getForEntity(url, Showtimes[].class);
        model.addAttribute("allShows",response.getBody());
        String url1 = "http://localhost:3080/allMovies";
        ResponseEntity<Movies[]> response1 = restTemplate.getForEntity(url1, Movies[].class);
        model.addAttribute("movies", response1.getBody());
        model.addAttribute("screenId",id);
        return "owner/manageShows";
    }
    
    @PostMapping("/load-timings")
    public String loadTimings(@RequestParam("showDate") LocalDate showDate, @RequestParam("movieId") Long movieId, Model model ) {
        String url = "http://localhost:3080/findshowbyMovieIdandDate/"+movieId+"/"+showDate;
        ResponseEntity<MovieTime[]> response = restTemplate.getForEntity(url, MovieTime[].class); 
        model.addAttribute("movieTime",response.getBody()); 
        model.addAttribute("movieId", movieId);
        model.addAttribute("showDate", showDate);
        return "owner/loadTimings";
    }
    
    @GetMapping("/reports")
    public String loadReports(){
        return "owner/viewReports";
    }
    @PostMapping("/get-report")
    public String getReport(@RequestParam("showDate") LocalDate date, Model model) {
        ResponseEntity<Bookings[]> response = restTemplate.getForEntity("http://localhost:3080/reports/"+date, Bookings[].class);
        model.addAttribute("bookings", response.getBody());
        return "owner/viewReports";
    }
    @GetMapping("/manage-users")
    public String manageUsers(Model model) {
        Users user = (Users) session.getAttribute("user");
        String url = "http://localhost:3080/multiplex-owner/" + user.getId();
        ResponseEntity<Multiplexes[]> response = restTemplate.getForEntity(url, Multiplexes[].class);
        model.addAttribute("multiplexes", response.getBody());
        ResponseEntity<Users[]> response1 = restTemplate.getForEntity("http://localhost:3080/getAdmins", Users[].class);
        model.addAttribute("users", response1.getBody());
        return "owner/manageUsers";
    }
    @PostMapping("/add-user")
    public String addUser(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("email") String email,
            @RequestParam("role") String role,
            @RequestParam List<Long> multiplexIds) {
            Users u = new Users();
            u.setUsername(username);
            u.setPassword(password);
            u.setEmail(email);
            u.setRole(role);
        userRepository.registerUserWithadmin(u, multiplexIds);

        return "redirect:/owner/manage-users";
    }
    @GetMapping("/manage-vouchers")
    public String manageVouchers(Model model) {
        ResponseEntity<Vouchers[]> response = restTemplate.getForEntity("http://localhost:3080/getAllVouchers", Vouchers[].class);
        model.addAttribute("vouchers", response.getBody());
        return "owner/addVoucher";
    }
    @PostMapping("/add-voucher")
    public String addVoucher(@RequestParam String type,
                             @RequestParam double value,
                             @RequestParam double minimumSpend,
                             @RequestParam LocalDate expirationDate) {
        String url = "http://localhost:3080/createVoucher";
        Vouchers voucher = new Vouchers();
        voucher.setType(type);
        voucher.setValue(value);
        voucher.setMinimumSpend(minimumSpend);
        voucher.setExpirationDate(expirationDate.atStartOfDay());
        ResponseEntity<Vouchers> response = restTemplate.postForEntity(url, voucher, Vouchers.class);
        return "redirect:/owner/manage-vouchers";
    }
    
}
