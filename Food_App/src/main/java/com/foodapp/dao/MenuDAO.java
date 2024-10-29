package com.foodapp.dao;

import java.util.List;
import com.foodapp.dto.Menu;

public interface MenuDAO {
	int insertMenu(Menu m);
	List<Menu> getAllRestarauntMenu(int rid);
	Menu getMenuById(int itemIdd);
	int deleteMenuById(int itemId);
	int updateMenuById(int itemId, boolean isAvailable);
}
