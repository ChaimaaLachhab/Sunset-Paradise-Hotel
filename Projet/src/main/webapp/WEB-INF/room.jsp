<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sunset Paradise Hotel</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- Time -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- CSS -->
<style><%@include file="/CSS/style.css"%></style>
</head>

<body>
	<!-- tHeader -->
	<%@ include file="header.jsp"%>

	<div class="container-fluid p-0">
		<section class="hero-section">
			<div class="hero-content">
				<h1>Welcome to Sunset Paradise Hotel</h1>
				<p>Experience luxury and comfort with our exquisite rooms.</p>
<div class="container d-flex flex-row justify-content-center gap-3 align-items-center input-group w-100 mt-5">
    <form id="formStartDate" class="d-flex flex-row gap-1 search-form" action="SearchServlet" method="get" data-form-id="formStartDate">
        <input type="hidden" name="action" value="search"> 
        <input type="date" class="form-control" name="startDate" placeholder="Arrival Date" required>
    </form>

    <form id="formEndDate" class="d-flex flex-row gap-1 search-form" action="SearchServlet" method="get" data-form-id="formEndDate">
        <input type="hidden" name="action" value="search"> 
        <input type="date" class="form-control" name="endDate" placeholder="Departure Date" required>
    </form>

    <form id="formNumberOfGuests" class="d-flex flex-row gap-1 search-form" action="SearchServlet" method="get" data-form-id="formNumberOfGuests">
        <input type="hidden" name="action" value="search"> 
        <input type="number" class="form-control" name="numberOfGuests" placeholder="Number of Guests" required>
    </form>
    
    

    <form id="formRoomType" class="d-flex flex-row gap-1 search-form" action="RoomServlet" method="get" data-form-id="formRoomType">
        <input type="hidden" name="action" value="search">
        <select class="form-control" name="roomType">
            <option value="Classic Room">Classic Room</option>
            <option value="Classic Single Room">Classic Single Room</option>
            <option value="Executive Room">Executive Room</option>
        </select>
    </form>

    <button id="submitButton" class="btn btn-primary">Search</button>
