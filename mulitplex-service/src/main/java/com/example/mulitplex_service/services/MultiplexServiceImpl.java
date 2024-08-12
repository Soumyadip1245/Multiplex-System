package com.example.mulitplex_service.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.mulitplex_service.entity.BookingDetails;
import com.example.mulitplex_service.entity.Bookings;
import com.example.mulitplex_service.entity.Movies;
import com.example.mulitplex_service.entity.Multiplexes;
import com.example.mulitplex_service.entity.Screens;
import com.example.mulitplex_service.entity.SeatLog;
import com.example.mulitplex_service.entity.Seats;
import com.example.mulitplex_service.entity.Showtimes;
import com.example.mulitplex_service.entity.Users;
import com.example.mulitplex_service.repository.BookingDetailRepository;
import com.example.mulitplex_service.repository.BookingRepository;
import com.example.mulitplex_service.repository.MovieRepository;
import com.example.mulitplex_service.repository.MultiplexRepository;
import com.example.mulitplex_service.repository.ScreenRepository;
import com.example.mulitplex_service.repository.SeatLogRepository;
import com.example.mulitplex_service.repository.SeatsRepository;
import com.example.mulitplex_service.repository.ShowtimeRepository;
import com.example.mulitplex_service.repository.UserRepository;
import com.example.mulitplex_service.utils.EmailDetails;
import com.example.mulitplex_service.utils.MovieTime;
import com.example.mulitplex_service.utils.SeatsBooked;

import jakarta.mail.internet.MimeMessage;
import jakarta.transaction.Transactional;

@Service
public class MultiplexServiceImpl implements MultiplexService {

    @Autowired
    private MultiplexRepository multiplexRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ScreenRepository screenRepository;
    @Autowired
    private SeatsRepository seatRepository;
    @Autowired
    private ShowtimeRepository showtimeRepository;
    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private BookingDetailRepository bookingdetailRepository;
    @Autowired
    private SeatLogRepository seatLogRepository;
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${spring.mail.username}") private String sender;
    private static final List<LocalTime> predefinedTimeSlots = Arrays.asList(
            LocalTime.of(10, 0),
            LocalTime.of(12, 0),
            LocalTime.of(16, 0),
            LocalTime.of(19, 0),
            LocalTime.of(22, 0)
    );

    @Override
    public Multiplexes createMultiplexes(Multiplexes multiplex, long ownerId) {
        System.out.println(ownerId);
        Users user = userRepository.findById(ownerId).orElse(null);
        multiplex.setCreatedAt(LocalDateTime.now());
        multiplex.setOwner(user);
        multiplexRepository.save(multiplex);
        return multiplex;
    }

    @Override
    public List<Multiplexes> getAllMultiplexesByOwnerId(Long ownerId) {
        List<Multiplexes> m = multiplexRepository.findByOwnerId(ownerId);
        return m;
    }

    @Override
    public Screens createScreens(Screens screen, long multiplexId) {
        Multiplexes m = multiplexRepository.findById(multiplexId).orElse(null);
        screen.setMultiplexes(m);
        screen.setCreatedAt(LocalDateTime.now());
        Screens s = screenRepository.save(screen);
        createSeats(s);
        return screen;
    }

    public void createSeats(Screens screen) {
        int seatsPerRow = 15;
        int totalSeats = screen.getCapacity();
        int numberOfRows = (int) Math.ceil((double) totalSeats / seatsPerRow);

        List<Seats> seats = new ArrayList<>();
        for (int rowNum = 1; rowNum <= numberOfRows; rowNum++) {
            for (int seatNum = 1; seatNum <= seatsPerRow; seatNum++) {
                if ((rowNum - 1) * seatsPerRow + seatNum > totalSeats) {
                    break;
                }
                Seats seat = new Seats();
                seat.setRowNum(rowNum);
                seat.setSeatNumber(seatNum);
                seat.setScreen(screen);
                seats.add(seat);
            }
        }
        seatRepository.saveAll(seats);
    }

    @Override
    public List<Screens> getAllScreensByMultiplexId(Long multiplexId) {
        List<Screens> s = screenRepository.findByMultiplexId(multiplexId);
        return s;
    }

