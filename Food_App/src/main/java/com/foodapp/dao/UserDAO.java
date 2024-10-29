package com.foodapp.dao;

import java.util.List;

import com.foodapp.dto.User;



public interface UserDAO {
	int insertUser(User user);
	List<User> getAllUsers();
	User getUserById(int id);
	User getUserByEmail(String email);
	int deleteUserById(int id);
	int updateUserById(int id, String address);
}
