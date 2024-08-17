<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Seats" %>
<%@ page import="com.example.view_controller.entity.Users" %>
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
      <%@ include file="userSidebar.jsp" %>
      <div id="loader" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.8); z-index: 1050; text-align: center; justify-content: center; align-items: center;">
         <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem; margin-top: 20%;">
            <span class="sr-only">Processing...</span>
         </div>
         <h4>Processing your booking, please wait...</h4>
      </div>
      <div class="container mt-7" style="margin-top: 5rem;">
         <h1 class="mt-4">Seat Layout for Screen</h1>
         <!-- Screen UI -->
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
        
         <!-- Seat Layout -->
         <div id="seat-layout">
            <%
            String membershipType = (String) request.getAttribute("membershipType");
            System.out.print(membershipType);
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
            int totalSeats = seats.size();
            double bookedPercentage = (double) bookedSeats.size() / totalSeats * 100;
            boolean applySurge = bookedPercentage > 50;
            double surgePercentage = applySurge ? 0.20 : 0.0;
            double extraPremium = 0.20;
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
                        double seatPrice;
                        if (row < 5) {
                            seatPrice = basePrice; // Economic (rows 1-5)
                        } else if (row < 8) {
                            seatPrice = basePrice * 1.2; // Regular (rows 6-8) with 20% premium
                        } else {
                            seatPrice = basePrice * 1.5; // Premium (rows 8+) with 50% premium
                        }
                        if (row == numRows - 1) {
                            seatPrice += seatPrice * extraPremium;
                        }
                        
                        String tooltipText = "Price: ₹ " + seatPrice;
                        String seatClass = "seat available";
                        String membershipClass = membershipType;
                        if(membershipType.equals("GOLD")){
                            seatPrice += seatPrice * surgePercentage;
                            seatPrice -= seatPrice * 0.40;
                            tooltipText = "Price: ₹ " + seatPrice;
                        }
                        else if(membershipType.equals("PLATINUM")){
                            seatPrice += seatPrice * surgePercentage;
                            seatPrice -= seatPrice * 0.20; 
                            tooltipText = "Price: ₹ " + seatPrice;
                        }
                        else{
                            seatPrice += seatPrice * surgePercentage;
                            tooltipText = "Price: ₹ " + seatPrice;
                        }
                        
                        if (bookedSeatIds.contains(seat.getId())) {
                            seatClass = "seat unavailable";
                        } else if (seat.isGold()) {
                            seatClass = "seat gold";
                            if (!membershipType.equals("GOLD")) {
                                seatClass += " non-hoverable";
                                tooltipText = "This seat is reserved for Gold members only";
                            }
                           
                        } else if (seat.isPlatinum()) {
                            seatClass = "seat platinum";
                            if (!membershipType.equals("PLATINUM")) {
                                seatClass += " non-hoverable";
                                tooltipText = "This seat is reserved for Platinum members only";
                            }
                        }
                        System.out.println(tooltipText);
                        String seatHtml = String.format(
                            "<div class='%s' data-price='Price: ₹ %.2f' data-seat-id='%d' data-show-date='%s' data-show-time='%s' data-movie-id='%d' data-screen-id='%d' data-user-id='%s' title='%s' data-membership = '%s' data-showtime-id='%d'>%d</div>",
                            seatClass, seatPrice, seat.getId(), showDate, showTime, movieId, screenId, userId, tooltipText,membershipClass, showtimeId, seat.getSeatNumber());
                        out.print(seatHtml);
                    }
        
                    if ((j == 3 || j == 11) && !(row == numRows - 1)) {
                        out.print("<div class='seat-divider'></div>");
                    }
        
                }
                out.print("</div>");
        
                if (row == 4 || row == 7 || row == numRows - 2) {
                    String sectionLabel = "";
                    if (row == 4) {
                        sectionLabel = "Normal Seats";
                    } else if (row == 7) {
                        sectionLabel = "Premium Seats";
                    } else {
                        sectionLabel = "Recliners";
                    }
                    out.print("<h4 class='text-center'>" + sectionLabel + "</h4>");
                }
        
                if (row == numRows - 2) {
                    out.print("<div class='seat-divider'></div>");
                }
                rowLabel++;
            }
        %>
        
         </div>
         <!-- Confirm Button -->
         <div class="text-center mt-4">
            <button id="confirm-selection" class="btn btn-primary mb-5" disabled>Confirm
            Selection</button>
         </div>
      </div>
      <!-- Confirmation Modal -->
      <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog"
         aria-labelledby="confirmationModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="confirmationModalLabel">Confirm Your Booking</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <h5>Movie Name: <span id="movie-name"></span></h5>
                  <p>Show Date: <span id="show-date"></span></p>
                  <p>Show Time: <span id="show-time"></span></p>
                  <table class="table">
                     <thead>
                        <tr>
                           <th>Seat Number</th>
                           <th>Price</th>
                        </tr>
                     </thead>
                     <tbody id="seat-details">
                        <!-- Seat details will be appended here -->
                     </tbody>
                  </table>
                  <form id="voucherForm">
                     <div class="form-group">
                        <label for="voucherCode">Enter Voucher Code:</label>
                        <input type="text" class="form-control" id="voucherCode" placeholder="Enter code">
                     </div>
                     <button type="submit" class="btn btn-primary">Apply</button>
                  </form>
                  <div id="voucherMessage" class="mt-3"></div>
                  <h5 id="price-main">Total Price: ₹ <span id="total-price"></span></h5>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-dismiss="modal">Cancel</button>
                  <button type="button" class="btn btn-primary" id="confirm-booking">Confirm
                  Booking</button>
               </div>
            </div>
         </div>
      </div>
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script
         src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
      <script>
         document.addEventListener('DOMContentLoaded', function () {
             var selectedSeats = [];
             var selectedElements = [];
             var finalAmountPriceTotal = 0;
             var voucherId = 0;
             document.querySelectorAll('.seat.available').forEach(function (seat) {
                 seat.addEventListener('click', function () {
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
             document.querySelectorAll('.seat.gold').forEach(function (seat) {
                 seat.addEventListener('click', function () {
                     var seatElement = this;
                     var multiplex = seatElement.getAttribute('data-membership')
                     if(multiplex == 'NONE' || multiplex == 'PLATINUM') return
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
                                 seatElement.classList.remove('gold');
                                 seatElement.classList.add('selected');
                                 selectedSeats.push(seatId);
                                 selectedElements.push(seatElement); // Store the actual element
                             } else if (data === 'Seat is already booked by another user.') {
                                 seatElement.classList.remove('gold');
                                 seatElement.classList.add('unavailable');
                                 alert('Seat is already booked by another user.');
                             } else if (data === 'Seat unselected successfully.') {
                                 seatElement.classList.remove('selected');
                                 seatElement.classList.add('gold');
                                 selectedSeats = selectedSeats.filter(id => id !== seatId);
                                 selectedElements = selectedElements.filter(element => element !== seatElement);
                             }
                             document.getElementById('confirm-selection').disabled = selectedSeats.length === 0;
                         })
                         .catch(error => console.error('Error:', error));
                 });
             });
             document.querySelectorAll('.seat.platinum').forEach(function (seat) {
                 seat.addEventListener('click', function () {
                     var seatElement = this;
                     var multiplex = seatElement.getAttribute('data-membership')
                     if(multiplex == 'NONE' || multiplex == 'GOLD') return
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
                                 seatElement.classList.remove('platinum');
                                 seatElement.classList.add('selected');
                                 selectedSeats.push(seatId);
                                 selectedElements.push(seatElement); // Store the actual element
                             } else if (data === 'Seat is already booked by another user.') {
                                 seatElement.classList.remove('platinum');
                                 seatElement.classList.add('unavailable');
                                 alert('Seat is already booked by another user.');
                             } else if (data === 'Seat unselected successfully.') {
                                 seatElement.classList.remove('selected');
                                 seatElement.classList.add('platinum');
                                 selectedSeats = selectedSeats.filter(id => id !== seatId);
                                 selectedElements = selectedElements.filter(element => element !== seatElement);
                             }
                             document.getElementById('confirm-selection').disabled = selectedSeats.length === 0;
                         })
                         .catch(error => console.error('Error:', error));
                 });
             });
         
             document.getElementById('confirm-selection').addEventListener('click', function () {
                 
                 var modal = $('#confirmationModal');
                 var seatDetailsTable = document.getElementById('seat-details');
                 seatDetailsTable.innerHTML = '';
                 var totalPrice = 0;
         
                 selectedElements.forEach(function (seatElement) {
                     var seatNumber = seatElement.textContent;
                     var seatPrice = parseFloat(seatElement.getAttribute('data-price').replace('Price: ₹ ', ''));
                     totalPrice += seatPrice;
         
                     var row = document.createElement('tr');
                     row.innerHTML = '<td>' + seatNumber + '</td><td>₹ ' + seatPrice.toFixed(2) + '</td>';
                     seatDetailsTable.appendChild(row);
                 });
                 console.log(totalPrice)
                 finalAmountPriceTotal = totalPrice
                 document.getElementById('total-price').textContent = totalPrice.toFixed(2);
                 document.getElementById('show-date').textContent = selectedElements[0].getAttribute('data-show-date');
                 document.getElementById('show-time').textContent = selectedElements[0].getAttribute('data-show-time');
                 modal.modal('show');
             });
             document.getElementById('voucherForm').addEventListener('submit', function(event) {
         event.preventDefault();
         
         const voucherCode = document.getElementById('voucherCode').value;
         const voucherMessage = document.getElementById('voucherMessage');
         const amountElement = document.getElementById('amount');
         const totalAmountElement = document.getElementById('total-price');
         const priceMain = document.getElementById("price-main")
         fetch(`http://localhost:3080/voucher-status/`+voucherCode)
         .then(response => response.json())
         .then(data => {
         console.log(data)
         if(data.success){
         voucherId = data.voucher;
         voucherMessage.innerHTML = `<span class="text-success">`+data.message+`</span>`;
         const discount = data.amount; 
         const originalAmount = parseFloat(totalAmountElement.textContent);
         const newAmount = originalAmount - discount ;
         const finalAmount = newAmount < 0 ? 0 : newAmount
         totalAmountElement.textContent = finalAmount.toFixed(2);
         finalAmountPriceTotal = finalAmount
         priceMain.innerHTML = `<s>Total Amount: ₹`+originalAmount.toFixed(2)+`</s><br>Discounted Amount: ₹`+finalAmount.toFixed(2);
         }
         else{
         finalAmountPriceTotal = parseFloat(totalAmountElement.textContent);
         voucherMessage.innerHTML = `<span class="text-danger">`+data.message+`</span>`;
         }
         })
         
         });
         
             document.getElementById('confirm-booking').addEventListener('click', function () {
                 var bookingDetails = selectedElements.map(seatElement => {
                 var seatId = seatElement.getAttribute('data-seat-id');
         return {
         seat_id: seatId,
         price: parseFloat(seatElement.getAttribute('data-price').replace('Price: ₹ ', ''))
         };
         });
                 var options = {
                     "key": "rzp_test_RYaOC10U6IjI9N",
                     "amount": parseFloat(finalAmountPriceTotal) * 100,
                     "currency": "INR",
                     "name": "Movie Booking",
                     "description": "Confirm your booking",
         
                     "handler": function (response) {
                         document.getElementById('loader').style.display = 'flex';
                         var confirmUrl = "http://localhost:3080/createBooking";
                         var payload = {
                             totalPrice: parseFloat(finalAmountPriceTotal),
                             bookingDate: selectedElements[0].getAttribute('data-show-date') + 'T' + selectedElements[0].getAttribute('data-show-time'),
                             showtime_id: (selectedElements[0].getAttribute('data-showtime-id')),
                             user_id: parseInt(selectedElements[0].getAttribute('data-user-id')),
                             bookingDetails: bookingDetails,
                             user_voucher_id: voucherId
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
                                 window.location.href = `/user/billBooking/` + data.id;
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
         
      </script>
   </body>
</html>