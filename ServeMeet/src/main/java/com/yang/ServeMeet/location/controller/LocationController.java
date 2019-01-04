package com.yang.ServeMeet.location.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yang.ServeMeet.location.model.service.LocationService;
import com.yang.ServeMeet.location.model.vo.Location;

@Controller
public class LocationController {

	@Autowired
	LocationService locService;
	@RequestMapping("/location/location.do")
	public String location(Model model) {
		List<Location> list = locService.selectLoc();
		// System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "matching/matching";
	}
	
	@RequestMapping("/location/bigLocation.do")
	@ResponseBody
	public List<Location> bigLoc(){
		
		List<Location> list = locService.selectLoc();
		System.out.println("list : "+ list);
		List result = new ArrayList();
		
		for(Location loc : list) {
			if(loc!=null) {
				if(loc.getBigloCation() == null) {
					result.add(loc.getMidloCation());
				} else {
					result.add(loc.getBigloCation());
				}
			}
		}
		
		return result;
		
	}
	
	@RequestMapping("/location/midLocation.do")
	@ResponseBody
	public List<Location> midLoc(@RequestParam String bloc) {
		/*System.out.println("con:"+bloc);
		
		List<Location> list = locService.selectBloc(bloc);
		
		model.addAttribute("blist", list);
		
		return "matching/matching2";*/
		System.out.println("con : " + bloc);
		List<Location> list = locService.selectBloc(bloc);
		System.out.println("list : " + list);
		List result = new ArrayList();
		for(Location loc : list) {
			if(loc!=null) {
				if(loc.getMidloCation() == null) {
					System.out.println(loc.getSmallCategory());
					result.add(loc.getSmallCategory());
				}else {
					System.out.println(loc.getMidloCation());
					result.add(loc.getMidloCation());
				}
			}
		}
		 
		return result;
		
	}
	
	@RequestMapping("/location/smallLocaion.do")
	@ResponseBody
	public List<Location> smlLoc(@RequestParam String sloc){
		System.out.println("sloc_con : " + sloc);
		List<Location> list = locService.selectSloc(sloc);
		System.out.println("slec_list : " + list);
		List result = new ArrayList();
		for(Location loc : list) {
			if(loc!=null) {
				result.add(loc.getSmallCategory());
			}
			
		}
		
		return result;
	}
	
	@RequestMapping("/location/locationcheck.lc")
	@ResponseBody
	public String checkLoc(@RequestParam String chkloc) {
		
	/*	String bigLoc = chkloc[0];
		String midLoc = chkloc[1];
		String smallLoc = chkloc[2];
		
		System.out.println("bigLoc : " + bigLoc);
		System.out.println("midLoc : " + midLoc);
		System.out.println("smallLoc : " + smallLoc);
		*/
		System.out.println("JSON형식으로 받은 맵객체" + chkloc);
		
		Location paramLoc = new Gson().fromJson(chkloc, Location.class);
		
		String bigLoc = paramLoc.getBigloCation();
		String midLoc = paramLoc.getMidloCation();
		String smallLoc = paramLoc.getSmallCategory();
		System.out.println(paramLoc.getBigloCation());
		System.out.println(paramLoc.getMidloCation());
		System.out.println(paramLoc.getSmallCategory());
		/*System.out.println(chkloc.get("bigloCation"));
		System.out.println(chkloc.get("midloCation"));
		System.out.println(chkloc.get("smallCategory"));*/
		String result = locService.locationCheck(bigLoc, midLoc, smallLoc);
		
		System.out.println("result:" +result);
		return result;
		
	}
}
