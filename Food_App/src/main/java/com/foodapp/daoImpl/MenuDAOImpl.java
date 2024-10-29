package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.MenuDAO;
import com.foodapp.dto.Menu;

public class MenuDAOImpl implements MenuDAO {

    int x = -1;
    ArrayList<Menu> menuList = new ArrayList<Menu>();
    Menu m = null;
    static Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    // SQL queries for interacting with the menu table in the database
    private static final String INSERT_MENU = "insert into menu(itemId, rId, itemName, discription, price, isAvailable, imgPath) values(?,?,?,?,?,?,?)";
    private static final String GET_RESTARAUNT_MENU_BY_ID = "select * from menu where rId=?";
    private static final String GET_MENU_BY_ID = "select * from menu where itemId=?";
    private static final String DELETE_MENU_BY_ID = "delete from menu where itemId=?";
    private static final String UPDATE_MENU_BY_ID = "update menu set isAvailable=? where itemId=?";
    
    // Database connection details
    static String url = "jdbc:mysql://localhost:3306/online_food_delivey";
    static String un = "root";
    static String psw = "123456789";
    
    // Static block for loading the JDBC driver and establishing a connection
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, un, psw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to insert a new menu item into the database
    @Override
    public int insertMenu(Menu m) {
        try {
            pstmt = con.prepareStatement(INSERT_MENU);
            pstmt.setInt(1, m.getItemId());  // Set itemId
            pstmt.setInt(2, m.getRestarauntId());  // Set restaurantId (rId)
            pstmt.setString(3, m.getItemName());  // Set item name
            pstmt.setString(4, m.getDiscription());  // Set item description
            pstmt.setInt(5, m.getPrice());  // Set item price
            pstmt.setBoolean(6, m.isAvailable());  // Set availability
            pstmt.setString(7, m.getImagePath());  // Set image path
            
            x = pstmt.executeUpdate();  // Execute the insert operation
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;  // Return the number of rows affected
    }

    // Method to get all menu items for a specific restaurant based on restaurantId (rId)
    @Override
    public List<Menu> getAllRestarauntMenu(int rid) {
        menuList.clear();  // Clear the list to avoid retaining old data
        try {
            pstmt = con.prepareStatement(GET_RESTARAUNT_MENU_BY_ID);  // Prepare the SQL statement
            pstmt.setInt(1, rid);  // Set the restaurant ID (rId)
            rs = pstmt.executeQuery();  // Execute the query
            
            // Extract the menu items from the result set and add them to menuList
            menuList = (ArrayList<Menu>) extractMenuListFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;  // Return the list of menu items for the restaurant
    }

    // Method to get a menu item by its itemId
    @Override
    public Menu getMenuById(int itemId) {
        menuList.clear();  // Clear the list to avoid retaining old data
        try {
            PreparedStatement statement = con.prepareStatement(GET_MENU_BY_ID);  // Prepare the SQL statement
            statement.setInt(1, itemId);  // Set the itemId
            rs = statement.executeQuery();  // Execute the query
            
            // Extract the menu item details from the result set
            menuList = (ArrayList<Menu>) extractMenuListFromResultSet(rs);
            if (!menuList.isEmpty()) {
                m = menuList.get(0);  // Get the first (and only) menu item from the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;  // Return the menu item object
    }

    // Method to delete a menu item by its itemId
    @Override
    public int deleteMenuById(int itemId) {
        try {
            PreparedStatement statement = con.prepareStatement(DELETE_MENU_BY_ID);  // Prepare the SQL statement
            statement.setInt(1, itemId);  // Set the itemId
            x = statement.executeUpdate();  // Execute the delete operation
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;  // Return the number of rows affected
    }

    // Method to update the availability status of a menu item by its itemId
    @Override
    public int updateMenuById(int itemId, boolean isAvailable) {
        try {
            pstmt = con.prepareStatement(UPDATE_MENU_BY_ID);  // Prepare the SQL statement
            pstmt.setBoolean(1, isAvailable);  // Set the availability status
            pstmt.setInt(2, itemId);  // Set the itemId
            x = pstmt.executeUpdate();  // Execute the update operation
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;  // Return the number of rows affected
    }

    // Helper method to extract a list of Menu objects from the ResultSet
    List<Menu> extractMenuListFromResultSet(ResultSet rs) {
        ArrayList<Menu> menuList = new ArrayList<>();
        try {
            // Loop through the result set and create Menu objects for each row
            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("itemId"),  // Get itemId
                    rs.getInt("rId"),  // Get restaurantId (rId)
                    rs.getString("itemName"),  // Get item name
                    rs.getString("discription"),  // Get item description
                    rs.getInt("price"),  // Get price
                    rs.getBoolean("isAvailable"),  // Get availability status
                    rs.getString("imgPath")  // Get image path
                );
                menuList.add(menu);  // Add the Menu object to the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;  // Return the list of menu items
    }
}
