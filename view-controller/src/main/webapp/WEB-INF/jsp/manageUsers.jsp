<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Users" %>
<%@ page import="com.example.view_controller.entity.Multiplexes" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Movies</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 56px;
        }
    </style>
</head>
<body>
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container">
        <h1 class="mt-5 mb-2">Manage Users</h1>
        <p>Here you can manage all the admins.</p>
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#addUserModal">
            Add User
        </button>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Users[] users = (Users[]) request.getAttribute("users");
                    if (users != null) {
                        for (Users m : users) {
                %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getUsername() %></td>
                        <td><%= m.getEmail() %></td>
                        <td><%= m.getRole() %></td>
                        <td>Actions</td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="9">No Admins</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addUserForm" action="/owner/add-user" method="post">
                        <div class="form-group">
                            <label for="username">Name</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <select class="form-control" id="role" name="role">
                                <option value="OWNER">Owner</option>
                                <option value="ADMIN">Admin</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="multiplexSelect">Select Multiplexes</label>
                            <select multiple class="form-control" id="multiplexSelect" name="multiplexIds" required>
                                <% 
                                    Multiplexes[] multiplexList = (Multiplexes[]) request.getAttribute("multiplexes");
                                    if (multiplexList != null) {
                                        for (Multiplexes multiplex : multiplexList) {
                                %>
                                    <option value="<%= multiplex.getId() %>"><%= multiplex.getName() %></option>
                                <% 
                                        }
                                    } 
                                %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
   
</body>
</html>
