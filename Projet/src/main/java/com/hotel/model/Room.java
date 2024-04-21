package com.hotel.model;

import java.util.List;

public class Room {
    private int roomId;
    private String roomType;
    private int numberOfGuests;
    private double price;
    private List<String> amenities;
    private boolean available;
    private List<String> roomImages;
    private String roomDescription;

    public Room(int roomId, String roomType, int numberOfGuests, double price,List<String> amenities, boolean available, List<String> roomImages, String roomDescription) {
        this.roomId = roomId;
        this.roomType = roomType;
        this.numberOfGuests = numberOfGuests;
        this.price = price;
        this.amenities = amenities;
        this.available = available;
        this.roomImages = roomImages;
        this.roomDescription = roomDescription;
    }
    
    public Room(String roomType, boolean available) {
    this.roomType = roomType;
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
    
    public int getNumberOfGuests() {
		return numberOfGuests;
	}

	public void setNumberOfGuests(int numberOfGuests) {
		this.numberOfGuests = numberOfGuests;
	}

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<String> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<String> amenities) {
        this.amenities = amenities;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
    
    public List<String> getRoomImages() {
		return roomImages;
	}

	public void setRoomImages(List<String> roomImages) {
		this.roomImages = roomImages;
	}

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

}
