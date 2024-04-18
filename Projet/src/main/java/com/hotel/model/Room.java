package com.hotel.model;

public class Room {
	private int roomId;
	private String roomType;
	private double price;
	private String amenities;
	private boolean available;
	
	public Room(int roomId, String roomType, double price, String amenities, boolean available) {
		super();
		this.roomId = roomId;
		this.roomType = roomType;
		this.price = price;
		this.amenities = amenities;
		this.available = available;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}
}
