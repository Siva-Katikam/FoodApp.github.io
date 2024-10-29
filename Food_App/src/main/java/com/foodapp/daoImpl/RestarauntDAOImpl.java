package com.foodapp.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.RestarauntDAO;
import com.foodapp.dto.Restaraunt;



public class RestarauntDAOImpl implements RestarauntDAO {
	int x=-1;
	ArrayList<Restaraunt> resList=new ArrayList<Restaraunt>();
	Restaraunt r=null;
	static Connection con =null;
	private PreparedStatement pstmt=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	
	private static final String INSERT_RESTARAUNT="insert into restaraunt(`rId`, `name`,`cusineType`,`deliveryTime`, `isOpen`, `rating`, `imgPath`)"
			+ " values(?,?,?,?,?,?,?)";
	private static final String GET_ALL_RESTARAUNT="select *  from  restaraunt";
	private static final String GET_RESTARAUNT_BY_ID="select *  from  restaraunt where rId=?";
	private static final String DELETE_RESTARAUNT_BY_ID="delete from restaraunt where rId=?";
	private static final String UPDATE_RESTARAUNT_BY_ID="update restaraunt set isOpen=?  where RId=?";
	
	
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
	public int insertRestaraunt(Restaraunt r) 
	{
		try 
		{
			pstmt = con.prepareStatement(INSERT_RESTARAUNT);
			pstmt.setInt(1, r.getrId());
			pstmt.setString(2, r.getname());
			pstmt.setString(3, r.getCusineType());
			pstmt.setInt(4, r.getDeliveryTime());
			pstmt.setInt(5, r.isOpen());
			pstmt.setFloat(6, r.getRating());
			pstmt.setString(7, r.getimgPath());

			x = pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	

	@Override
	public List<Restaraunt> getAllRestaraunt() {
		try 
		{
            stmt = con.createStatement();
            rs = stmt.executeQuery(GET_ALL_RESTARAUNT);
            resList = (ArrayList<Restaraunt>) extractRestarauntListFromResultSet(rs);
        } 
		catch (Exception e) {
            System.out.println("Error fetching all restaurants: " + e.getMessage());
            e.printStackTrace();
        }
        return resList;
	}

	@Override
	public Restaraunt getRestarauntById(int rId) 
	{
		try 
		{
			PreparedStatement statement = con.prepareStatement(GET_RESTARAUNT_BY_ID);
			statement.setInt(1, rId);
			rs = statement.executeQuery();
			resList=(ArrayList<Restaraunt>) extractRestarauntListFromResultSet(rs);
			r = resList.get(0);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public int deleteRestarauntById(int rId) 
	{
		try 
		{
			pstmt = con.prepareStatement(DELETE_RESTARAUNT_BY_ID);
			pstmt.setInt(1, rId);
			x = pstmt.executeUpdate();
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		return x;
	}
	

	@Override
	public int updateRestarauntById(int rId, boolean isOpen) 
	{
		try 
		{
			pstmt = con.prepareStatement(UPDATE_RESTARAUNT_BY_ID);
			pstmt.setBoolean(1, isOpen);
			pstmt.setInt(2, rId);
			x = pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		return x;
	}
	
	List<Restaraunt> extractRestarauntListFromResultSet(ResultSet rs) {
	    try {
	        while (rs.next()) {
	        	resList.add(new Restaraunt(
	                rs.getInt(1),          
	                rs.getString(2),       
	                rs.getString(3),       
	                rs.getInt(4),         
	                rs.getInt(5),      
	                rs.getInt(6),        
	                rs.getString(7)       
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return resList;
	}

}
