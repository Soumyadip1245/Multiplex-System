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
        .seat {
        width: 40px;
        height: 40px;
        background-color: #e9ecef;
        color: #6c757d;
        display: inline-block;
        text-align: center;
        line-height: 40px;
        margin: 4px;
        cursor: pointer;
        position: relative;
        border-radius: 4px;
        transition: background-color 0.3s, transform 0.3s;
        z-index: 1;
        }
        .seat:hover {
        transform: scale(1.1);
        }
        .seat.selected {
        background-color: rgb(88, 158, 252);
        color: #fff;
        }
        .seat.unavailable {
        background-color: #dc3545;
        color: #fff;
        pointer-events: none;
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
        justify-content: center;
        align-items: center;
        text-align: center;
        margin-bottom: 30px;
        }
        .seat-row-divider {
        text-align: center;
        height: 50px;
        background-color: #ffffff;
        margin: 20px 0;
        }
        .seat-floor{
           background-color: #ffffff;
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
        .seat-row {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        }
        .row-label {
        width: 30px;
        text-align: right;
        padding-right: 10px;
        }
        .seat-divider {
   width: 70px;
   height: 40px;
   background-color: #ffffff;
   margin: 0 10px;
   position: relative;
   z-index: -1;
}
.seat-divider .text-content{
   text-align: center;
   font-weight: bold;
}
.seat-row:not(:first-child) .seat-divider::before {
   content: '';
   position: absolute;
   width: 70px;
   height: 20px;
   background-color: #ffffff;
   left: 0;
   top: -20px; 
}

.seat-row:not(:last-child) .seat-divider::after {
   content: '';
   position: absolute;
   width: 70px;
   height: 20px;
   background-color: #ffffff;
   left: 0;
}
.seat-indicators {
   display: flex;
   justify-content: center;
   align-items: center;
   margin-top: 20px;
   font-weight: bold;
}

.seat-indicator {
   display: flex;
   align-items: center;
   margin: 2px 15px 20px 15px;
   font-size: 16px;
}
.seat-staircase{
   background-color: #ffffff;
}
.seat.gold {
   background-color: gold;
   color: black;
}

.seat.platinum {
   background-color: #a0a09e; 
   color: white;
}
     </style>
</head>
<body>
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container mt-5" style="margin-top: 5rem;">
        <h1 class="mt-4">Seat Layout for Screen</h1>
        
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#bookedSeatsModal">
            View Booked Seats
        </button>
        
        <div class="screen-ui">
            <div class="screen">Screen</div>
        </div>
        <div class="seat-indicators">
            <div class="seat-indicator">
                <div class="seat available"></div>
                <span>Available</span>
            </div>
            <div class="seat-indicator">
                <div class="seat unavailable"></div>
                <span>Unavailable</span>
            </div>
            <div class="seat-indicator">
                <div class="seat selected"></div>
                <span>Selected</span>
            </div>
            <div class="seat-indicator">
                <div class="seat gold"></div>
                <span>Gold Reserved</span>
            </div>
            <div class="seat-indicator">
                <div class="seat platinum"></div>
                <span>Platinum Reserved</span>
            </div>
          
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
                            String seatClass = "seat available";
                
                if (bookedSeatIds.contains(seat.getId())) {
                    seatClass = "seat unavailable";
                } else if (seat.isGold()) {
                    seatClass = "seat gold";
                } else if (seat.isPlatinum()) {
                    seatClass = "seat platinum";
                }
                            String seatHtml = String.format("<div class='%s' title='Seat %d'>%d</div>", seatClass, seat.getSeatNumber(), seat.getSeatNumber());
                            out.print(seatHtml);
                            index++;
                        }
                        if ((j == 3 || j == 11) && !(rowCounter == numRows - 1)) {
                            out.print("<div class='seat-divider'></div>");
                        }
                    }
                    out.print("</div>");
                    if (rowCounter == 4 || rowCounter == 7 || rowCounter == numRows - 2) {
                        String sectionLabel = "";
                        if (rowCounter == 4) {
                            sectionLabel = "Normal Seats";
                        } else if (rowCounter == 7) {
                            sectionLabel = "Premium Seats";
                        } else {
                            sectionLabel = "Recliners";
                        }
                        out.print("<h4 class='text-center'>" + sectionLabel + "</h4>");
                    }
            
                    if (rowCounter == numRows - 2) {
                        out.print("<div class='seat-divider'></div>");
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
                    <form id="bookedSeatsForm" action="/owner/getBookedSeats" method="post">
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
