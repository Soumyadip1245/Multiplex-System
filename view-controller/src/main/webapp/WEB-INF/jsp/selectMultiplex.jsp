<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.view_controller.entity.Multiplexes" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Multiplex and Showtime</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="ownerSidebar.jsp" %>
    <%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
%>
<div class="container mt-8" style="margin-top: 7rem;">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</div>
<%
    }
%>

    <div class="container mt-5">
        <h1 class="mt-4 text-center">Select Multiplex and Showtime</h1>
        <form action="/owner/selectShowtime" method="post">
            <input type="hidden" name="movieId" value="<%= request.getAttribute("movieId") %>">
            <div class="form-group">
                <label for="multiplexSelect">Select Multiplex</label>
                <select class="form-control" id="multiplexSelect" name="multiplexId" required>
                    <option value="" disabled selected>Select a multiplex</option>
                    <%
                        Multiplexes[] multiplexes = (Multiplexes[]) request.getAttribute("multiplexes");
                        if (multiplexes != null) {
                            for (Multiplexes multiplex : multiplexes) {
                    %>
                        <option value="<%= multiplex.getId() %>"><%= multiplex.getAddress() %></option>
                    <%
                            }
                        } else {
                    %>
                        <option value="" disabled>No multiplexes available</option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <!-- Date Input -->
            <div class="form-group">
                <label for="showDate">Select Date</label>
                <input type="date" class="form-control" id="showDate" name="showDate" required>
            </div>

            <div class="form-group">
                <label>Time Slot</label>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary">
                        <input type="radio" name="showTime" id="timeSlot1" value="10:00"> 10:00 AM
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="showTime" id="timeSlot2" value="12:00"> 12:00 PM
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="showTime" id="timeSlot3" value="16:00"> 4:00 PM
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="showTime" id="timeSlot4" value="19:00"> 7:00 PM
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="showTime" id="timeSlot5" value="22:00"> 10:00 PM
                    </label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
