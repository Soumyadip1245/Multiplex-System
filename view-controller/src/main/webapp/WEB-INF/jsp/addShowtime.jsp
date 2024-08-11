<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Seats" %>
<%@ page import="com.example.view_controller.entity.Movies" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Showtime</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container mt-5">
        <h1 class="mt-4">Add Showtime for <%= request.getAttribute("selectedDate") %></h1>
        <form action="/owner/addShowtime" method="post">
            <input type="hidden" id="screenId" name="screenId" value="<%= request.getAttribute("screenId") %>">
            <input type="hidden" id="showDate" name="showDate" value="<%= request.getAttribute("selectedDate") %>">
            
           
            
            <!-- Time Slot Dropdown -->
            <div class="form-group">
                <label for="showTime">Select Showtime</label>
                <select class="form-control" id="showTime" name="showTime" required>
                    <option value="" disabled selected>Select a time slot</option>
                    <% 
                        LocalTime[] availableTimes = (LocalTime[]) request.getAttribute("availableTimes");
                        if (availableTimes != null) {
                            for (LocalTime time : availableTimes) {
                    %>
                        <option value="<%= time %>"><%= time %></option>
                    <% 
                            } 
                        } else {
                    %>
                        <option value="" disabled>No time slots available</option>
                    <% 
                        } 
                    %>
                </select>
            </div>
            
            <!-- Movie Dropdown -->
            <div class="form-group">
                <label for="movieSelect">Select Movie</label>
                <select class="form-control" id="movieSelect" name="movieId" required>
                    <option value="" disabled selected>Select a movie</option>
                    <% 
                        Movies[] movies = (Movies[]) request.getAttribute("movies");
                        if (movies != null) {
                            for (Movies movie : movies) {
                    %>
                        <option value="<%= movie.getId() %>"><%= movie.getTitle() %></option>
                    <% 
                            } 
                        } else {
                    %>
                        <option value="" disabled>No movies available</option>
                    <% 
                        } 
                    %>
                </select>
            </div>
            
            <!-- Base Price Input -->
            <div class="form-group">
                <label for="basePrice">Base Price</label>
                <input type="number" class="form-control" id="basePrice" name="price" step="0.01" required>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Add Showtime</button>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
