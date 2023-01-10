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

}