    @Override
    public List<Seats> getAllSeatsByScreen(Long screenId) {
        List<Seats> seats = seatRepository.findByScreenID(screenId);
        return seats;
    }

    @Override
    public Showtimes createShowtime(Showtimes showtime, long screenId, long movieId) {
        Screens screen = screenRepository.findById(screenId).orElse(null);
        Movies movie = movieRepository.findById(movieId).orElse(null);
        showtime.setCreatedAt(LocalDateTime.now());
        showtime.setScreen(screen);
        showtime.setMovie(movie);
        return showtimeRepository.save(showtime);
    }

    @Override
    public Movies createMovies(Movies movie) {
        movie.setCreatedAt(LocalDateTime.now());
        return movieRepository.save(movie);
    }

    @Override
    public Multiplexes findMultiplexById(long id) {
        return multiplexRepository.findById(id).orElse(null);
    }

    @Override
    public List<LocalTime> getAvailableShowTimes(long screenId, LocalDate showDate) {
        List<Showtimes> existingShowtimes = showtimeRepository.findByScreenIdAndShowDate(screenId, showDate);
        List<LocalTime> bookedTimes = new ArrayList<>();
        for (Showtimes showtime : existingShowtimes) {
            bookedTimes.add(showtime.getShowTime());
        }
        System.out.println(bookedTimes);
        List<LocalTime> availableTimeSlots = new ArrayList<>();
        for (LocalTime slot : predefinedTimeSlots) {
            if (!bookedTimes.contains(slot)) {
                availableTimeSlots.add(slot);
            }
        }
        return availableTimeSlots;
    }

    @Override
    public List<Seats> showAllBookedSeatsForShowtime(long screenId, LocalDate selectedDate, LocalTime selectedTime) {
        List<Seats> bookedSeats = new ArrayList<>();
        Showtimes showtime = showtimeRepository.findShowByScreenIdDateTime(screenId, selectedDate, selectedTime);
        if (showtime == null) {
            return null;
        }
        List<Bookings> bookings = bookingRepository.getBookingByShowTimeId(showtime.getId());
        if (bookings == null || bookings.isEmpty()) {
            return null;
        }
        for (Bookings booking : bookings) {
            List<BookingDetails> bookingDetailsList = bookingdetailRepository.getBookingDetailsByBookingId(booking.getId());
            if (bookingDetailsList != null && !bookingDetailsList.isEmpty()) {
                for (BookingDetails bookingDetails : bookingDetailsList) {
                    bookedSeats.add(bookingDetails.getSeat());
                }
            } else {
                return null;
            }
        }

        return bookedSeats;
    }

    @Override
    public List<Movies> getAllMovies() {
        List<Movies> movieList = movieRepository.findAll();
        return movieList;
    }

    @Override
    public List<Multiplexes> getAllMultiplex() {
        List<Multiplexes> multiplexList = multiplexRepository.findAll();
        return multiplexList;
    }

    @Override
    public SeatsBooked makeBookingLoadSeats(long multiplexId, long movieId, LocalDate date, LocalTime time) {
        List<Screens> screenList = getAllScreensByMultiplexId(multiplexId);
        Showtimes availableShowtime = null;
        for (Screens s : screenList) {
            try {
                System.out.println(s.getId());
                System.out.print(s.getId() + "--" + date + "--" + time + "--" + movieId);
                List<Showtimes> st = showtimeRepository.findByScreenIdAndShowDateTime(s.getId(), date, time, movieId);
                if (st.size() != 0) {
                    availableShowtime = st.get(0);
                }
            } catch (Exception e) {
            }
        }
        System.out.print(availableShowtime);

        List<Seats> seatBooked = new ArrayList<>();
        if (availableShowtime != null) {
            try {
                seatBooked = showAllBookedSeatsForShowtime(availableShowtime.getScreen().getId(), date, time);
            } catch (Exception e) {
                // logger.error("Error fetching booked seats for screenId {}, date {}, time {}: {}", availableShowtime.get(0).getScreen().getId(), date, time, e.getMessage());
            }
        }
        List<Seats> allSeats = new ArrayList<>();
        allSeats = getAllSeatsByScreen(availableShowtime.getScreen().getId());

        SeatsBooked sb = new SeatsBooked();
        sb.setBookedSeats(seatBooked);
        sb.setAllSeats(allSeats);
        sb.setBasePrice(availableShowtime.getPrice());
        sb.setScreenId(availableShowtime.getScreen().getId());
        sb.setShowtimeId(availableShowtime.getId());
        return sb;
    }

