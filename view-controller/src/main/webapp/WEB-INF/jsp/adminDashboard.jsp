<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Multiplexes" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 56px;
        }
    </style>
</head>
<body>
    <%@ include file="./admin/adminSidebar.jsp" %>
    <div class="container">
        <h1 class="mt-5">Manage Multiplexes</h1>
        <p>Here you can manage all the multiplexes.</p>
       
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Multiplexes[] multiplexes = (Multiplexes[]) request.getAttribute("multiplexes");
                    if (multiplexes != null) {
                        for (Multiplexes m : multiplexes) {
                %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getName() %></td>
                        <td><%= m.getAddress() %></td>
                        <td class="d-flex justify-content-evenly">            
                            <form action="/admin/manage-multiplex/<%= m.getId() %>" method="get" style="margin: 0;">
                                <button type="submit" class="btn btn-primary" style="background-color: #5a6268; border-color: #545b62;">
                                    <i class="fas fa-cogs" style="color: #ffc107;"></i>
                                </button>
                            </form>
                        </td>
                        
                        
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4">No multiplexes found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

   

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>