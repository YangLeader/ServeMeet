package com.yang.ServeMeet.point.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Autowired
	private PointService pointService;

	@Autowired
	private MemberService memberService;
	
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
	
	@RequestMapping(value="point/pointAttend.do", method= RequestMethod.GET)
	public String pointAttend(Model model,Member m,@RequestParam int increasePoint,@RequestParam String pContent ) {
		if(logger.isDebugEnabled()) logger.debug("출석체크");
		
		int userNo	= m.getUserNo();
		
		Point p = new Point();
		p.setUserNo(userNo);
		p.setIncreasePoint(increasePoint);
		p.setpContent(pContent);
		
		Attendence a = new Attendence();
		a.setAtt_point(increasePoint);
		a.setUserNo(userNo);
		
		
		int result1 = memberService.updatePoint(userNo,increasePoint);
		int result2 = pointService.insertPoint(p);
		int result3 = pointService.insertAtt(a);
		
		String loc="/";
		String msg = "";
		String msg2 ="";
		String msg3 = "";
		if(result1 > 0 ) msg = "멤버포인트 업뎃되었습니다.";
		else msg = "멤포 업뎃 실패";
		
		if(result2 > 0) msg2 ="포인트 삽입";
		else msg2 ="포인트db삽입 실패";
		
		if(result3 > 0) msg2 ="출석 삽입";
		else msg3 ="출석db삽입 실패";
		
		model.addAttribute("loc",loc).addAttribute("msg",msg);
		System.out.println(msg2);
		System.out.println(msg3);
		return "common/msg";
		
	}
	
	
	
}
