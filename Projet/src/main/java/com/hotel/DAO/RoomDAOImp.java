package com.hotel.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	            int roomId = resultSet.getInt("room_id");
	            String roomType = resultSet.getString("room_type");
	            double price = resultSet.getDouble("price");
	            String amenities = resultSet.getString("amenities");
	            boolean available = resultSet.getBoolean("available");

	            Room room = new Room(roomId, roomType, price, amenities, available);
	            rooms.add(room);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rooms;
	}


	@Override
	public List<Room> searchRoom() {
		// TODO Auto-generated method stub
		return null;
	}


}
