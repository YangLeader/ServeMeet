package com.yang.ServeMeet.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yang.ServeMeet.member.model.vo.Member;

@SessionAttributes(value= {"member"})

@Controller
public class adminController {
	
	@RequestMapping("/admin/admin.do")
	public String admin(Model model,Member m) {
		String loc = "/";
		String msg = "";
		
		msg = "관리자만 접근 가능합니다.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		
		if(!(m.getUserId().equals("admin"))) {
			return "common/msg";
		}else {
		return "admin";
		}
	}
	
	@RequestMapping("/admin/adminMember.do")
	public String adminMember(Model model,Member m) {
		String loc = "/";
		String msg = "";
		
		msg = "관리자만 접근 가능합니다.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		
		if(!(m.getUserId().equals("admin"))) {
			return "common/msg";
		}else {
		return "admin/adminMember";
		}
	}
	
	@RequestMapping("/admin/adminReport.do")
	public String adminReport(Model model,Member m) {
		String loc = "/";
		String msg = "";
		
		msg = "관리자만 접근 가능합니다.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		
		if(!(m.getUserId().equals("admin"))) {
			return "common/msg";
		}else {
		return "admin/adminReport";
		}
	}
	
	
	@RequestMapping("/admin/adminPoint.do")
	public String adminPoint(Model model,Member m) {
		String loc = "/";
		String msg = "";
		
		msg = "관리자만 접근 가능합니다.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		
		if(!(m.getUserId().equals("admin"))) {
			return "common/msg";
		}else {
		return "admin/adminPoint";
		}
	}

}
