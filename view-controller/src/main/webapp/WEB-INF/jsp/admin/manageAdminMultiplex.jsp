<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Multiplexes" %>
<%@ page import="com.example.view_controller.entity.Screens" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Multiplex Screens</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border: none;
}

.card-title {
  font-size: 1.5rem;
}

.card-text {
  font-size: 1.2rem;
}

.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
}

.btn-primary:hover {
  background-color: #0056b3;
  border-color: #004085;
}

    </style>
</head>
<body>
    <%@ include file="adminSidebar.jsp" %>
    <div class="container" style="margin-top: 5rem;">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-center mb-0">Auditorium Management</h2>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addScreenModal">
                Add Screen
            </button>
        </div>
        <div class="row justify-content-center">
            <% 
                Multiplexes multiplex = (Multiplexes) request.getAttribute("multiplex");
                long multiplexId = (multiplex != null) ? multiplex.getId() : -1; 
                Screens[] screens = (Screens[]) request.getAttribute("screens");
                if (screens != null) {
                    for (Screens screen : screens) { 
            %>
            <div class="col-md-4">
                <div class="card text-center mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Auditorium <%= screen.getName() %></h5>
                        <p class="card-text">Seats: <%= screen.getCapacity() %></p>
                        <form action="/admin/screen-seats/<%= screen.getId() %>" method="get" class="d-inline-block">
                            <button class="btn btn-primary" type="submit">Show Seats</button>
                        </form>
                        <form action="/admin/manage-shows/<%= screen.getId() %>" method="get" class="d-inline-block ml-2">
                            <button class="btn btn-secondary" type="submit">Manage Shows</button>
                        </form>
                    </div>
                </div>
            </div>
            
            
            <% 
                    } 
                } else { 
            %>
                <div class="col-md-12">No screens available.</div>
            <% 
                } 
            %>
        </div>
        <!-- Add Screen Modal -->
        <div class="modal fade" id="addScreenModal" tabindex="-1" role="dialog" aria-labelledby="addScreenModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addScreenModalLabel">Add Screen</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addScreenForm" action="/admin/add-screen/<%= multiplexId %>" method="post">
                            <input type="hidden" name="multiplexId" value="<%= multiplexId %>">
                            <div class="form-group">
                                <label for="screenName">Screen Name</label>
                                <input type="text" class="form-control" id="screenName" name="screenName" placeholder="Enter screen name">
                            </div>
                            <div class="form-group">
                                <label for="screenCapacity">Screen Capacity</label>
                                <input type="text" class="form-control" id="screenCapacity" name="screenCapacity" placeholder="Enter screen capacity">
                            </div>
                            <button type="submit" class="btn btn-primary">Add Screen</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
     
        
        
    </div>
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        document.querySelectorAll('.screen-box').forEach(function (box) {
            box.addEventListener('click', function () {
                var id = this.getAttribute('data-id');
                console.log("Screen ID:", id);
            });
        });
    </script>
   
    
</body>
</html>
