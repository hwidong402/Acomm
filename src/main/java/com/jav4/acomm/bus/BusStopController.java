package com.jav4.acomm.bus;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusStopController {
	
	@Autowired
	BusStopDAO dao;
	
	@RequestMapping("bus/busstopmap.bus")
	public void mapinfo(Model model, HttpSession session) {
		session.setAttribute("lat",35.12662329524179 );
		session.setAttribute("lon",129.0902600597399 );
		List<BusStopVO> list= dao.all();
		model.addAttribute("list",list);
	}	
	@RequestMapping("bus/busstopmap2.bus")
	public void mapinfo2(Model model, HttpSession session) {
		session.setAttribute("lat",35.12662329524179 );
		session.setAttribute("lon",129.0902600597399 );
		List<BusStopVO> list= dao.all();
		model.addAttribute("list",list);
	}	
}
