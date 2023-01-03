package com.jav4.acomm.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbshotDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	//실험용 리스트 내용전체 다들고오기
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.bbshotall",vo);
		return list;
	}
	
	public BbsVO one(BbsVO vo) {
		BbsVO one = my.selectOne("bbs.bbshotone", vo);
		return one;
	}
	
	public void bbsCount(int bbs_id) {
		// int count = my.update("bbs.bbshotup", bbs_id);
		my.update("bbs.bbshotup", bbs_id);
		// return count;
	}

}
