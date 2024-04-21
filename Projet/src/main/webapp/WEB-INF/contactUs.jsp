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
	
     <section class="contact__home">
        <h1>CONTACT US</h1>
        <p>Feel free to send us a mesage, phone or email us directly,<br> we'd love to hear from you!</p>
    </section>

    

    <section class="contact__information">
        <div class="infos">
            <h2>Contact Information</h2>
            <div class="d-flex align-items-centre gap-2">
                <i class="fab fa-instagram"></i>
                <p>Beni Mellal Maroc</p>
            </div>
            <div class="d-flex align-items-centre gap-2">
                <i class="fab fa-instagram"></i>
                <p>+212 601 00 01 11</p>
            </div>
            <div class="d-flex align-items-centre gap-2">
                <i class="fab fa-instagram"></i>
                <p>exemple@gmail.com</p>
            </div>
            <div class="d-flex align-items-centre gap-2">
                <i class="fab fa-instagram"></i>
                <p>Open 7 Days a Week 10am - 11pm</p>
            </div>
        </div>
        <form class="contact__form">
        <h2>Keep in touch</h2>
        <p>Fill out the form below, and we'll get back to you as soon as possible</p>
        <div class="forms">
            <input type="text" placeholder="Your Name" class="input">
            <input type="text" placeholder="Your Email" class="input">
            <textarea placeholder="Your Message" class="input" id="textarea"></textarea>
        </div>
        <button type="submit">submit</button>
        </form>
    </section>
    <div>
        <p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d46776.66071405989!2d-6.414428832929778!3d32.330897606096784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda38649419c7fc1%3A0x6236b3e9a12bafd9!2sB%C3%A9ni%20Mellal!5e1!3m2!1sfr!2sma!4v1709871348287!5m2!1sfr!2sma" width="100%" height="382" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
    </div>
    
    <!-- Footer -->
	<%@ include file="footer.jsp"%>

	<script><%@ include file ="/JavaScript/script.js" %></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>