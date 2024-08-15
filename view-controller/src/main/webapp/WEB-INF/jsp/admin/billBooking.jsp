<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Bookings" %>
<%@ page import="com.example.view_controller.entity.BookingDetails" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Invoice</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .invoice-box {
            max-width: 900px;
            margin: 30px auto;
            padding: 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .invoice-box h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }
        .invoice-box table {
            width: 100%;
            line-height: 1.6;
            border-collapse: collapse;
        }
        .invoice-box table td {
            padding: 10px;
            vertical-align: top;
            color: #555;
        }
        .invoice-box table tr td:nth-child(2) {
            text-align: right;
        }
        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }
        .invoice-box table tr.top table td {
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
        }
        .invoice-box table tr.heading td {
            background: #f9f9f9;
            border-bottom: 2px solid #ddd;
            font-weight: bold;
            color: #333;
        }
        .invoice-box table tr.item td {
            border-bottom: 1px solid #f1f1f1;
        }
        .invoice-box table tr.item.last td {
            border-bottom: none;
        }
        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #ddd;
            font-weight: bold;
            color: #333;
        }
        .invoice-box img {
            max-width: 150px;
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .invoice-box .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>
    <%
        Bookings bookings = (Bookings) request.getAttribute("bookings");
        String encodedUrl = (String) request.getAttribute("encodedUrl");
    %>
    <div class="invoice-box">
        <h2>Booking Invoice</h2>
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                <strong>User Details:</strong><br>
                                Name: <%= bookings.getUser().getUsername() %><br>
                                Email: <%= bookings.getUser().getEmail() %>
                            </td>
                            <td>
                                Booking Date: <%= bookings.getBookingDate() %><br>
                                Invoice #: <%= bookings.getId() %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="heading">
                <td>Movie Details</td>
                <td></td>
            </tr>
            <tr class="item">
                <td>Movie: <%= bookings.getShowtime().getMovie().getTitle() %></td>
                <td>Showtime: <%= bookings.getShowtime().getShowDate() %></td>
            </tr>
            <tr class="heading">
                <td>Screen Details</td>
                <td></td>
            </tr>
            <tr class="item">
                <td>Screen Name</td>
                <td><%= bookings.getShowtime().getScreen().getName() %></td>
            </tr>

            <tr class="heading">
                <td>Seat</td>
                <td>Price</td>
            </tr>

            <%
                List<BookingDetails> bookingDetailsList = bookings.getBookingDetails();
                for (BookingDetails detail : bookingDetailsList) {
            %>
            <tr class="item">
                <td><%= detail.getSeat().getSeatNumber() %> (Row: <%= detail.getSeat().getRowNum() %>)</td>
                <td>₹ <%= detail.getPrice() %></td>
            </tr>
            <% } %>

            <tr class="total">
                <td></td>
                <td>Total: ₹ <%= String.format("%.2f", bookings.getTotalPrice()) %></td>
            </tr>
            
        </table>
        <div>
            <h3>Scan QR Code to Access This Invoice</h3>
            <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=<%= encodedUrl %>" alt="QR Code">
        </div>
        <div class="footer">
            Thank you for booking with us!
        </div>
    </div>
</body>
</html>
