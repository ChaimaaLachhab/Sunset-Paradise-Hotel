package com.hotel.DAO;

import java.util.List;

import com.hotel.model.Room;

public interface RoomDAO {
	
	 List<Room> showRoom();

	 List<Room> searchRoom();
}
