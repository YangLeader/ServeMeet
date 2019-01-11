package com.yang.ServeMeet.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("/admin/admin.do")
	public String admin() {
		
		return "admin";
	}
	
	@RequestMapping("/admin/adminMember.do")
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	@RequestMapping("/admin/adminReport.do")
	public String adminReport() {
		
		return "admin/adminReport";
	}
	
	@RequestMapping("/admin/adminMatching.do")
	public String adminMatching() {
		
		return "admin/adminMatching";
	}
	
	@RequestMapping("/admin/adminPoint.do")
	public String adminPoint() {
		
		return "admin/adminPoint";
	}

}
