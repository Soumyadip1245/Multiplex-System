<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.view_controller.entity.Bookings" %>
<%@ page import="com.example.view_controller.entity.BookingDetails" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Multiplex Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card-header {
            background-color: #f8f9fa;
        }
        .card-body {
            background-color: #ffffff;
        }
        .card-title {
            font-size: 1.25rem;
        }
        .summary-card {
            cursor: pointer;
            transition: transform 0.2s;
        }
        .summary-card:hover {
            transform: scale(1.05);
        }
        .booking-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .list-group-item {
            border: none;
        }
    </style>
</head>
<body>
    <%@ include file="userSidebar.jsp" %>
    <%
    Bookings[] bookings = (Bookings[]) request.getAttribute("bookings");

    int totalBookings = 0;
    double totalRevenue = 0.0;
    Set<Long> uniqueUsers = new HashSet<>();
    Map<String, Integer> movieCounts = new HashMap<>();
    
    if (bookings != null) {
        for (Bookings booking : bookings) {
            totalBookings++;
            totalRevenue += booking.getTotalPrice();
            uniqueUsers.add(booking.getUser().getId());
            
            String movieTitle = booking.getShowtime().getMovie().getTitle();
            movieCounts.put(movieTitle, movieCounts.getOrDefault(movieTitle, 0) + 1);
        }
    }

    String mostPopularMovie = bookings != null && !movieCounts.isEmpty() ?
        Collections.max(movieCounts.entrySet(), Map.Entry.comparingByValue()).getKey() : "N/A";
    
    %>

    <div class="container mt-5">
        <h1 class="text-center mb-4">Your Bookings</h1>
        
       


        <div id="reportContainer" class="mt-5">
            <% if (bookings == null || bookings.length == 0) { %>
                <div class='alert alert-warning'>No bookings available.</div>
            <% } else { %>
                <div class="row">
                    <% int count = 0; %>
                    <% for (Bookings b : bookings) { %>
                        <div class="col-md-6 mb-4">
                            <div class="card booking-card">
                                <div class="card-header">
                                    <h5 class="card-title">Booking ID: <%= b.getId() %></h5>
                                    <p class="card-text">User: <%= b.getUser().getUsername() %> (<%= b.getUser().getEmail() %>)</p>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Movie: <%= b.getShowtime().getMovie().getTitle() %></h5>
                                    <p class="card-text">Showtime: <%= b.getShowtime().getShowDate() %> <%= b.getShowtime().getShowTime() %></p>
                                    <p class="card-text">Screen: <%= b.getShowtime().getScreen().getName() %> (<%= b.getShowtime().getScreen().getMultiplexes().getName() %> - <%= b.getShowtime().getScreen().getMultiplexes().getAddress() %>)</p>
                                    <p class="card-text">Total Price: ₹<%= b.getTotalPrice() %></p>
                                    <h6 class="mb-3">Seats:</h6>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">Row</th>
                                                <th scope="col">Seat</th>
                                                <th scope="col">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (BookingDetails detail : b.getBookingDetails()) { %>
                                                <tr>
                                                    <td><%= detail.getSeat().getRowNum() %></td>
                                                    <td><%= detail.getSeat().getSeatNumber() %></td>
                                                    <td>₹<%= detail.getPrice() %></td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                        </div>
                        <% if (++count % 2 == 0) { %> </div><div class="row"> <% } %>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
