package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrdersDAO;
import com.foodapp.dto.Orders;



public class OrderDAOImpl implements OrdersDAO{
	int x=-1;
	ArrayList<Orders> ordersList=new ArrayList<Orders>();
	Orders order=null;
	static Connection con =null;
	private PreparedStatement pstmt=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	
	private static final String INSERT_ORDERS="insert into orders(`uId`,`rId`,`totalAmount`,`status`,`dateTime`,`paymentOption`)"
			+ " values(?,?,?,?,?,?)";
	private static final String GET_ORDERS_BY_ID="select *  from  orders where oid=?";
	private static final String UPDATE_ORDERS_BY_ID="update orders set status=?  where oid=?";
	private static final String GET_MAX_ORDER_ID = "SELECT MAX(oid) FROM orders";
	
	
	static String url="jdbc:mysql://localhost:3306/online_food_delivey";
	static String un="root";
	static String psw="123456789";
	
	static  
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,un,psw);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
	
	@Override
	public int insertOrders(Orders or) {
		try 
		{
	         pstmt = con.prepareStatement(INSERT_ORDERS);
	         pstmt.setInt(1, or.getUserId());
	         pstmt.setInt(2, or.getRestarauntId());
	         pstmt.setDouble(3, or.getTotalAmount());
	         pstmt.setString(4, or.getStatus());
	         pstmt.setString(5, or.getDateTime());
	         pstmt.setString(6, or.getPaymentOption());

	         x = pstmt.executeUpdate();
	     } 
		 catch (SQLException e) 
		 {
	          e.printStackTrace();
	     }
	        return x;
	}

	@Override
	public Orders getOrdersById(int oId) {
		 try {
			 PreparedStatement statement = con.prepareStatement(GET_ORDERS_BY_ID);
				statement.setInt(1, oId);
				rs = statement.executeQuery();
				ordersList=(ArrayList<Orders>) extractOrdersListFromResultSet(rs);
				order = ordersList.get(0);

	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return order;
	}

	@Override
	public int updateOrdersById(int oId, String status) {
		try 
		{
            pstmt = con.prepareStatement(UPDATE_ORDERS_BY_ID);
            pstmt.setString(1, status);
            pstmt.setInt(2, oId);
            x = pstmt.executeUpdate();
        } 
		catch (SQLException e) 
		{
            e.printStackTrace();
        }
        return x;
	}
	// Method to get the maximum order ID
    public int getMaxOrderId() {
        int maxOrderId = -1;
        try {
            pstmt = con.prepareStatement(GET_MAX_ORDER_ID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                maxOrderId = rs.getInt(1);  // Retrieves the maximum order ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return maxOrderId;
    }
	private List<Orders> extractOrdersListFromResultSet(ResultSet rs) {
        
        try {
            while (rs.next()) {
                ordersList.add(new Orders(
                    rs.getInt(1),          // oid
                    rs.getInt(2),          // uId
                    rs.getInt(3),          // rId
                    rs.getInt(4),       // totalAmount
                    rs.getString(5),       // status
                    rs.getString(6),    // dateTime
                    rs.getString(7)        // paymentOption
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordersList;
    }

}
