<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.view_controller.entity.Movies" %>
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
    <%@ include file="adminSidebar.jsp" %>
    <div class="container">
        <h1 class="mt-5 mb-2">Manage Movies</h1>
        <p>Here you can manage all the movies.</p>
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#addMovieModal">
            Add Movie
        </button>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Synopsis</th>
                    <th>Cast</th>
                    <th>Trailer</th>
                    <th>Rating</th>
                    <th>Release Date</th>
                    <th>Duration (min)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Movies[] movies = (Movies[]) request.getAttribute("movies");
                    if (movies != null) {
                        for (Movies m : movies) {
                %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getTitle() %></td>
                        <td><%= m.getSynopsis() %></td>
                        <td><%= m.getCast() %></td>
                        <td><a href="<%= m.getTrailerUrl() %>" target="_blank">Watch Trailer</a></td>
                        <td><%= m.getRating() %></td>
                        <td><%= m.getReleaseDate() %></td>
                        <td><%= m.getDuration() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="9">No movies found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Add Movie Modal -->
    <div class="modal fade" id="addMovieModal" tabindex="-1" role="dialog" aria-labelledby="addMovieModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMovieModalLabel">Add Movie</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="imdbId">IMDb ID</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="imdbId" name="imdbId" placeholder="Enter IMDb ID">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="fetchMovieData">Fetch Movie Data</button>
                            </div>
                        </div>
                    </div>
                    <form id="addMovieForm" action="/admin/add-movie" method="post">
                        <input type="hidden" name="imdbId" id="hiddenImdbId">
                        <div class="form-group">
                            <label for="movieTitle">Title</label>
                            <input type="text" class="form-control" id="movieTitle" name="title" placeholder="Enter movie title">
                        </div>
                        <div class="form-group">
                            <label for="movieSynopsis">Synopsis</label>
                            <textarea class="form-control" id="movieSynopsis" name="synopsis" rows="3" placeholder="Enter movie synopsis"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="movieCast">Cast</label>
                            <textarea class="form-control" id="movieCast" name="cast" placeholder="Enter cast"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="movieTrailerUrl">Trailer URL</label>
                            <input type="text" class="form-control" id="movieTrailerUrl" name="trailerUrl" placeholder="Enter trailer URL">
                        </div>
                        <div class="form-group">
                            <label for="movieImageUrl">Image URL</label>
                            <input type="text" class="form-control" id="movieImageUrl" name="imageUrl" placeholder="Enter image URL">
                        </div>                        
                        <div class="form-group">
                            <label for="movieRating">Rating</label>
                            <input type="number" step="0.1" class="form-control" id="movieRating" name="rating" placeholder="Enter movie rating">
                        </div>
                        <div class="form-group">
                            <label for="movieReleaseDate">Release Date</label>
                            <input type="date" class="form-control" id="movieReleaseDate" name="releaseDate">
                        </div>
                        <div class="form-group">
                            <label for="movieDuration">Duration (min)</label>
                            <input type="number" class="form-control" id="movieDuration" name="duration" placeholder="Enter duration in minutes">
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
        document.getElementById('fetchMovieData').addEventListener('click', function() {
            const imdbId = document.getElementById('imdbId').value;
            const apiKey = '952a947a464af4956dde8c4f189222d5'; 
            const url = `https://api.themoviedb.org/3/find/`+imdbId+`?external_source=imdb_id`;

            fetch(url, {
                method: 'GET',
                headers: {
                    'Authorization': `Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTJhOTQ3YTQ2NGFmNDk1NmRkZThjNGYxODkyMjJkNSIsIm5iZiI6MTcyMzI3NTMzNS41MjY5NzQsInN1YiI6IjY2YjVhMDJkYmQ2MDQ2MmI0M2YzNDBlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B8n--11GgDaCfSlBzOhdO8KzB2e-u2nmcDoulFVsSaQ`,
                    'accept': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.movie_results && data.movie_results.length > 0) {
                    const movie = data.movie_results[0];
                    document.getElementById('movieTitle').value = movie.title;
                    document.getElementById('movieSynopsis').value = movie.overview;
                    document.getElementById('movieRating').value = parseFloat(movie.vote_average).toFixed(1)
                    document.getElementById('movieReleaseDate').value = movie.release_date
                    document.getElementById('hiddenImdbId').value = imdbId
                    document.getElementById('movieImageUrl').value = `https://image.tmdb.org/t/p/original`+movie.poster_path;
                    fetch(`https://api.themoviedb.org/3/movie/`+movie.id+`/credits`, {
                        method: 'GET',
                        headers: {
                            'Authorization': `Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTJhOTQ3YTQ2NGFmNDk1NmRkZThjNGYxODkyMjJkNSIsIm5iZiI6MTcyMzI3NTMzNS41MjY5NzQsInN1YiI6IjY2YjVhMDJkYmQ2MDQ2MmI0M2YzNDBlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B8n--11GgDaCfSlBzOhdO8KzB2e-u2nmcDoulFVsSaQ`,
                            'accept': 'application/json'
                        }
                    })
                    .then(creditsResponse => creditsResponse.json())
                    .then(creditsData => {
                        const cast = creditsData.cast.slice(0, 5).map(actor => actor.name).join(', ');
                        document.getElementById('movieCast').value = cast;
                    });
                    fetch(`https://api.themoviedb.org/3/movie/`+movie.id, {
                method: 'GET',
                headers: {
                    'Authorization': `Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTJhOTQ3YTQ2NGFmNDk1NmRkZThjNGYxODkyMjJkNSIsIm5iZiI6MTcyMzI3NTMzNS41MjY5NzQsInN1YiI6IjY2YjVhMDJkYmQ2MDQ2MmI0M2YzNDBlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B8n--11GgDaCfSlBzOhdO8KzB2e-u2nmcDoulFVsSaQ`,
                    'accept': 'application/json'
                }
            })
            .then(detailsResponse => detailsResponse.json())
            .then(detailsData => {
                document.getElementById('movieDuration').value = detailsData.runtime; 
            });
                    fetch(`https://api.themoviedb.org/3/movie/`+movie.id+`/videos`, {
                        method: 'GET',
                        headers: {
                            'Authorization': `Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTJhOTQ3YTQ2NGFmNDk1NmRkZThjNGYxODkyMjJkNSIsIm5iZiI6MTcyMzI3NTMzNS41MjY5NzQsInN1YiI6IjY2YjVhMDJkYmQ2MDQ2MmI0M2YzNDBlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B8n--11GgDaCfSlBzOhdO8KzB2e-u2nmcDoulFVsSaQ`,
                            'accept': 'application/json'
                        }
                    })
                    .then(videoResponse => videoResponse.json())
                    .then(videoData => {
                        const trailer = videoData.results.find(video => (video.type === 'Teaser' || video.type === 'Trailer') && video.site === 'YouTube');
                        if (trailer) {
                            document.getElementById('movieTrailerUrl').value = `https://www.youtube.com/watch?v=`+trailer.key;
                        }
                    });
                } else {
                    alert('Movie not found.');
                }
            })
            .catch(error => {
                console.error('Error fetching movie details:', error);
                alert('Failed to fetch movie details.');
            });
        });
    </script>
</body>
</html>
