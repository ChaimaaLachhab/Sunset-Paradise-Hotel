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
<!-- Font Awesome CSS -->	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS -->
<style><%@include file="/CSS/style.css"%></style>
</head>

<body>

	<!-- tHeader -->
	<%@ include file="header.jsp"%>

	<div class="container mt-4">

		<c:if test="${not empty room}">

			<h1 class="fw-bold" id="title">${room.roomType}</h1>

			<div
				class="row row-cols-3 row-cols-lg-4 row-cols-md-2 align-items-start mt-3">
				<div class="col-md-4 mb-4 text-center">
					<!-- Price -->
					<div class="d-flex flex-column align-items-center border-end">
						<div class="d-flex flex-row gap-5 items-center mt-3">
							<img class="img-fluid mt-1"
								src="https://cdn-icons-png.flaticon.com/512/5893/5893015.png"
								alt="" style="width: 20%; height: 20%;">
							<div class="flex flex-col gap-1 items-center mt-3">
								<h5 class="fw-bold">Price</h5>
								<p class="">${room.price}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4 text-center">
					<!-- Available -->
					<div class="d-flex flex-column align-items-center border-end">
						<div class="d-flex flex-row gap-5 items-center mt-3">
							<img class="img-fluid mt-1"
								src="https://static.thenounproject.com/png/3893186-200.png"
								alt="" style="width: 20%; height: 20%;">
							<div class="flex flex-col gap-1 items-center mt-3">
								<h5 class="fw-bold">Available</h5>
								<p class="fs-6">${room.available ? 'Yes' : 'No'}</p>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<!-- image of room -->
				<div class="col-md-8 mb-4">

					<!-- Carousel for room images -->
							<div id="carouselExample" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach var="image" items="${room.roomImages}"
										varStatus="status">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<img src="${image}"
												class="d-block img-fluid border-danger-subtle rounded-4 w-100 selectedImg"
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

				</div>

				<div class="col-md-4 mb-4">
					<!--  Amenities  -->
					<div class="bgCard p-3 rounded-4">
						<h4 class="fw-bold mb-3 mt-2 fs-7">Amenities</h4>
						<ul class="list-group">
							<c:forEach var="amenity" items="${room.amenities}">
								<li class="list-group-item">${amenity}</li>
							</c:forEach>
						</ul>
					</div>
					<!-- Rate the Recipe -->
					<div id="ratingSection"
						class="container p-4 flex flex-col justify-content-center align-items-center">
						<h4 class="fw-bold mb-3 mt-2 fs-7">Rate the recipe</h4>
						<div class="star-rating d-flex justify-content-center gap-3 p-2">
							<span class="fa fa-star-o display-6 disabled" data-rating="1"></span>
							<span class="fa fa-star-o display-6 disabled" data-rating="2"></span>
							<span class="fa fa-star-o display-6 disabled" data-rating="3"></span>
							<span class="fa fa-star-o display-6 disabled" data-rating="4"></span>
							<span class="fa fa-star-o display-6 disabled" data-rating="5"></span>
							<input type="hidden" name="whatever1" class="rating-value"
								value="0">
						</div>
					</div>
				</div>
				<!-- Description -->
        <div class="container">
            <h5 class="fw-bold me-4 fs-7">Description</h5>
            <p class="text-start mt-3 fs-6" id="description" style="word-wrap: break-word;">${room.roomDescription}</p>
        </div>
			</div>


			<!-- Comment Form Section -->
			<div
				class="container d-flex flex-column align-items-center justify-content-center rounded-5 p-3 my-5"
				style="background-image:; background-position: center; background-size: cover;">
				<form class="col-lg-6">
					<h2 class="text-center mb-3">Leave a Reply</h2>
					<div class="form-group">
						<input type="text" class="form-control" id="nameInput"
							placeholder="Enter your name">
					</div>
					<div class="form-group mt-3">
						<input type="email" class="form-control" id="emailInput"
							placeholder="Enter your email">
					</div>
					<div class="form-group mt-3">
						<textarea class="form-control" id="commentTextarea" rows="3"
							placeholder="Your comment"></textarea>
					</div>
				</form>
				<button type="button" class="btn btn-dark mt-3" id="submitButton">Post
					comment</button>
				<div class="container col-lg-6 mt-5" id="commentsSection">
					<!-- comment here -->
				</div>
			</div>

		</c:if>
	</div>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<script><%@ include file ="/JavaScript/script.js" %></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>