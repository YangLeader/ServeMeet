package com.yang.ServeMeet.point.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yang.ServeMeet.member.model.service.MemberService;
import com.yang.ServeMeet.member.model.vo.Member;
import com.yang.ServeMeet.point.model.service.PointService;
import com.yang.ServeMeet.point.model.vo.Attendence;
import com.yang.ServeMeet.point.model.vo.Point;


@SessionAttributes(value= {"member"})
@Controller
public class PointController {
	
	private Logger logger = LoggerFactory.getLogger(PointController.class);
	/*
	@Autowired
	private PointService pointService;
	
	@Autowired
	private MemberService memberSerivce;
	*/
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
	
	/*@RequestMapping("point/pointAttend.do")
	public String pointAttend(Point p, Model model, Attendence a, Member m) {
		if(logger.isDebugEnabled()) logger.debug("출석체크");
		
		
		Date d = new Date();

		
		//p = new Point(m.getUserNo(),10,d,"출석에 의한 포인트");
		
		int result = pointService.insertPoint(p);
		
		String loc="/";
		String msg = "";
		
		if(result > 0 ) msg = "출석체크되었습니다.";
		else msg = "실패";
		
		model.addAttribute("loc",loc).addAttribute("msg",msg);
		
		return "common.msg";
		
	}*/
	
	
	
}
