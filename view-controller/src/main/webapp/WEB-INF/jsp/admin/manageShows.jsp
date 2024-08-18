<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Multiplexes" %>
<%@ page import="com.example.view_controller.entity.Showtimes" %>
<%@ page import="com.example.view_controller.entity.Movies" %>
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
    <%@ include file="adminSidebar.jsp" %>
    <% 
    Showtimes[] shows = (Showtimes[]) request.getAttribute("allShows");
    long screenId = (long) request.getAttribute("screenId");
    %>
    <div class="container">
        <h1 class="mt-5">Manage Shows</h1>
        <p>Here you can manage all the shows.</p>
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-screen-id="<%= screenId %>" data-target="#addShowModal">
            Add Shows
        </button>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Show Date</th>
                    <th>Show Time</th>
                    <th>Base Price</th>
                    <th>Movie</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (shows != null) {
                        for (Showtimes m : shows) {
                %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getShowDate() %></td>
                        <td><%= m.getShowTime() %></td>
                        <td>₹ <%= m.getPrice() %></td>
                        <td><%= m.getMovie().getTitle() %></td>
                       
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4">No shows found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="addShowModal" tabindex="-1" role="dialog" aria-labelledby="addShowModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addShowModalLabel">Add Show</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addShowForm" action="/admin/addShowtime" method="post">
                        <input type="hidden" name="screenId" value="<%= screenId %>">
                        <div class="form-group">
                            <label for="showDate">Select Date</label>
                            <input type="date" class="form-control" id="showDate" name="showDate" required>
                        </div>
                        <div class="form-group">
                            <label for="showTime">Select Time</label>
                            <select class="form-control" id="showTime" name="showTime" required>
                                <option value="">-- Select a time --</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="movie">Select Movie</label>
                            <select class="form-control" id="movieId" name="movieId" required>
                                <option value="" disabled selected>Select a movie</option>
                                <% 
                                    Movies[] movies = (Movies[]) request.getAttribute("movies");
                                    if (movies != null) {
                                        for (Movies movie : movies) {
                                %>
                                    <option value="<%= movie.getId() %>"><%= movie.getTitle() %></option>
                                <% 
                                        } 
                                    } else {
                                %>
                                    <option value="" disabled>No movies available</option>
                                <% 
                                    } 
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Base Price</label>
                            <input type="number" class="form-control" id="price" name="price" placeholder="Enter base price" required>
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
    document.addEventListener('DOMContentLoaded', function() {
      
        const showDateInput = document.getElementById('showDate');
        const showTimeSelect = document.getElementById('showTime');
        showDateInput.addEventListener('change', function() {
            const addShowButton = document.querySelector('button[data-screen-id]');
            const screenId = addShowButton.getAttribute('data-screen-id');
            const selectedDate = this.value;
            console.log(selectedDate,screenId)
            if (selectedDate) {
                var timeId = "/"+screenId+"/"+selectedDate;
                const url = "http://localhost:8080/get-available-time-slots"+timeId;
    
                fetch(url)
                    .then(response => response.json())
                    .then(timeSlots => {
                        showTimeSelect.innerHTML = '<option value="">-- Select a time --</option>';
    
                        timeSlots.forEach(time => {
                            const option = document.createElement('option');
                            option.value = time; 
                            option.textContent = time;
                            showTimeSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error fetching time slots:', error));
            }
        });
    });
</script>
</body>
</html>