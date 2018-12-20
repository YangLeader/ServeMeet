package com.yang.serveMeet.location.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.serveMeet.location.model.service.LocationService;
import com.yang.serveMeet.location.model.vo.Location;

@Controller
public class LocationController {

	@Autowired
	LocationService locService;
	
	@RequestMapping("location/location.do")
	public String location(Model model) {
		List<Location> list = locService.selectLoc();
		// System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "matching/matching";
	}
	
	@RequestMapping("location/bigLocation.do")
	public String midLoc(@RequestParam String bloc, Model model) {
		System.out.println("con:"+bloc);
		
		List<Location> list = locService.selectBloc(bloc);
		
		model.addAttribute("blist", list);
		
		return "matching/matching2";
	}
}
