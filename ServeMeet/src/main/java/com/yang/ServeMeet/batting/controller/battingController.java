package com.yang.ServeMeet.batting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class battingController {

	@RequestMapping("/batting/battingInfo.do")
	public void battingInfo(Model model) {
		
		
		
		model.addAttribute("");
	}
}
