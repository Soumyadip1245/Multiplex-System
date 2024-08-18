<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Load Balancing Test</title>
</head>
<body>
    <h1>Load Balancing Test Results</h1>
    <ul>
        <% 
            List<String> responsesList = (List<String>) request.getAttribute("responses");
                System.out.print(responsesList.toString());
            for (String response : responsesList) {
        %>
            <li><%= response %></li>
        <% 
            } 
        %>
    </ul>
</body>
</html>
