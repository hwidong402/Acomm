package com.jav4.acomm.bbs_reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jav4.acomm.bbs.BbsVO;

@Component
public class BbsReplyDAO {

	@Autowired
	SqlSessionTemplate my;
	
	// bbs의 전체 게시판 보기. 
	// cate별로 list를 최신 5개씩 들고와서 넘겨줌 
	public List<BbsReplyVO> getBbsReply(BbsReplyVO vo) {
		List<BbsReplyVO> bbsReply = my.selectList("bbsreply.getBbsReply", vo);
		return bbsReply;
	}
	
	// 댓글 넣기
	public void insertBbsReply(BbsReplyVO vo) {
		my.insert("bbsreply.insertBbsReply", vo);
	}
	// member code 2 nick
	public String mcode2nick(int code) {
		String nick = my.selectOne("bbsreply.mcode2nick", code);
		return nick;
	}
	// 댓글 삭제
	// id로 댓글 검색하여 댓글삭제
	public void deleteBbsReply(BbsReplyVO vo) {
		my.delete("bbsreply.deleteBbsReply", vo);
	}
		
}
