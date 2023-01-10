package com.jav4.acomm.restaurant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RestReplyDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<RestReplyVO> list(RestReplyVO vo) {
		return my.selectList("restreply.list",vo);
	}
	public int insert(RestReplyVO vo) {
		return my.insert("restreply.insert", vo);
	}
}
