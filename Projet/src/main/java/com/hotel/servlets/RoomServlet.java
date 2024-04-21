package com.hotel.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.DAO.RoomDAO;
import com.hotel.DAO.RoomDAOImp;
import com.hotel.model.Room;


@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RoomDAO roomDAO;

    public RoomServlet() {
        super();
        roomDAO = new RoomDAOImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "roomDetails":
                	roomDetails(request, response);
                    break;
                case "add":
                    // Logique pour ajouter une chambre
                    break;
                case "update":
                    // Logique pour mettre à jour une chambre
                    break;
                case "delete":
                    // Logique pour supprimer une chambre
                    break;
                case "search":
                	search(request, response);
                    break;
                case "contactUs":
                	request.getRequestDispatcher("/WEB-INF/contactUs.jsp").forward(request, response);
                    break;
                default:
                	display(request, response);
                    break;
            }
        } else {
        	display(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    //All the functions
    
    public void display(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	List<Room> rooms = roomDAO.showRoom();
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
    }
    
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("search")) {
            // Vérifiez quels paramètres ont été soumis dans la requête
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
            	System.out.println("Room Type: " + roomType);
                List<Room> matchingRooms = roomDAO.searchRoomsByRoomType(roomType);
                request.setAttribute("matchingRooms", matchingRooms);
            }
            
            List<Room> rooms = roomDAO.showRoom();
            request.setAttribute("rooms", rooms);
            request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
        }
    }

    
    public void roomDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	int roomId = Integer.parseInt(request.getParameter("roomId"));
    	Room room = roomDAO.getRoomById(roomId);
        request.setAttribute("room", room);
        request.getRequestDispatcher("/WEB-INF/dt-room.jsp").forward(request, response);
    }
}