    @Override
    public Movies getMovieById(long movieId) {
        return movieRepository.findById(movieId).orElse(null);
    }

    @Transactional
    @Override
    public String handleSeatClick(Long seatId, LocalDate showDate, LocalTime showTime, Long movieId, Long screenId, Long userId) {
        Optional<SeatLog> existingSeatLogOpt = seatLogRepository.findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(seatId, showDate, showTime, screenId, movieId);

        if (existingSeatLogOpt.isPresent()) {
            SeatLog existingSeatLog = existingSeatLogOpt.get();
            if (existingSeatLog.getUserId().equals(userId)) {
                seatLogRepository.deleteBySeatIdAndShowDateAndShowTimeAndUserIdAndScreenIdAndMovieId(seatId, showDate, showTime, screenId, movieId);
                return "Seat unselected successfully.";
            } else {
                return "Seat is already booked by another user.";
            }
        } else {
            LocalDateTime now = LocalDateTime.now();
            SeatLog newSeatLog = new SeatLog();
            newSeatLog.setSeatId(seatId);
            newSeatLog.setShowDate(showDate);
            newSeatLog.setShowTime(showTime);
            newSeatLog.setMovieId(movieId);
            newSeatLog.setScreenId(screenId);
            newSeatLog.setUserId(userId);
            newSeatLog.setLockedAt(now);
            newSeatLog.setExpiresAt(now.plusMinutes(2));

            seatLogRepository.save(newSeatLog);
            return "Seat selected successfully.";
        }
    }

    @Transactional
    @Scheduled(fixedRate = 120000000)
    public void deleteExpiredSeatLogs() {
        LocalDateTime now = LocalDateTime.now();
        seatLogRepository.deleteByExpiresAtBefore();
        System.out.println("Expired seat logs deleted at: " + now);
    }

    @Override
    public Bookings createBooking(Map<String, Object> payload) {
        Bookings bookings = new Bookings();

        // Handle totalPrice with type checking and conversion
        Object totalPriceObj = payload.get("totalPrice");
        if (totalPriceObj instanceof String) {
            bookings.setTotalPrice(Double.parseDouble((String) totalPriceObj));
        } else if (totalPriceObj instanceof Number) {
            bookings.setTotalPrice(((Number) totalPriceObj).doubleValue());
        } else {
            throw new IllegalArgumentException("Invalid type for totalPrice");
        }

        // Parse bookingDate
        bookings.setBookingDate(LocalDateTime.parse((String) payload.get("bookingDate")));

        // Fetch and set user
        Object userIdObj = payload.get("user_id");
        Users user;
        if (userIdObj instanceof String) {
            user = userRepository.findById(Long.parseLong((String) userIdObj)).orElse(null);
        } else if (userIdObj instanceof Number) {
            user = userRepository.findById(((Number) userIdObj).longValue()).orElse(null);
        } else {
            throw new IllegalArgumentException("Invalid type for user_id");
        }

        // Fetch and set showtime
        Object showtimeIdObj = payload.get("showtime_id");
        Showtimes showtime;
        if (showtimeIdObj instanceof String) {
            showtime = showtimeRepository.findById(Long.parseLong((String) showtimeIdObj)).orElse(null);
        } else if (showtimeIdObj instanceof Number) {
            showtime = showtimeRepository.findById(((Number) showtimeIdObj).longValue()).orElse(null);
        } else {
            throw new IllegalArgumentException("Invalid type for showtime_id");
        }

        bookings.setUser(user);
        bookings.setShowtime(showtime);

        // Process bookingDetails
        List<BookingDetails> bookingDetailsList = new ArrayList<>();
        List<Map<String, Object>> bookingDetails = (List<Map<String, Object>>) payload.get("bookingDetails");

        for (Map<String, Object> detail : bookingDetails) {
            BookingDetails bookingDetail = new BookingDetails();

            // Handle price with type checking and conversion
            Object priceObj = detail.get("price");
            if (priceObj instanceof String) {
                bookingDetail.setPrice(Double.parseDouble((String) priceObj));
            } else if (priceObj instanceof Number) {
                bookingDetail.setPrice(((Number) priceObj).doubleValue());
            } else {
                throw new IllegalArgumentException("Invalid type for price");
            }

            // Fetch and set seat
            Object seatIdObj = detail.get("seat_id");
            Seats seat;
            if (seatIdObj instanceof String) {
                seat = seatRepository.findById(Long.parseLong((String) seatIdObj)).orElse(null);
            } else if (seatIdObj instanceof Number) {
                seat = seatRepository.findById(((Number) seatIdObj).longValue()).orElse(null);
            } else {
                throw new IllegalArgumentException("Invalid type for seat_id");
            }

            bookingDetail.setSeat(seat);
            bookingDetail.setBooking(bookings);

            bookingDetailsList.add(bookingDetail);
        }
        bookings.setBookingDetails(bookingDetailsList);

      Bookings booking =  bookingRepository.save(bookings);
      sendSimpleMail(new EmailDetails(), booking.getId());
        return booking;
    }

