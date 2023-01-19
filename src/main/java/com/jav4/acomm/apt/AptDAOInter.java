package com.jav4.acomm.apt;

import java.util.List;

public interface AptDAOInter {

	List<AptVO> readall(AptVO vo);

	List<AptVO> readcode(AptVO vo);

	AptVO city(AptVO vo);

}