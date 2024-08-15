<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Seats" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Screen Seat Layout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        .seat {
            width: 40px;
            height: 40px;
            background-color: #28a745;
            color: #fff;
            display: inline-block;
            text-align: center;
            line-height: 40px;
            margin: 4px;
            cursor: pointer;
            position: relative;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .seat:hover {
            transform: scale(1.1);
        }
        .seat.booked {
            background-color: #dc3545;
        }
        .seat.empty {
            background-color: #e9ecef;
            color: #6c757d;
        }
        .seat:hover::before {
            content: attr(title);
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #000;
            color: #fff;
            padding: 4px 8px;
            border-radius: 3px;
            font-size: 12px;
            white-space: nowrap;
            z-index: 10;
        }
        .row-label {
            display: inline-block;
            width: 40px;
            text-align: center;
            margin-right: 5px;
            font-weight: bold;
            font-size: 16px;
        }
        .seat-row {
            text-align: center;
            margin-bottom: 30px;
        }
        .seat-row-divider {
            text-align: center;
    height: 50px;
    background-color: #dee2e6;
    margin: 20px 0;
        }
        .screen-ui {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }
        .screen-ui .screen {
            width: 100%;
            height: 80px;
            background-color: #343a40;
            color: #fff;
            text-align: center;
            line-height: 80px;
            border-radius: 5px;
            position: relative;
            margin-bottom: 2rem;
            font-size: 20px;
        }
        .modal-content {
            padding: 20px;
            border-radius: 8px;
        }
        .modal-header {
            border-bottom: none;
        }
        .modal-body {
            padding: 20px;
        }
        .staircase-divider {
    width: 0;
    height: 60px;
    border-left: 3px solid #007bff; 
    border-bottom: 3px solid #007bff; 
    margin-left: 40px; 
    position: absolute;
    top: 0;
    left: 0;
    transform: translateY(20px) rotate(-45deg); 
    border-radius: 0 0 10px 10px; 
    z-index: 1;
}

        .seat-row > .seat-container {
            position: relative;
            display: inline-block;
        }
        .btn-group-toggle .btn {
            border-radius: 20px;
            margin: 2px;
        }
    </style>
</head>
<body>
    <%@ include file="adminSidebar.jsp" %>
    <div class="container mt-5" style="margin-top: 5rem;">
        <h1 class="mt-4">Seat Layout for Screen</h1>
        
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#bookedSeatsModal">
            View Booked Seats
        </button>
        
        <div class="screen-ui">
            <div class="screen">Screen</div>
        </div>
        
        <div id="seat-layout">
            <%
                Seats[] seats = (Seats[]) request.getAttribute("seats");
                Seats[] bookedSeats = (Seats[]) request.getAttribute("bookedSeats");

                if (bookedSeats == null) {
                    bookedSeats = new Seats[0];
                }

                Set<Long> bookedSeatIds = new HashSet<>();
                for (Seats bookedSeat : bookedSeats) {
                    bookedSeatIds.add(bookedSeat.getId()); 
                }
                int index = 0;
                int seatsPerRow = 15;
                int numRows = (int) Math.ceil((double) seats.length / seatsPerRow);
                char rowLabel = 'A';
                int rowCounter = 0;

                while (rowCounter < numRows) {
                    out.print("<div class='seat-row'>");
                    out.print("<span class='row-label'>" + rowLabel + "</span>");
                    for (int j = 0; j < seatsPerRow; j++) {
                        int seatIndex = rowCounter * seatsPerRow + j;
                        if (seatIndex < seats.length) {
                            Seats seat = seats[seatIndex];
                            String seatClass = bookedSeatIds.contains(seat.getId()) ? "seat booked" : "seat empty";
                            String seatHtml = String.format("<div class='%s' title='Seat %d'>%d</div>", seatClass, seat.getSeatNumber(), seat.getSeatNumber());
                            out.print(seatHtml);
                            index++;
                        }
                    }
                    out.print("</div>");
                    if (rowCounter == numRows - 2) {
                        out.print("<div class='seat-row-divider'></div>");
                    }
                    rowLabel++;
                    rowCounter++;
                }
            %>
        </div>
    </div>

    <div class="modal fade" id="bookedSeatsModal" tabindex="-1" role="dialog" aria-labelledby="bookedSeatsModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookedSeatsModalLabel">View Booked Seats</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="bookedSeatsForm" action="/admin/getBookedSeats" method="post">
                        <input type="hidden" id="screenId" name="screenId" value="<%= request.getAttribute("screenId") %>">
                        <div class="form-group">
                            <label for="bookingDate">Date</label>
                            <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                        </div>
                        <div class="form-group">
                            <label>Time Slot</label>
                            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                    <input type="radio" name="timeSlot" id="timeSlot1" value="10:00"> 10:00 AM
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="timeSlot" id="timeSlot2" value="12:00"> 12:00 PM
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="timeSlot" id="timeSlot3" value="16:00"> 4:00 PM
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="timeSlot" id="timeSlot4" value="19:00"> 7:00 PM
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="timeSlot" id="timeSlot5" value="22:00"> 10:00 PM
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">View Booked Seats</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
