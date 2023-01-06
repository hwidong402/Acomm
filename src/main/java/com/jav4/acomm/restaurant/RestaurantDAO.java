package com.jav4.acomm.restaurant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RestaurantDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<RestaurantVO> list() {
		return my.selectList("restaurant.list");
	}

}
