package com.foodapp.dto;

public class Restaraunt {
	private int rId;
	private String name;
	private String cusineType;
	private int deliveryTime;
	private int isOpen;
	private int rating;
	private String imgPath;
	
	public Restaraunt()
	{
		
	}

	public Restaraunt(int rId, String name, String cusineType, int deliveryTime, int isOpen, int rating,
			String imgPath) {
		super();
		this.rId = rId;
		this.name = name;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.isOpen = isOpen;
		this.rating = rating;
		this.imgPath = imgPath;
	}
	public Restaraunt( String name, String cusineType, int deliveryTime, int isOpen, int rating,
			String imgPath) {
		super();
		
		this.name = name;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.isOpen = isOpen;
		this.rating = rating;
		this.imgPath = imgPath;
	}
	public Restaraunt( int rId, String name, String cusineType, int deliveryTime,  String imgPath) {
		super();
		this.rId = rId;
		this.name = name;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Restaraunt [rId=" + rId + ", name=" + name + ", cusineType=" + cusineType
				+ ", deliveryTime=" + deliveryTime + ", isOpen=" + isOpen + ", rating=" + rating + ", imagePath="
				+ imgPath + "]";
	}
	
	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getCusineType() {
		return cusineType;
	}

	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public int isOpen() {
		return isOpen;
	}

	public void setOpen(int isOpen) {
		this.isOpen = isOpen;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getimgPath() {
		return imgPath;
	}

	public void setimgPath(String imgPath) {
		this.imgPath = imgPath;
	}

}