</div>
<form class="d-flex flex-row gap-1 search-form" action=ReservationServlet method="get">
        <input type="hidden" name="action" value="showReservation"> 
        <input type="number" class="form-control" name="userId" placeholder="My reservation" required>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const submitButton = document.getElementById('submitButton');
    const forms = document.querySelectorAll('.search-form');

    submitButton.addEventListener('click', function(event) {
        let selectedForm = null;

        forms.forEach(function(form) {
            const formInput = form.querySelector('input, select');

            if (formInput.value !== '') {
                selectedForm = form;
            }
        });

        if (selectedForm) {
            selectedForm.submit();
        } else {
            alert('Please select a search option.');
        }

        event.preventDefault();
    });
});
</script>

			</div>
		</section>
	</div>
	
	
	<!-- Main Content -->
	<main
		class="d-flex flex-column justify-content-centre align-items-center">
		<section class="container mt-5" id="previousReservations"
    style="${not empty previousReservations ? 'display: block;' : 'display: none;'}">
    <h2 class="text-start mb-4">Previous Reservations</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <!-- Previous Reservation Cards - Dynamically Generated -->
        <c:forEach var="reservation" items="${previousReservations}">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <h5 class="card-title fw-bold fs-3">Reservation ID: ${reservation.reservationId}</h5>
                        </div>
                        <p class="card-text">Room ID: ${reservation.roomId}</p>
                        <p class="card-text">Start Date: ${reservation.startDate}</p>
                        <p class="card-text">End Date: ${reservation.endDate}</p>
                        <p class="card-text">Room Type: ${reservation.roomType}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
		
		<section class="container mt-5" id="roomSearched"
			style="${not empty matchingRooms ? 'display: block;' : 'display: none;'}">
			<h2 class="text-start mb-4">Room searched</h2>
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<!-- Room Cards - Dynamically Generated -->
				<c:forEach var="room" items="${matchingRooms}">
					<div class="col">

						<div class="card">
							<!-- Carousel for room images -->
							<div id="carouselExample" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach var="image" items="${room.roomImages}"
										varStatus="status">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<img src="${image}"
												class="d-block img-fluid border-danger-subtle rounded-3 w-100 selectedImg"
												alt="Room Image">
										</div>
									</c:forEach>
								</div>
								<!-- Carousel navigation buttons -->
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExample" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExample" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

							<!-- Card body with room details -->
							<div class="card-body">
								<div class="d-flex justify-content-between">
									<h5 class="card-title fw-bold fs-3">${room.roomType}</h5>
								</div>
								<div class="card-text d-flex align-items-centre gap-2 mb-0">
									<img class="img-fluid mt-1"
										src="https://cdn-icons-png.flaticon.com/512/5893/5893015.png"
										alt="" style="width: 8%; height: 8%;">
									<p>${room.price}</p>
								</div>
								<p class="card-text"
									style="max-width: 100%; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: break-word;">
									${room.roomDescription}</p>
								<div class="d-flex flex-column gap-3">
									<a class="icon-link text-decoration-none"
										href="RoomServlet?action=roomDetails&roomId=${room.roomId}">View
										Details <i class="fas fa-arrow-right mr-3"></i>
									</a>
									<button class="btn btn-dark reserve-btn"
										onclick="showReservePopup(${room.roomId})">Réserver</button>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</section>
		<section class="container mt-5">
    <h2 class="text-start mb-4">Luxury Rooms</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <!-- Room Cards - Dynamically Generated -->
        <c:forEach var="room" items="${rooms}">
            <c:if test="${room.price > 200}">
                <div class="col">
                    <div class="card">
                        <!-- Carousel for room images -->
                        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="image" items="${room.roomImages}" varStatus="status">
                                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                        <img src="${image}" class="d-block img-fluid border-danger-subtle rounded-3 w-100 selectedImg" alt="Room Image">
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Carousel navigation buttons -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <!-- Card body with room details -->
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title fw-bold fs-3">${room.roomType}</h5>
                            </div>
                            <div class="card-text d-flex align-items-center gap-2 mb-0">
                                <img class="img-fluid mt-1" src="https://cdn-icons-png.flaticon.com/512/5893/5893015.png" alt="" style="width: 8%; height: 8%;">
                                <p>${room.price}</p>
                            </div>
                            <p class="card-text" style="max-width: 100%; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: break-word;">
                                ${room.roomDescription}
                            </p>
                            <div class="d-flex flex-column gap-3">
                                <a class="icon-link text-decoration-none" href="RoomServlet?action=roomDetails&roomId=${room.roomId}">
                                    View Details <i class="fas fa-arrow-right mr-3"></i>
                                </a>
                                <button class="btn btn-dark reserve-btn" onclick="showReservePopup(${room.roomId})">Réserver</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>


		<section class="container mt-5">
			<h2 class="text-start mb-4">Available Rooms</h2>
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<!-- Room Cards - Dynamically Generated -->
				<c:forEach var="room" items="${rooms}">
					<c:if test="${room.available}">
						<div class="col">
							<div class="card">
								<!-- Carousel for room images -->
								<div id="carouselExample" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-inner">
										<c:forEach var="image" items="${room.roomImages}"
											varStatus="status">
											<div
												class="carousel-item ${status.index == 0 ? 'active' : ''}">
												<img src="${image}"
													class="d-block img-fluid border-danger-subtle rounded-3 w-100 selectedImg"
													alt="Room Image">
											</div>
										</c:forEach>
									</div>
									<!-- Carousel navigation buttons -->
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExample" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExample" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>

								<!-- Card body with room details -->
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h5 class="card-title fw-bold fs-3">${room.roomType}</h5>
									</div>
									<div class="card-text d-flex align-items-center gap-2 mb-0">
										<img class="img-fluid mt-1"
											src="https://cdn-icons-png.flaticon.com/512/5893/5893015.png"
											alt="" style="width: 8%; height: 8%;">
										<p>${room.price}</p>
									</div>
									<p class="card-text"
										style="max-width: 100%; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: break-word;">${room.roomDescription}</p>
									<div class="d-flex flex-column gap-3">
										<a class="icon-link text-decoration-none"
											href="RoomServlet?action=roomDetails&roomId=${room.roomId}">View
											Details <i class="fas fa-arrow-right mr-3"></i>
										</a>

										<button class="btn btn-dark reserve-btn"
											onclick="showReservePopup(${room.roomId})">Réserver</button>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</main>

	<div class="container" id="reserveRoomId"
		style="display: none; max-width: 40%;">
		<button type="button"
			class="btn btn-outline-light btn-close float-end" aria-label="Close"
			onclick="hideReservePopup()" style="background-color: #fff"></button>
		<h2>Make Reservation</h2>
<form action="ReservationServlet" method="get">
    <input type="hidden" name="action" value="reserveRoom">
    <input type="hidden" name="roomId" id="roomId"> 
    
    <label>User ID:</label>
    <input type="text" name="userId"><br>
    
    <label>Start Date:</label>
    <input class="form-control" type="date" name="startDate"><br>
    
    <label>End Date:</label>
    <input class="form-control" type="date" name="endDate"><br>

    <input class="btn-save" type="submit" value="Save">
</form>

	</div>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>



	<script>
	function showReservePopup(roomId) {
	    document.getElementById("roomId").value = roomId;

	    let reserveRoomDiv = document.getElementById("reserveRoomId");
	    reserveRoomDiv.style.display = "block";

	    let mainContent = document.querySelector("main");
	    mainContent.style.filter = "blur(5px)";
	}


    function hideReservePopup() {
        let reserveRoomDiv = document.getElementById("reserveRoomId");
        reserveRoomDiv.style.display = "none";

        let mainContent = document.querySelector("main");
        mainContent.style.filter = "none";
    }
    
    <!-- Time -->
    flatpickr("input[type=datetime-local]", {});
    
    document.addEventListener('DOMContentLoaded', function() {
        // Form for Arrival Date
        const form = document.getElementById('form');
        formStartDate.addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                form.submit();
            }
        });
    });

</script>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Time -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
