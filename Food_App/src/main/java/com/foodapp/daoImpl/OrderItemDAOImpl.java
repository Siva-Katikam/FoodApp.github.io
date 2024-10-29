package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderItemDAO;
import com.foodapp.dto.OrderItem;

public class OrderItemDAOImpl implements OrderItemDAO {
    int x = -1;
    ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
    OrderItem orderItems = null;
    static Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private static final String INSERT_ORDER_ITEMS = "insert into order_items(`oid`, `mId`, `quantity`, `subTotal`)"
            + " values(?,?,?,?)";
    private static final String GET_ORDER_ITEMS_BY_ID = "select *  from  order_items where o_itemsId=?";
    private static final String GET_ORDER_ITEMS_BY_ORDER_ID = "select * from order_items where oid=?"; // New SQL query to fetch items by orderId

    static String url = "jdbc:mysql://localhost:3306/online_food_delivey";
    static String un = "root";
    static String psw = "123456789";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, un, psw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertOrderItems(OrderItem oItems) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_ITEMS);
            pstmt.setInt(1, oItems.getOrderId());
            pstmt.setInt(2, oItems.getmItemId());
            pstmt.setInt(3, oItems.getQuntity());
            pstmt.setInt(4, oItems.getSubTotal());

            x = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }

    @Override
    public OrderItem getOrderItemsById(int oItemId) {
        try {
            PreparedStatement statement = con.prepareStatement(GET_ORDER_ITEMS_BY_ID);
            statement.setInt(1, oItemId);
            rs = statement.executeQuery();
            orderItemList = (ArrayList<OrderItem>) extractOrdersListFromResultSet(rs);
            orderItems = orderItemList.get(0);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

    // New method to get order items by orderId
    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        List<OrderItem> orderItemsList = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(GET_ORDER_ITEMS_BY_ORDER_ID);
            pstmt.setInt(1, orderId); // Set the orderId for the query
            rs = pstmt.executeQuery();

            while (rs.next()) {
                OrderItem orderItem = new OrderItem(
                    rs.getInt("o_itemsId"),     // Assuming column 1 is o_itemsId
                    rs.getInt("oid"),           // Assuming column 2 is oid (orderId)
                    rs.getInt("mId"),           // Assuming column 3 is mId (menuItemId)
                    rs.getInt("quantity"),      // Assuming column 4 is quantity
                    rs.getInt("subTotal")       // Assuming column 5 is subTotal
                );
                orderItemsList.add(orderItem); // Add each order item to the list
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
        return orderItemsList; // Return the list of order items
    }

    private List<OrderItem> extractOrdersListFromResultSet(ResultSet rs) {
        try {
            while (rs.next()) {
                orderItemList.add(new OrderItem(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getInt(4)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemList;
    }
}
