package com.jav4.acomm.bus;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BusStopDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<BusStopVO> all() {
		return my.selectList("busstop.all");
	}
	public BusStopVO one(BusStopVO vo) {
		return my.selectOne("busstop.one", vo);
	}
	
}
