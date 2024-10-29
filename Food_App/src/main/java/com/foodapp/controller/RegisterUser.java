package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoImpl.UserDAOImpl;
import com.foodapp.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addUser")
public class RegisterUser extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException 
	{
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		
		//resp.getWriter().println("welcome "+username+" "+ email);
		
		User user = new User(username,email,password,address);
		
		UserDAO udaoimpl=new UserDAOImpl();
		
		
		int x = udaoimpl.insertUser(user);
		
		if(x==0)
		{
			resp.sendRedirect("failure.html");
		}
		else
		{
			resp.sendRedirect("RegistrationUserSuccess.html");
		}
	}
}
