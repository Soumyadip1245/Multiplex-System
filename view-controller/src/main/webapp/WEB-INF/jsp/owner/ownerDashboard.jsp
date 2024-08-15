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
    <%@ include file="ownerSidebar.jsp" %>
    <div class="container">
        <!-- <h1 class="mt-5 mb-2">Welcome, <%= (String) request.getAttribute("userName") %>!</h1> -->
        <h1 class="mt-5">Manage Multiplexes</h1>
        <p>Here you can manage all the multiplexes.</p>
        <!-- Add Multiplex Button -->
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#addMultiplexModal">
            Add Multiplex
        </button>
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
                            <button type="button" class="btn btn-primary mr-2" data-toggle="modal" data-target="#editMultiplexModal" data-id="<%= m.getId() %>" data-name="<%= m.getName() %>" data-address="<%= m.getAddress() %>">
                                <i class="fas fa-edit"></i>
                            </button>
                            
                            <form action="/owner/delete-multiplex/<%= m.getId() %>" method="post" style="margin: 0;">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit" class="btn btn-danger mr-2">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                            
                            <form action="/owner/manage-multiplex/<%= m.getId() %>" method="get" style="margin: 0;">
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

    <!-- Add Multiplex Modal -->
    <div class="modal fade" id="addMultiplexModal" tabindex="-1" role="dialog"
        aria-labelledby="addMultiplexModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMultiplexModalLabel">Add Multiplex</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addMultiplexForm" action="/owner/add-multiplex" method="post">
                        <div class="form-group">
                            <label for="multiplexName">Multiplex Name</label>
                            <input type="text" class="form-control" id="multiplexName" name="multiplexName"
                                placeholder="Enter multiplex name">
                        </div>
                        <div class="form-group">
                            <label for="multiplexLocation">Location</label>
                            <input type="text" class="form-control" id="multiplexLocation" name="multiplexLocation"
                                placeholder="Enter location">
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Multiplex Modal -->
    <div class="modal fade" id="editMultiplexModal" tabindex="-1" role="dialog"
        aria-labelledby="editMultiplexModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editMultiplexModalLabel">Edit Multiplex</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editMultiplexForm" action="/owner/edit-multiplex" method="post">
                        <input type="hidden" id="editMultiplexId" name="id">
                        <div class="form-group">
                            <label for="editMultiplexName">Multiplex Name</label>
                            <input type="text" class="form-control" id="editMultiplexName" name="name">
                        </div>
                        <div class="form-group">
                            <label for="editMultiplexLocation">Location</label>
                            <input type="text" class="form-control" id="editMultiplexLocation" name="address">
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
    <script>
        $('#editMultiplexModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var address = button.data('address');
            var modal = $(this);
            modal.find('#editMultiplexId').val(id);
            modal.find('#editMultiplexName').val(name);
            modal.find('#editMultiplexLocation').val(address);
        });
    </script>
</body>
</html>