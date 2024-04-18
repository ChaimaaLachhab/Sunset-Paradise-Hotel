package com.hotel.servlets;

import java.io.IOException;
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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    List<Room> rooms = roomDAO.showRoom();

	        request.setAttribute("rooms", rooms);

	        request.getRequestDispatcher("/WEB-INF/room.jsp").forward(request, response);
	    
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
