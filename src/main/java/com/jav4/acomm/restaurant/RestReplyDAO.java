package com.jav4.acomm.restaurant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RestReplyDAO {

	@Autowired
	SqlSessionTemplate my;
	// 상가하나의 후기 전체 검색
	public List<RestReplyVO> list(RestReplyVO vo) {
		return my.selectList("restreply.list",vo);
	}
	
	//후기 insert
	public int insert(RestReplyVO vo) {
		return my.insert("restreply.insert", vo);
	}
	
	//후기 delete
	public int delete(RestReplyVO vo) {
		return my.delete("restreply.delete", vo);
	}
	public RestReplyVO myreview(RestReplyVO vo) {
		return my.selectOne("restreply.myreview", vo);
	}
	public List<RestReplyVO> otherreview(RestReplyVO vo) {
		return my.selectList("restreply.otherreview", vo);
	}
	public List<RestReplyVO> posreview(RestReplyVO vo) {
		return my.selectList("restreply.posreview", vo);
	}
	public List<RestReplyVO> negreview(RestReplyVO vo) {
		return my.selectList("restreply.negreview", vo);
	}
	
}
