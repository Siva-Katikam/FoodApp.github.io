package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.daoImpl.UserDAOImpl;
import com.foodapp.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String email = req.getParameter("email");
        UserDAOImpl userDao = new UserDAOImpl();
        User user = userDao.getUserByEmail(email);
        
        if (user != null) {
            // Code to send the reset link via email
            // Example: EmailUtils.sendResetLink(email);
            resp.sendRedirect(req.getContextPath() + "/EmailSent.jsp");
        } else {
            // Handle case when user is not found
            req.setAttribute("error", "Email not found");
            req.getRequestDispatcher("/ForgotPassword.html").forward(req, resp);
        }
    }
}