    @Override
    public Bookings showBooking(long id) {
        Bookings b = bookingRepository.findById(id).orElse(null);
        return b;
    }

    @Override
    public List<Showtimes> getAllShowtimesByScreenId(long id) {
        List<Showtimes> showtimeList = showtimeRepository.findByScreenId(id);
        return showtimeList;
    }

    @Override
    public HashSet<LocalDate> findAllShowtimesDatesByMovieId(long movieId) {
        List<Showtimes> showtimeList = showtimeRepository.getShowstimeByMovieID(movieId);
        HashSet<LocalDate> dateList = new HashSet<>();
        for (Showtimes s : showtimeList) {
            dateList.add(s.getShowDate());
        }
        return dateList;
    }

    @Override
    public List<MovieTime> findallmultiplexwithTime(long movieId, LocalDate showDate) {
        Map<String, MovieTime> multiplexTimeMap = new HashMap<>();
        List<Showtimes> movietimealllist = showtimeRepository.getMovieIdAndShowdate(movieId, showDate);
        for (Showtimes s : movietimealllist) {
            Multiplexes multiplex = s.getScreen().getMultiplexes();
            String multiplexName = multiplex.getName();
            if (!multiplexTimeMap.containsKey(multiplexName)) {
                MovieTime mt = new MovieTime();
                mt.setMultiplex(multiplex);
                mt.setTimeSlot(new ArrayList<>());
                multiplexTimeMap.put(multiplexName, mt);
            }
            MovieTime movieTime = multiplexTimeMap.get(multiplexName);
            movieTime.getTimeSlot().add(s.getShowTime());
        }
        return new ArrayList<>(multiplexTimeMap.values());
    }

    @Override
    public List<Bookings> showReports(LocalDate date) {
        List<Bookings> r = bookingRepository.findAllByShowDate(date);
        return r;
    }

    @Override
    public List<Users> getAllAdmins() {
        return userRepository.findAdmins();
    }

