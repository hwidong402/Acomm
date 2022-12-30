package com.jav4.acomm.apt;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.apt.AptVO;

@Repository
public class AptDAO {
		
	@Autowired
	SqlSessionTemplate my;
	public List<AptVO> readall(AptVO vo) {
		return my.selectList("apt.all",vo); //mapper로 가서 값을 담아오자
	}

	public List<AptVO> readcode(AptVO vo){
		return my.selectList("apt.code",vo);
	}
}
