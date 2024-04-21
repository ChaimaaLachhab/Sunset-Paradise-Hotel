package com.hotel.DAO;

import java.time.LocalDate;
import java.util.List;

import com.hotel.model.Room;

public interface RoomDAO {
	
	List<Room> showRoom();
	
	Room getRoomById(int roomId);
	
	List<Room> searchRoomsByStartDate(LocalDate startDate);
	
	List<Room> searchRoomsByEndDate(LocalDate endDate);
	
	List<Room> searchRoomsByNumberOfGuests(int numberOfGuests);
	
	List<Room> searchRoomsByRoomType(String roomType);
}
