<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <!-- Bootstrap CSS -->
    <link
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    	rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link
    	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    	rel="stylesheet">
    <!-- CSS -->
    <style><%@include file="/CSS/style.css"%></style>
</head>
<body>

    <!-- tHeader -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Sunset Paradise Hotel</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav gap-5">
                        <li class="nav-item">
                            <a class="nav-link" href="/HotelSunset/"><i class="fas fa-home me-3"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/HotelSunset/RoomServlet"><i class="fas fa-house-circle-check me-3"></i>Rooms</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-house-user me-3"></i>Reservations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="/HotelSunset/RoomServlet?action=contactUs"><i class="fas fa-house-user me-3"></i>Contact Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
    </header>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>