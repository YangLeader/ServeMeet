package com.yang.ServeMeet.point.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@SessionAttributes(value= {"member"})
@Controller
public class PointController {
	
	private Logger logger = LoggerFactory.getLogger(PointController.class);
	
	@RequestMapping("/point/point.do")
	public String point() {
		if(logger.isDebugEnabled()) logger.debug("포인트 페이지 고");
		return "point/point";
	}
	
	@RequestMapping("/point/attendence.do")
	public String attendence() {
		if(logger.isDebugEnabled()) logger.debug("출석체크 페이지 고");
		return "point/attendence";
	}
}
