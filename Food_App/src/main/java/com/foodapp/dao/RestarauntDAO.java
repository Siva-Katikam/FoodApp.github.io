package com.foodapp.dao;

import java.util.List;

import com.foodapp.dto.Restaraunt;



public interface RestarauntDAO {
	int insertRestaraunt(Restaraunt r);
	List<Restaraunt> getAllRestaraunt();
	Restaraunt getRestarauntById(int rId);
	int deleteRestarauntById(int rId);
	int updateRestarauntById(int rId, boolean isOpen);
}
