package com.hotel.DAO;

import java.util.List;

import com.hotel.model.Reservation;

public interface ReservationDAO {
	
	List<Reservation> getPreviousReservations(String userId);

	void makeReservation(Reservation reservation);
	
	void cancelReservation(int reservationId);
}
