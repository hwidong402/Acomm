package com.jav4.acomm.bus;

import java.util.List;

public interface BusStopDAOInterface {

	List<BusStopVO> all();

	BusStopVO one(BusStopVO vo);

}