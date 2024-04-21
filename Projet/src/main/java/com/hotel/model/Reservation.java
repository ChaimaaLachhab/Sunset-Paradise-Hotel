package com.hotel.model;

import java.time.LocalDate;
import java.util.Date;

public class Reservation {
	private int reservationId;
	private String userId;
	private int roomId;
	private LocalDate startDate;
	private LocalDate endDate;

	public Reservation(String userId, int roomId, LocalDate startDate, LocalDate endDate) {
		super();
		this.userId = userId;
		this.roomId = roomId;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Reservation(int reservationId, String userId, int roomId, LocalDate startDate, LocalDate endDate, String roomType) {
		super();
		this.reservationId=reservationId;
		this.userId = userId;
		this.roomId = roomId;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

}
