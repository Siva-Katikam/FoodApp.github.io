package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.dto.OrderHistory;

public class OrderHistoryDAOImpl implements OrderHistoryDAO {
    int x = -1;
    ArrayList<OrderHistory> orderHistoryList = new ArrayList<OrderHistory>();
    OrderHistory orderHistory = null;
    static Connection con = null;
    private PreparedStatement pstmt = null;
    private Statement stmt = null;
    private ResultSet rs = null;

    private static final String INSERT_ORDER_HISTORY = "insert into order_history(`uId`, `date`, `total`, `status`)"
            + " values(?,?,?,?)";
    private static final String GET_ORDERS_HISTORY_BY_ID = "select *  from  order_history where o_historyId=?";
    private static final String UPDATE_ORDERS_HISTORY_BY_ID = "update order_history set status=?  where o_historyId=?";
    private static final String GET_ORDERS_HISTORY_BY_USER_ID = "select * from order_history where uId=?"; // SQL for retrieving order history by userId
    
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
    public int insertOrderHistory(OrderHistory oHistory) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_HISTORY);
            pstmt.setInt(1, oHistory.getUserId());
            pstmt.setString(2, oHistory.getDate());
            pstmt.setDouble(3, oHistory.getTotal());
            pstmt.setString(4, oHistory.getStatus());

            x = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }

    @Override
    public OrderHistory getOrderHistoryById(int oId) {
        try {
            PreparedStatement statement = con.prepareStatement(GET_ORDERS_HISTORY_BY_ID);
            statement.setInt(1, oId);
            rs = statement.executeQuery();
            orderHistoryList = (ArrayList<OrderHistory>) extractOrdersListFromResultSet(rs);
            orderHistory = orderHistoryList.get(0);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistory;
    }

    @Override
    public int updateOrderHistoryById(int oHistoryId, String status) {
        try {
            pstmt = con.prepareStatement(UPDATE_ORDERS_HISTORY_BY_ID);
            pstmt.setString(1, status);
            pstmt.setInt(2, oHistoryId);
            x = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }

    private List<OrderHistory> extractOrdersListFromResultSet(ResultSet rs) {
        try {
            while (rs.next()) {
                orderHistoryList.add(new OrderHistory(
                    rs.getInt(1),  // Assuming first column is o_historyId
                    rs.getInt(2),  // Assuming second column is uId
                    rs.getString(3),  // Assuming third column is date
                    rs.getInt(4),  // Assuming fourth column is total
                    rs.getString(5)   // Assuming fifth column is status
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistoryList;
    }

    // New method to retrieve order history by userId
    @Override
    public List<OrderHistory> getOrderHistoryByUserId(int userId) {
        orderHistoryList = new ArrayList<>();
        try {
            PreparedStatement statement = con.prepareStatement(GET_ORDERS_HISTORY_BY_USER_ID);
            statement.setInt(1, userId); // Setting the userId parameter in the query
            rs = statement.executeQuery();
            orderHistoryList = (ArrayList<OrderHistory>) extractOrdersListFromResultSet(rs); // Populate list from result set

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistoryList; // Returning the list of orders for the given user
    }
}
