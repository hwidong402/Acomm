package com.jav4.acomm.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	// bbs의 전체 게시판 보기. 
	// cate별로 list를 최신 5개씩 들고와서 넘겨줌 
	public List<BbsVO> list5(BbsVO vo) {
		List<BbsVO> list5 = my.selectList("bbs.list5", vo);
		return list5;
	}
	
	// cate별로 상세 게시판 보기. 
	// 세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시글 목록 들고오기
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.all", vo);
		return list;
	}
	
	// 게시글 보기
	// <a href>의 bbs_id로 게시글 정보 가져오기
	public BbsVO one(BbsVO vo) {
		return my.selectOne("bbs.one", vo);
	}
	
	//게시글 작성 기능
	public void insert(BbsVO vo) {
		my.insert("bbs.create", vo);
	}

}
