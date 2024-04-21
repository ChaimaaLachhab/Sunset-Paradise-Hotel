package com.hotel.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.hotel.connection.DatabaseManager;
import com.hotel.model.Room;

public class RoomDAOImp implements RoomDAO {

    @Override
    public List<Room> showRoom() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Room room = infoRoom(resultSet);
                rooms.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    @Override
    public Room getRoomById(int roomId) {
        Room room = null;
        String sql = "SELECT * FROM rooms WHERE room_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, roomId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                room = infoRoom(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return room;
    }

    private Room infoRoom(ResultSet resultSet) throws SQLException {
        int roomId = resultSet.getInt("room_id");
        String roomType = resultSet.getString("room_type");
        int numberOfGuests = resultSet.getInt("number_of_guests");
        String roomImagesList = resultSet.getString("room_images");
        String roomDescription = resultSet.getString("room_description");
        double price = resultSet.getDouble("price");
        String amenitiesList = resultSet.getString("amenities");
        boolean available = resultSet.getBoolean("available");
        List<String> roomImages = List.of(roomImagesList.split(",\\s*"));
        List<String> amenities = List.of(amenitiesList.split(",\\s*"));

        return new Room(roomId, roomType, numberOfGuests, price, amenities, available, roomImages, roomDescription);
    }

	
	@Override
	public List<Room> searchRoomsByStartDate(LocalDate startDate) {
	    List<Room> matchingRooms = new ArrayList<>();

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM rooms WHERE available = true " +
	                 "AND room_id NOT IN (SELECT room_id FROM reservations WHERE start_date <= ? AND end_date >= ?)")) {

	        statement.setDate(1, Date.valueOf(startDate));
	        statement.setDate(2, Date.valueOf(startDate));

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                // Construction des objets Room à partir des résultats de la requête
	                Room room = infoRoom(resultSet);
	                matchingRooms.add(room);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchingRooms;
	}
	
	@Override
	public List<Room> searchRoomsByEndDate(LocalDate endDate) {
	    List<Room> matchingRooms = new ArrayList<>();

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM rooms WHERE available = true " +
	                 "AND room_id NOT IN (SELECT room_id FROM reservations WHERE start_date < ? AND end_date >= ?)")) {

	        statement.setDate(1, Date.valueOf(endDate));
	        statement.setDate(2, Date.valueOf(endDate));

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                // Construction des objets Room à partir des résultats de la requête
	                Room room = infoRoom(resultSet);
	                matchingRooms.add(room);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchingRooms;
	}
	
	@Override
	public List<Room> searchRoomsByNumberOfGuests(int numberOfGuests) {
	    List<Room> matchingRooms = new ArrayList<>();

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM rooms WHERE available = true " +
	                 "AND number_of_guests = ? " +
	                 "AND room_id NOT IN (SELECT room_id FROM reservations WHERE start_date <= ? AND end_date >= ?)")) {

	        statement.setInt(1, numberOfGuests);
	        statement.setDate(2, Date.valueOf(LocalDate.now()));
	        statement.setDate(3, Date.valueOf(LocalDate.now()));

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                
	                Room room = infoRoom(resultSet);
	                matchingRooms.add(room);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchingRooms;
	}
	
	@Override
	public List<Room> searchRoomsByRoomType(String roomType) {
	    List<Room> matchingRooms = new ArrayList<>();

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM rooms " +
	                 "WHERE available = true AND room_type = ? " +
	                 "AND room_id NOT IN (SELECT room_id FROM reservations WHERE start_date <= ? AND end_date >= ?)")) {

	        statement.setString(1, roomType);
	        statement.setDate(2, Date.valueOf(LocalDate.now()));
	        statement.setDate(3, Date.valueOf(LocalDate.now()));

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Room room = infoRoom(resultSet);
	                matchingRooms.add(room);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchingRooms;
	}


	
	



}
