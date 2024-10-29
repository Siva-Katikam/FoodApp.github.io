package com.foodapp.daoImpl;



import java.util.HashMap;
import java.util.Map;

import com.foodapp.dto.CartItem;

public class Cart {

    // The cart items, stored as a map where the key is the item ID and the value is the CartItem object
    private Map<Integer, CartItem> items;

    // Constructor to initialize the cart with an empty HashMap
    public Cart() {
        this.items = new HashMap<>();
    }

    // Method to add an item to the cart
    public void addItem(CartItem item) {
        // Get the ID of the item being added
        int itemId = item.getItemId();

        // If the item already exists in the cart, increase its quantity
        if (items.containsKey(itemId)) {
            CartItem existingItem = items.get(itemId); // Get the existing item
            // Update the quantity by adding the new item's quantity
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            // If the item doesn't exist, add the new item to the cart
            items.put(itemId, item);
        }
    }

    // Method to update the quantity of an item in the cart
    public void updateItem(int itemId, int quantity) {
        // Check if the item exists in the cart
        if (items.containsKey(itemId)) {
            if (quantity <= 0) {
                // If the quantity is zero or negative, remove the item from the cart
                items.remove(itemId);
            } else {
                // Otherwise, update the quantity of the item
                items.get(itemId).setQuantity(quantity);
            }
        }
    }

    // Method to remove an item from the cart
    public void removeItem(int itemId) {
        // Remove the item by its ID
        items.remove(itemId);
    }

    // Method to get all items currently in the cart
    public Map<Integer, CartItem> getItems() {
        return items; // Return the map of items
    }

    public void clearCart() {
        items.clear(); // Clear the HashMap, removing all entries
    }

    // Method to get the restaurant ID associated with the cart items
    public int getRestaurantId() {
        // If the cart is empty, return 0 (indicating no restaurant)
        if (items.isEmpty()) {
            return 0;
        }

        // Since all items in the cart should be from the same restaurant, get the restaurant ID
        // from the first item in the cart (assuming CartItem has a getRestaurantId method)
        return items.values().iterator().next().getRestaurantId();
    }
}

