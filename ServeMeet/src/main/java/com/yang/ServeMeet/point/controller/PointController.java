package com.yang.ServeMeet.point.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	
	@RequestMapping("/point/scratch.do")
	public String scratch() {
		if(logger.isDebugEnabled()) logger.debug("스크래치 페이지 고");
		return "point/scratch";
	}
	@RequestMapping("/point/roulette.do")
	public String roulette() {
		if(logger.isDebugEnabled()) logger.debug("룰렛 페이지 고");
		return "point/roulette";
	}
	
	
	@RequestMapping("/point/attStamp.do")
	@ResponseBody
	public ArrayList<Integer> attStamp(Member m) {
		
		List<Attendence> a = pointService.selectAtt(m.getUserNo());
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		int cnt = pointService.selectAttCnt(m.getUserNo());
		
		list.add(cnt);
		
		for(int i = 0 ; i<cnt ; i++) {
			Date date = a.get(i).getAtt_date();
			
			SimpleDateFormat format = new SimpleDateFormat ("dd");

			int day = Integer.parseInt(format.format(date));
			
			list.add(day);
		}
			
		System.out.println("list :" + list);
		
		return list;
	}
	
	
	@RequestMapping(value="point/pointAttend.do", method= RequestMethod.GET)
	public int pointAttend(Model model,Member m,@RequestParam int increasePoint,@RequestParam String pContent ) {
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
		return 1;
		
	}
	
	
	@RequestMapping("/point/updatePoint.do")
	@ResponseBody
	public String pointScratch(@RequestParam int increasePoint,@RequestParam String pContent,Member m) {
		if(logger.isDebugEnabled()) logger.debug("포인트 업데이트");
		
		int userNo = m.getUserNo();
		
		Point p = new Point();
		p.setUserNo(userNo);
		p.setIncreasePoint(increasePoint);
		p.setpContent(pContent);
		
		int result1 = memberService.updatePoint(userNo,increasePoint);
		int result2 = pointService.insertPoint(p);
		
		String msg = "";
		String msg2 ="";
		
		if(result1 > 0 ) msg = "멤버포인트 업뎃되었습니다.";
		else msg = "멤포 업뎃 실패";
		
		if(result2 > 0) msg2 ="포인트 삽입";
		else msg2 ="포인트db삽입 실패";
		
		System.out.println(msg);
		System.out.println(msg2);
		
		
		return "point/scratch";
	}
	
	@RequestMapping("/point/getPoint.do")
	@ResponseBody
	public int getPoint(Member m) {
		if(logger.isDebugEnabled()) logger.debug("포인트 가져오기");
		
		int userNo = m.getUserNo();
		
		int result = memberService.getPoint(userNo);
		
		return result;
	}
	
	@RequestMapping("/point/getCount.do")
	@ResponseBody
	public int getCount(Member m,@RequestParam String pContent) {
		if(logger.isDebugEnabled()) logger.debug("포인트 횟수 가져오기");
		
		int userNo = m.getUserNo();
		
		Point p = new Point();
		p.setUserNo(userNo);
		p.setpContent(pContent);
		
		int result = pointService.getCount(p);
		
		return result;
	}
	
	
	
}
