<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Seats" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Screen Seat Layout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
    </style>
</head>

<body>
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container mt-7" style="margin-top: 5rem;">
        <h1 class="mt-4">Seat Layout for Screen</h1>

        <!-- Screen UI -->
        <div class="screen-ui">
            <div class="screen">Screen</div>
        </div>

        <!-- Seat Layout -->
        <div id="seat-layout">
            <% 
            List<Seats> seats = (List<Seats>) request.getAttribute("seats");
            List<Seats> bookedSeats = (List<Seats>) request.getAttribute("bookedSeats");
            Double basePrice = (Double) request.getAttribute("basePrice");
            LocalDate showDate = (LocalDate) request.getAttribute("showDate");
            LocalTime showTime = (LocalTime) request.getAttribute("showTime");
            Long movieId = (Long) request.getAttribute("movieId");
            Long screenId = (Long) request.getAttribute("screenId");
            Long userId = (Long) request.getAttribute("userId");
            Long showtimeId = (Long) request.getAttribute("showtimeId");
            
            if (bookedSeats == null) {
                bookedSeats = new ArrayList<>();
            }

            Set<Long> bookedSeatIds = new HashSet<>();
            for (Seats bookedSeat : bookedSeats) {
                bookedSeatIds.add(bookedSeat.getId());
            }

            int seatsPerRow = 15;
            int numRows = (int) Math.ceil((double) seats.size() / seatsPerRow);
            char rowLabel = 'A';

            for (int row = 0; row < numRows; row++) {
                out.print("<div class='seat-row'>");
                out.print("<span class='row-label'>" + rowLabel + "</span>");
                for (int j = 0; j < seatsPerRow; j++) {
                    int seatIndex = row * seatsPerRow + j;
                    if (seatIndex < seats.size()) {
                        Seats seat = seats.get(seatIndex);
                        double seatPrice = basePrice + basePrice * (row + 1) / 100;
                        String seatClass = bookedSeatIds.contains(seat.getId()) ? "seat unavailable" : "seat available";
                        String seatHtml = String.format(
                            "<div class='%s' data-price='Price: ₹ %.2f' data-seat-id='%d' data-show-date='%s' data-show-time='%s' data-movie-id='%d' data-screen-id='%d' data-user-id='%s' title='Seat %d (₹ %.2f)' data-showtime-id='%d'>%d</div>",
                            seatClass, seatPrice, seat.getId(), showDate, showTime, movieId, screenId, userId, seat.getSeatNumber(), seatPrice, showtimeId, seat.getSeatNumber());                        
                        out.print(seatHtml);
                    }
                }
                out.print("</div>");
                if (row == numRows - 2) {
                    out.print("<div class='seat-row-divider'></div>");
                }
                rowLabel++;
            }
            %>
        </div>

        <!-- Confirm Button -->
        <div class="text-center mt-4">
            <button id="confirm-selection" class="btn btn-primary" disabled>Confirm Selection</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var selectedSeats = [];
            var selectedElements = [];

            document.querySelectorAll('.seat.available').forEach(function(seat) {
                seat.addEventListener('click', function() {
                    var seatElement = this;
                    var seatId = seatElement.getAttribute('data-seat-id');
                    var showDate = seatElement.getAttribute('data-show-date');
                    var showTime = seatElement.getAttribute('data-show-time');
                    var movieId = seatElement.getAttribute('data-movie-id');
                    var screenId = seatElement.getAttribute('data-screen-id');
                    var userId = seatElement.getAttribute('data-user-id');
                    var url = seatId + "/" + showDate + "/" + showTime + "/" + movieId + "/" + screenId + "/" + userId;

                    fetch("http://localhost:3080/click/" + url)
                        .then(response => response.text())
                        .then(data => {
                            if (data === 'Seat selected successfully.') {
                                seatElement.classList.remove('available');
                                seatElement.classList.add('selected');
                                selectedSeats.push(seatId);
                                selectedElements.push(seatElement); // Store the actual element
                            } else if (data === 'Seat is already booked by another user.') {
                                seatElement.classList.remove('available');
                                seatElement.classList.add('unavailable');
                                alert('Seat is already booked by another user.');
                            } else if (data === 'Seat unselected successfully.') {
                                seatElement.classList.remove('selected');
                                seatElement.classList.add('available');
                                selectedSeats = selectedSeats.filter(id => id !== seatId);
                                selectedElements = selectedElements.filter(element => element !== seatElement);
                            }
                            document.getElementById('confirm-selection').disabled = selectedSeats.length === 0;
                        })
                        .catch(error => console.error('Error:', error));
                });
            });

            document.getElementById('confirm-selection').addEventListener('click', function() {
                var confirmUrl = "http://localhost:3080/createBooking";
                
                var bookingDetails = selectedElements.map(seatElement => {
                    var seatId = seatElement.getAttribute('data-seat-id');
                    return {
                        seat_id: seatId,
                price: parseFloat(seatElement.getAttribute('data-price').replace('Price: ₹ ', ''))
                    };
                });

        if (bookingDetails.length === 0) {
            alert('No valid seats selected.');
            return;
        }
        var rzpyUrl = "http://localhost:3080/payment/"+ (bookingDetails.reduce((total, seat) => total + seat.price, 0))*100
        console.log(rzpyUrl)
        fetch(rzpyUrl, {
                method: 'GET',
            })
            .then(response => response.text())
            .then(data => {
                var options = {
            "key": "rzp_test_RYaOC10U6IjI9N", 
            "amount": (bookingDetails.reduce((total, seat) => total + seat.price, 0))*100,
            "currency": "INR",
            "name": "Movie Booking",
            "description": "Book your movie ticket",
            "image": "/your_logo.png",
            "order_id": data, 
            "handler": function (response) {
                var confirmUrl = "http://localhost:3080/createBooking";
                 var payload = {
            totalPrice: bookingDetails.reduce((total, seat) => total + seat.price, 0),
            bookingDate: selectedElements[0].getAttribute('data-show-date') + 'T' + selectedElements[0].getAttribute('data-show-time'),
            showtime_id: (selectedElements[0].getAttribute('data-showtime-id')),
            user_id: parseInt(selectedElements[0].getAttribute('data-user-id')),
            bookingDetails: bookingDetails
        };

                fetch(confirmUrl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
            body: JSON.stringify(payload)
                })
        .then(response => response.json())
                .then(data => {
            console.log(data.id)
           window.location.href = `/owner/billBooking/`+data.id;
                })
                .catch(error => console.error('Error:', error));
            },
            "prefill": {
                "name": "User Name",
                "email": "user@example.com",
                "contact": "9999999999"
            },
            "notes": {
                "address": "Movie Address"
            },
            "theme": {
                "color": "#3399cc"
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.open();
    })
            })
            })
    
       


    </script>
</body>

</html>