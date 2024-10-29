package com.foodapp.dto;

public class Menu {
	//<------------- Private members -------------->
	
		private int itemId;
		private int restarauntId;
		private String itemName;
		private String discription;
		private int price;
		private boolean isAvailable;
		private String imagePath;
		
		public Menu(int itemId, int restarauntId, String itemName, String discription, int price, boolean isAvailable,
				String imagePath) 
		{
			this.itemId = itemId;
			this.restarauntId = restarauntId;
			this.itemName = itemName;
			this.discription = discription;
			this.price = price;
			this.isAvailable = isAvailable;
			this.imagePath = imagePath;
		} 
		
		public Menu(int restarauntId, String itemName, String discription, int price, boolean isAvailable,
				String imagePath) 
		{
			
			this.restarauntId = restarauntId;
			this.itemName = itemName;
			this.discription = discription;
			this.price = price;
			this.isAvailable = isAvailable;
			this.imagePath = imagePath;
		} 
		
		public Menu()
		{
			
		}

		@Override
		public String toString() {
			return "Menu [itemId=" + itemId + ", restarauntId=" + restarauntId + ", itemName=" + itemName + ", discription="
					+ discription + ", price=" + price + ", isAvailable=" + isAvailable + ", imagePath=" + imagePath + "]";
		}

		public int getItemId() {
			return itemId;
		}

		public void setItemId(int itemId) {
			this.itemId = itemId;
		}

		public int getRestarauntId() {
			return restarauntId;
		}

		public void setRestarauntId(int restarauntId) {
			this.restarauntId = restarauntId;
		}

		public String getItemName() {
			return itemName;
		}

		public void setItemName(String itemName) {
			this.itemName = itemName;
		}

		public String getDiscription() {
			return discription;
		}

		public void setDiscription(String discription) {
			this.discription = discription;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public boolean isAvailable() {
			return isAvailable;
		}

		public void setAvailable(boolean isAvailable) {
			this.isAvailable = isAvailable;
		}

		public String getImagePath() {
			return imagePath;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}
		
}
