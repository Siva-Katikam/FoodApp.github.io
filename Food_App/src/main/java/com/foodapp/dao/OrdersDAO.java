package com.foodapp.dao;

import com.foodapp.dto.Orders;

public interface OrdersDAO {
	int insertOrders(Orders or);
	Orders getOrdersById(int oId);
	int updateOrdersById(int oId, String status);
}
