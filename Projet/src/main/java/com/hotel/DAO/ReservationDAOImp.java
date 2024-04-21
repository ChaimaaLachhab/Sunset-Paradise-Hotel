package com.hotel.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.hotel.connection.DatabaseManager;
import com.hotel.model.Reservation;


public class ReservationDAOImp implements ReservationDAO {
	
	@Override
	public List<Reservation> getPreviousReservations(String userId) {
	    List<Reservation> reservations = new ArrayList<>();
	    String sql = "SELECT r.reservation_id, r.room_id, r.start_date, r.end_date, rm.room_type " +
	                 "FROM reservations r " +
	                 "INNER JOIN rooms rm ON r.room_id = rm.room_id " +
	                 "WHERE r.user_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql)) {
	        
	        statement.setString(1, userId);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            int reservationId = resultSet.getInt("reservation_id");
	            int roomId = resultSet.getInt("room_id");
	            LocalDate startDate = resultSet.getDate("start_date").toLocalDate();
	            LocalDate endDate = resultSet.getDate("end_date").toLocalDate();
	            String roomType = resultSet.getString("room_type");

	            Reservation reservation = new Reservation(reservationId, userId, roomId, startDate, endDate, roomType);
	            reservations.add(reservation);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return reservations;
	}



	@Override
	public void makeReservation(Reservation reservation) {
	    String checkAvailability = "SELECT * FROM rooms WHERE room_id = ? AND available = true";

	    String insertReservation = "INSERT INTO reservations (room_id, start_date, end_date, user_id) VALUES (?, ?, ?, ?)";

	    String updateRoomAvailability = "UPDATE rooms SET available = false WHERE room_id = ?";
	    
	    try (Connection connection = DatabaseManager.getConnection()) {
	        try (PreparedStatement checkStatement = connection.prepareStatement(checkAvailability)) {
	            checkStatement.setInt(1, reservation.getRoomId());
	            ResultSet resultSet = checkStatement.executeQuery();

	            if (resultSet.next()) {
	                try (PreparedStatement insertStatement = connection.prepareStatement(insertReservation)) {
	                    insertStatement.setInt(1, reservation.getRoomId());
	                    insertStatement.setDate(2, Date.valueOf(reservation.getStartDate()));
	                    insertStatement.setDate(3, Date.valueOf(reservation.getEndDate()));
	                    insertStatement.setString(4, reservation.getUserId());

	                    insertStatement.executeUpdate();
	                    System.out.println("Reservation made successfully!");
	                    
	                    try (PreparedStatement updateStatement = connection.prepareStatement(updateRoomAvailability)) {
	                        updateStatement.setInt(1, reservation.getRoomId());
	                        updateStatement.executeUpdate();
	                        System.out.println("Room availability updated successfully!");
	                    }
	                }
	            } else {
	                System.out.println("Room not available for reservation.");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

    @Override
    public void cancelReservation(int reservationId) {
    	String sql = "DELETE FROM Reservations WHERE reservation_id = ?";
    	
        try  (Connection connection = DatabaseManager.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()) {
            statement.setInt(1, reservationId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
