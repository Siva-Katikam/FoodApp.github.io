package com.foodapp.dao;

import java.util.List;

import com.foodapp.dto.OrderItem;

public interface OrderItemDAO {
	int insertOrderItems(OrderItem oItems);
	OrderItem getOrderItemsById(int oItemId);
	List<OrderItem> getOrderItemsByOrderId(int orderId); 
}
