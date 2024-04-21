package com.hotel.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.DAO.ReservationDAO;
import com.hotel.DAO.ReservationDAOImp;
import com.hotel.DAO.RoomDAO;
import com.hotel.DAO.RoomDAOImp;
import com.hotel.model.Reservation;
import com.hotel.model.Room;


@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomDAO roomDAO;
	private ReservationDAO reservationDAO; 	
 
    public ReservationServlet() {
        super();
        roomDAO = new RoomDAOImp();
        reservationDAO = new ReservationDAOImp();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    

    
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
            case "reserveRoom":
            	reserveRoom(request, response);
                break;
            case "showReservation":
            	showReservation(request, response);
                break;
            case "delete":
                
                break;
            case "search":
            	search(request, response);
                break;
            case "contactUs":
            	request.getRequestDispatcher("/WEB-INF/contactUs.jsp").forward(request, response);
                break;
            default:
               
                break;
            }
        } else {
        	
        }
}
    
    public void reserveRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String userId = request.getParameter("userId");
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        Reservation reservation = new Reservation(userId, roomId, startDate, endDate);

        reservationDAO.makeReservation(reservation);

        List<Room> rooms = roomDAO.showRoom();
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
    }

    public void showReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("userId");

        // Appeler le DAO pour récupérer les réservations précédentes de l'utilisateur
        List<Reservation> previousReservations = reservationDAO.getPreviousReservations(userId);

        // Transmettre les réservations à la vue pour affichage
        request.setAttribute("previousReservations", previousReservations);

        request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
    }

    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("search")) {
            if (request.getParameter("startDate") != null) {
                LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
                List<Room> matchingRooms = roomDAO.searchRoomsByStartDate(startDate);
                request.setAttribute("matchingRooms", matchingRooms);
            } else if (request.getParameter("endDate") != null) {
                LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
                List<Room> matchingRooms = roomDAO.searchRoomsByEndDate(endDate);
                request.setAttribute("matchingRooms", matchingRooms);
            } else if (request.getParameter("numberOfGuests") != null) {
                int numberOfGuests = Integer.parseInt(request.getParameter("numberOfGuests"));
                List<Room> matchingRooms = roomDAO.searchRoomsByNumberOfGuests(numberOfGuests);
                request.setAttribute("matchingRooms", matchingRooms);
            } else if (request.getParameter("roomType") != null) {
                String roomType = request.getParameter("roomType");
                List<Room> matchingRooms = roomDAO.searchRoomsByRoomType(roomType);
                request.setAttribute("matchingRooms", matchingRooms);
            }

            List<Room> rooms = roomDAO.showRoom();
            request.setAttribute("rooms", rooms);
            request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     doGet(request, response);
        }
    
    

}
