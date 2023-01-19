package com.jav4.acomm.restaurant;

import java.util.List;

public interface RestReplyDAOInterface {

	// 상가하나의 후기 전체 검색
	List<RestReplyVO> list(RestReplyVO vo);

	//후기 insert
	int insert(RestReplyVO vo);

	//후기 delete
	int delete(RestReplyVO vo);

	RestReplyVO myreview(RestReplyVO vo);

	List<RestReplyVO> otherreview(RestReplyVO vo);

	List<RestReplyVO> posreview(RestReplyVO vo);

	List<RestReplyVO> negreview(RestReplyVO vo);

}