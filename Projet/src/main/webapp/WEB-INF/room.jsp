<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>Liste des Chambres</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Prix</th>
                <th>Équipements</th>
                <th>Disponible</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="room" items="${rooms}">
                <tr>
                    <td>${room.roomId}</td>
                    <td>${room.roomType}</td>
                    <td>${room.price}</td>
                    <td>${room.amenities}</td>
                    <td>${room.available ? 'Oui' : 'Non'}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>