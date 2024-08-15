<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.view_controller.utils.MovieTime" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showtimes List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .multiplex-card {
            margin-bottom: 1rem;
        }

        .card-header {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .time-slot-btn {
            margin: 0.25rem;
            border: 1px solid #007bff;
            color: #007bff;
            background-color: white;
        }

        .time-slot-btn:hover {
            background-color: #007bff;
            color: white;
        }

        .proceed-btn {
            position: fixed;
            bottom: 1rem;
            right: 1rem;
        }
    </style>
</head>

<body>
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container mt-7" style="margin-top: 5rem;">
        <h1 class="text-center mb-4">Available Showtimes</h1>
        <div class="row">
            <% 
                LocalDate showDate = (LocalDate) request.getAttribute("showDate");
                Long movieId = (Long) request.getAttribute("movieId");
                MovieTime[] multiplexList = (MovieTime[]) request.getAttribute("movieTime");
                if (multiplexList != null) {
                    for (MovieTime movieTime : multiplexList) {
                        String multiplexName = movieTime.getMultiplex().getName();
                        String multiplexAddress = movieTime.getMultiplex().getAddress();
                        List<LocalTime> timeSlots = movieTime.getTimeSlot();
            %>
                <div class="col-md-12">
                    <div class="card multiplex-card shadow-sm">
                        <div class="card-header">
                            <%= multiplexName %> <small class="text-muted">(<%= multiplexAddress %>)</small>
                        </div>
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <% for (LocalTime timeSlot : timeSlots) { %>
                                    <button class="btn btn-primary time-slot-btn" 
                                            data-multiplex-id="<%= movieTime.getMultiplex().getId() %>"
                                            data-show-date="<%= showDate %>" 
                                            data-movie-id="<%= movieId %>" 
                                            data-time="<%= timeSlot %>">
                                        <%= timeSlot %>
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            <% 
                    }
                } 
            %>
        </div>
        <div class="text-right proceed-btn">
            <button class="btn btn-primary" id="proceedBtn" disabled>Proceed</button>
        </div>
    </div>

    <form id="showtimeForm" action="/owner/selectShowtime" method="post" style="display: none;">
        <input type="hidden" id="multiplexId" name="multiplexId">
        <input type="hidden" id="showDate" name="showDate">
        <input type="hidden" id="movieId" name="movieId">
        <input type="hidden" id="showTime" name="showTime">
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const buttons = document.querySelectorAll('.time-slot-btn');
            const proceedBtn = document.getElementById('proceedBtn');
            const form = document.getElementById('showtimeForm');

            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    const multiplexId = this.getAttribute('data-multiplex-id');
                    const showDate = this.getAttribute('data-show-date');
                    const movieId = this.getAttribute('data-movie-id');
                    const showTime = this.getAttribute('data-time');
                    document.getElementById('multiplexId').value = multiplexId;
                    document.getElementById('showDate').value = showDate;
                    document.getElementById('movieId').value = movieId;
                    document.getElementById('showTime').value = showTime;
                    proceedBtn.disabled = false;
                });
            });

            proceedBtn.addEventListener('click', function () {
                form.submit();
            });
        });
    </script>
</body>

</html>
