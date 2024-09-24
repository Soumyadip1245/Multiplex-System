# Multiplex Management System

Excel: 
[Destinationexcel.xlsx](https://github.com/user-attachments/files/17110197/Destinationexcel.xlsx)

## Overview

The Multiplex Management System is a comprehensive solution for managing multiplex theaters, including seat booking, pricing, membership management, and administrative functions. This system integrates various features to enhance the user experience and streamline multiplex operations.

## Features

### **Protected Routes**
- **INTERCEPTOR**: Implemented to ensure routes are protected based on user roles or permissions.

### **User Registration**
- **Password Encryption**: Secure encryption for user passwords during registration.

### **Owner Functionality**
- **Login with Owner**: Special login functionality using 'ownerpassword'.
- **Show Sidebar**: Sidebar visibility for the owner with multiplex management options.
- **Add Multiplex**: Functionality to add new multiplexes.
- **Show Multiplex Settings**: View and configure settings for multiplexes.

### **Screen Management**
- **Add Screen**: Capability to add new screens to multiplexes.
- **Show View Seats of Newly Created Screen**: Display seat layout for newly created screens.

### **Seat Management**
- **Seat Layout**: Manage and view seat layout.
- **View Seat Booking for A1**: Access seat booking details for screen A1.

### **Movie and Show Management**
- **Add Movie by IMDb**: Add movies using IMDb details.
- **Add Show for New Screen**: Create shows for newly added screens.
- **Add New Booking for Movie**: Implement functionality to book seats for movies.

### **Seat Pricing**
- **Economic Seats (Rows 1-5)**: No additional premium.
- **Regular Seats (Rows 6-8)**: 20% premium.
- **Premium Seats (Rows 9+)**: 50% premium.
- **Recliners (Last Row)**: 80% premium.
- **Gold Membership Rows (Last Rows)**: 40% discount.
- **Platinum Membership (4 Seats in Last Rows)**: 20% discount.
- **Surge Pricing**: 20% surge if more than 50% of the seats are booked.

### **Booking and Payments**
- **Book Seats with Razorpay**: Integration with Razorpay for booking payments.
- **Show Invoice and QR Code**: Display invoice and QR code post-booking.
- **Show Mail**: Email confirmation for bookings.
- **Vouchers and Coupons**: Manage and display vouchers and coupons.
- **Add Voucher**: Functionality to add new vouchers.
- **Report Show**: View booking and voucher reports.

### **Admin Management**
- **Add Admin with Multiplex**: Create and manage admin accounts for multiplexes.
- **Login with Admin**: Admin login functionality.
- **Create a New User**: Functionality for creating new user accounts.

### **Error Handling**
- **Wrong Password**: Handling scenarios with incorrect password entries.

### **Booking Process**
- **Book Movie Seats**: Complete seat booking functionality.
- **Show User without Membership**: Display pricing for non-members; tooltip on seats.
- **Buy Membership**: Process for purchasing memberships.
- **Logout and Re-login**: Test logout and re-login features.
- **Show Active Membership**: Display active membership details.

### **Price Differences**
- **Login with Existing User [user1 user1password] Without Membership**: Compare pricing with and without membership.
- **Open Same Movie, Same Show**: Demonstrate price differences for the same movie and show.

### **Seat Locking Mechanism**
- **Show Seat Locking**: Visualization of seat locking when selected.

### **Voucher Management**
- **Add Wrong Voucher**: Test adding an invalid voucher.
- **Add Voucher and Order**: Apply valid vouchers and complete orders.

### **Booking Visualization**
- **Show Booked Seat Marked Red**: Indicate booked seats in red.
- **Add Voucher and Order**: Apply voucher and complete the booking.

### **Notifications**
- **Show Mail with Ordered Voucher and Invoice**: Display email with voucher and invoice details.

### **Booking Overview**
- **Show Bookings**: Overview of all bookings.

### **Eureka Server**
- **Show Netflix Eureka Server**: Demonstrate Eureka server functionality.
- **Show /load-balancing**: Explain API Gateway and load balancing concepts.

## Getting Started

To get started with the Multiplex Management System, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/multiplex-management-system.git
   cd multiplex-management-system
