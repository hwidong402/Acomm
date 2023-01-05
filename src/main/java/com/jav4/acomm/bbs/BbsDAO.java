package com.jav4.acomm.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jav4.acomm.member.MemberVO;


@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	// bbs의 전체 게시판 보기. 
	// cate별로 list를 최신 5개씩 들고와서 넘겨줌 
	public List<BbsVO> getList5(BbsVO vo) {
		List<BbsVO> list5 = my.selectList("bbs.getList5", vo);
		return list5;
	}
	
	// cate별로 상세 게시판 보기. 
	// 세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시글 목록 들고오기
	public List<BbsVO> getListCate(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.getListCate", vo);
		return list;
	}
	
	// noti write버튼 admin 필터링
	// id로 cls 확인
	public MemberVO id2cls(MemberVO mvo) { // memberVO import
        return my.selectOne("bbs.id2cls", mvo);
    }
	
	// 게시글 보기
	// <a href>의 bbs_id로 게시글 정보 가져오기
	public BbsVO getBbsPost(BbsVO vo) {
		return my.selectOne("bbs.getBbsPost", vo);
	}
	
	// 게시글 작성 
	public void insertPost(BbsVO vo) {
		my.insert("bbs.insertPost", vo);
	}
	
	// 게시글 수정
	// id로 게시글 검색하여 게시글의 content 값 수정하기
	public void updatePost(BbsVO vo) {
		my.update("bbs.updatePost", vo);
	}
	
	// 게시글 삭제
	// id로 게시글 검색하여 게시글삭제
	public void deletePost(BbsVO vo) {
		my.delete("bbs.deletePost", vo);
	}
	
}
