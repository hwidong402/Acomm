package com.jav4.acomm.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	//게시글 작성 기능
	public void insert(BbsVO vo) {
		my.insert("bbs.create", vo);
	}
	//게시글 삭제 기능
	public void delete(BbsVO vo) {

		my.delete("bbs.del", vo);

	}
	//id로 게시글 검색하여 게시글의 content 값 수정하기
	public void update(BbsVO vo) {

		my.update("bbs.up", vo);

	}
	// 코드값에 따른 게시글 목록 들고오기
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.all", vo);
		return list;

	}
	//실험용 리스트 내용전체 다들고오기
	public List<BbsVO> list2(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.all2",vo);
		return list;

	}
	//title과 code값으로 검색한 게시글 목록 가져오기
	public List<BbsVO> serch(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.search", vo);

		return list;
	}
	// 게시글 상세 보기용 게시글 하나의 내용가져오기
	public BbsVO one(BbsVO vo) {

		return my.selectOne("bbs.one", vo);
	}

}
