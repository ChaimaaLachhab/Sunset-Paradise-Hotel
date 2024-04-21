<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- CSS -->
    <style><%@include file="/CSS/style.css"%></style>
</head>

<body>
    
    
        <section class="container mt-5">
			<h2 class="text-start mb-4">Available Rooms</h2>
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<!-- Room Cards - Dynamically Generated -->
				<c:forEach var="room" items="${previousReservations}">
					
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
					
				</c:forEach>
			</div>
		</section>
    
    
    <!-- Footer -->
	<%@ include file="footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
