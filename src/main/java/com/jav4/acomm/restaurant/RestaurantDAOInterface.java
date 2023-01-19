package com.jav4.acomm.restaurant;

import java.util.List;

public interface RestaurantDAOInterface {

	List<RestaurantVO> list();

	RestaurantVO one(RestaurantVO vo);

	int insert(RestaurantVO vo);

}