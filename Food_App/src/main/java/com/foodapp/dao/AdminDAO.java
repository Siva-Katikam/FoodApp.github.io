package com.foodapp.dao;

import com.foodapp.dto.Admin;

public interface AdminDAO {
	
	Admin getUserByEmail(String email);
}
