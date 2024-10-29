package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.UserDAO;
import com.foodapp.dto.User;


public class UserDAOImpl implements UserDAO {
	int x=-1;
	ArrayList<User> userlist=new ArrayList<User>();
	User user=null;
	static Connection con =null;
	private PreparedStatement pstmt=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	
	private static final String INSERT_USER="insert into user(`name`,`email`,`password`,`address`)"
			+ " values(?,?,?,?)";
	private static final String GET_ALL_USERS="select *  from user";
	private static final String GET_USER_BY_ID="select *  from user where id=?";
	private static final String GET_USER_BY_EMAIL="select *  from user where email=?";
	private static final String DELETE_USER_BY_DELETE="delete from user where id=?";
	private static final String UPDATE_USER_BY_ID="update user set address=?  where id=?";
	private static final ResultSet ResultSet = null;
	
	static String url="jdbc:mysql://localhost:3306/online_food_delivey";
	static String un="root";
	static String psw="123456789";
	
	static  
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,un,psw);
			System.out.println("connection establish");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	
	@Override
	public int insertUser(User user) {
		
		try 
		{
			PreparedStatement pstmt = con.prepareStatement(INSERT_USER);
			 pstmt.setString(1, user.getUser_name());
			 pstmt.setString(2, user.getEmail());
			 pstmt.setString(3, user.getPassword());
			 pstmt.setString(4, user.getAdress());
			
			 
			 x=pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
		
	}

	@Override
	public List<User> getAllUsers() {
		
		try 
		{
			 stmt = con.createStatement();
			 rs = stmt.executeQuery(GET_ALL_USERS);
			 userlist=(ArrayList<User>) extractUserListFromResultSet(rs);
			 
			 
			 
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return userlist;
	}

	@Override
	public User getUserById(int id) {
		
		try 
		{
			PreparedStatement statement = con.prepareStatement(GET_USER_BY_ID);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			userlist=(ArrayList<User>) extractUserListFromResultSet(rs);
			user = userlist.get(0);
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return user;
	}
	@Override
	public User getUserByEmail(String email) {
	    try {
	        PreparedStatement statement = con.prepareStatement(GET_USER_BY_EMAIL);
	        statement.setString(1, email);
	        rs = statement.executeQuery();

	        // Check if there is a matching result before creating the User object
	        if (rs.next()) {
	            user = new User(
	            	rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("email"),
	                rs.getString("password"),
	                rs.getString("address")
	            );
	        } else {
	            user = null; // If no user is found, set the user to null
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}

	@Override
	public int deleteUserById(int id) {
		try 
		{
			PreparedStatement statement = con.prepareStatement(DELETE_USER_BY_DELETE);
			statement.setInt(1, id);
		    x=statement.executeUpdate();
			
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return x;
		
	}

	
	@Override
	public int updateUserById(int id, String address) {
		 try 
		 {
			pstmt = con.prepareStatement(UPDATE_USER_BY_ID);
			pstmt.setString(1, address);
			pstmt.setInt(2, id);
			x=pstmt.executeUpdate();
			
		 } 
		 catch (Exception e) 
		 {
			e.printStackTrace();
		 }
		return x;
	}
	
	
	List<User> extractUserListFromResultSet(ResultSet rs)
	{
		try 
		{
			while(rs.next())
			 {
				userlist.add(new User(rs.getString(1),
										   rs.getString(3),
										   rs.getString(2),
										   rs.getString(4))); 
			 }
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return userlist;
	}

	

}