    public String sendSimpleMail(EmailDetails details, long bookingId) {
    try {
        Bookings b = showBooking(bookingId);
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

        helper.setFrom(sender);
        helper.setTo(b.getUser().getEmail());
        helper.setSubject("Your invoice for movie: " + b.getShowtime().getMovie().getTitle() + " is confirmed.");
        helper.setText(getInvoice(b), true); 

        javaMailSender.send(mimeMessage);
        return "Mail Sent Successfully...";
    } catch (Exception e) {
        return "Error while Sending Mail";
    }
}

// Method to generate HTML invoice content
public String getInvoice(Bookings b) {
    String encodedUrl = "http://localhost:8080/owner/billBooking/"+b.getId();
    StringBuilder htmlContent = new StringBuilder();

    htmlContent.append("<!DOCTYPE html>")
               .append("<html>")
               .append("<head>")
               .append("<meta charset=\"UTF-8\">")
               .append("<title>Booking Invoice</title>")
               .append("<style>")
               .append("body { font-family: 'Arial', sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }")
               .append(".invoice-box { max-width: 900px; margin: 30px auto; padding: 40px; border: 1px solid #ddd; border-radius: 8px; background: #fff; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); }")
               .append(".invoice-box h2 { font-size: 28px; margin-bottom: 20px; color: #333; }")
               .append(".invoice-box table { width: 100%; line-height: 1.6; border-collapse: collapse; }")
               .append(".invoice-box table td { padding: 10px; vertical-align: top; color: #555; }")
               .append(".invoice-box table tr td:nth-child(2) { text-align: right; }")
               .append(".invoice-box table tr.top table td { padding-bottom: 20px; }")
               .append(".invoice-box table tr.heading td { background: #f9f9f9; border-bottom: 2px solid #ddd; font-weight: bold; color: #333; }")
               .append(".invoice-box table tr.item td { border-bottom: 1px solid #f1f1f1; }")
               .append(".invoice-box table tr.item.last td { border-bottom: none; }")
               .append(".invoice-box table tr.total td:nth-child(2) { border-top: 2px solid #ddd; font-weight: bold; color: #333; }")
               .append(".invoice-box img { max-width: 150px; margin-top: 20px; border: 1px solid #ddd; border-radius: 8px; }")
               .append(".invoice-box .footer { margin-top: 20px; font-size: 14px; color: #777; text-align: center; }")
               .append("</style>")
               .append("</head>")
               .append("<body>")
               .append("<div class=\"invoice-box\">")
               .append("<h2>Booking Invoice</h2>")
               .append("<table>")
               .append("<tr class=\"top\"><td colspan=\"2\"><table><tr>")
               .append("<td><strong>User Details:</strong><br>")
               .append("Name: ").append(b.getUser().getUsername()).append("<br>")
               .append("Email: ").append(b.getUser().getEmail()).append("</td>")
               .append("<td>Booking Date: ").append(b.getBookingDate()).append("<br>")
               .append("Invoice #: ").append(b.getId()).append("</td>")
               .append("</tr></table></td></tr>")
               .append("<tr class=\"heading\"><td>Movie Details</td><td></td></tr>")
               .append("<tr class=\"item\"><td>Movie: ").append(b.getShowtime().getMovie().getTitle()).append("</td>")
               .append("<td>Showtime: ").append(b.getShowtime().getShowDate()).append("</td></tr>")
               .append("<tr class=\"heading\"><td>Screen Details</td><td></td></tr>")
               .append("<tr class=\"item\"><td>Screen Name</td>")
               .append("<td>").append(b.getShowtime().getScreen().getName()).append("</td></tr>")
               .append("<tr class=\"heading\"><td>Seat</td><td>Price</td></tr>");

    for (BookingDetails detail : b.getBookingDetails()) {
        htmlContent.append("<tr class=\"item\">")
                   .append("<td>").append(detail.getSeat().getSeatNumber()).append(" (Row: ").append(detail.getSeat().getRowNum()).append(")</td>")
                   .append("<td>₹ ").append(detail.getPrice()).append("</td>")
                   .append("</tr>");
    }

    htmlContent.append("<tr class=\"total\"><td></td>")
               .append("<td>Total: ₹ ").append(String.format("%.2f", b.getTotalPrice())).append("</td>")
               .append("</tr></table>")
               .append("<div><h3>Scan QR Code to Access This Invoice</h3>")
               .append("<img src=\"https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=").append(encodedUrl)
               .append("\" alt=\"QR Code\"></div>")
               .append("<div class=\"footer\">Thank you for booking with us!</div>")
               .append("</div>")
               .append("</body>")
               .append("</html>");

    return htmlContent.toString();
}
}
