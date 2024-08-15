<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.example.view_controller.entity.Movies" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Movies List</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
            <style>
                .movie-card {
            position: relative;
            width: 250px;
            height: 375px;
            margin: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }
        .movie-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .rating {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
        }
        .movie-card-content {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
       
        .movie-card-content .title {
            font-size: 16px;
            font-weight: bold;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
            </style>
        </head>

        <body>
            <%@ include file="userSidebar.jsp" %>
                <div class="container mt-5">
                    <h1 class="mt-4 text-center">Movies List</h1>
                    <div class="row">
                        <% Movies[] movies=(Movies[]) request.getAttribute("movies"); for(Movies m : movies){ %>
                            <div class="col-md-3 mb-4">
                                <div class="movie-card" data-toggle="modal" data-target="#selectDateModal"
                                    data-movie-id="<%= m.getId() %>">
<img src=" <%=m.getImageUrl()%>">
                                    <div class="rating">
                                        <%= m.getRating()%>
                                    </div>

                                </div>
                            </div>
                            <% } %>
                    </div>
                </div>
                <div class="modal fade" id="selectDateModal" tabindex="-1" role="dialog"
                    aria-labelledby="selectDateModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="selectDateModalLabel">Select Showtime Date</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="dateSelectionForm" action="/user/load-timings" method="post">
                                    <input type="hidden" id="movieId" name="movieId">
                                    <div class="form-group">
                                        <label for="showDate">Select Date</label>
                                        <select class="form-control" id="showDate" name="showDate" required>
                                            <option value="">-- Select a date --</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <script>
                    document.addEventListener('DOMContentLoaded', () => {
                        const selectButtons = document.querySelectorAll('div[data-movie-id]');
                        selectButtons.forEach(button => {
                            button.addEventListener('click', function () {
                                const movieId = this.getAttribute('data-movie-id');
                                document.getElementById('movieId').value = movieId;
                                fetch(`http://localhost:3080/findAllShowtimesByMovieId/` + movieId)
                                    .then(response => response.json())
                                    .then(data => {
                                        const showDateSelect = document.getElementById('showDate');
                                        showDateSelect.innerHTML = '<option value="">-- Select a date --</option>';
                                        if (data.length == 0) {
                                            const option = document.createElement('option');
                                            option.value = "";
                                            option.textContent = "No Available Shows For The Movie";
                                            showDateSelect.appendChild(option);
                                        }
                                        else {
                                            data.forEach(showtime => {
                                                const option = document.createElement('option');
                                                option.value = showtime;
                                                option.textContent = showtime;
                                                showDateSelect.appendChild(option);
                                            });
                                        }

                                    })
                                    .catch(error => {
                                        console.error('Error fetching dates:', error);
                                    });
                            });
                        });
                    });
                </script>


        </body>

        </html>