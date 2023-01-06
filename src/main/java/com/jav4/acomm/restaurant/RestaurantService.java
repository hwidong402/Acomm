package com.jav4.acomm.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.member.MemberDAO;

@Service
public class RestaurantService {

	@Autowired
	RestaurantDAO rdao;
	
	@Autowired
	MemberDAO mdao;
	
	public List<RestaurantVO> list() {
		return rdao.list();
	}
}
