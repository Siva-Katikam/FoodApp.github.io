package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.daoImpl.UserDAOImpl;
import com.foodapp.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class Login extends HttpServlet {
		private HttpSession session;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) 
				throws ServletException, IOException 
		{
			String email = req.getParameter("email");
			String psw = req.getParameter("password");
			UserDAOImpl udaoimpl = new UserDAOImpl();
			
			User user = udaoimpl.getUserByEmail(email);
			if (user != null) 
			{
				if (psw.equals(user.getPassword())) 
				{
					 System.out.println(user.getUser_id());
					session=req.getSession();
					session.setAttribute("user",user);
					
					// Inside the first servlet
					RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
					rd.forward(req, resp);
				} 
				else 
				{
					resp.sendRedirect(req.getContextPath() + "/incorrect.html"); // Correct redirection for incorrect password
				}
			} 
			else 
			{
				resp.sendRedirect(req.getContextPath() + "/RegisterPage.html"); // Should probably be a registration or "user not found" page
			}
			
		}
	
	

}
