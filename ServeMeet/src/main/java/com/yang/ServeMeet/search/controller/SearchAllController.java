package com.yang.ServeMeet.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ServeMeet.matching.model.vo.MatchingListObj;
import com.yang.ServeMeet.search.model.service.SearchAllService;
@Controller
public class SearchAllController {
	@Autowired
	private SearchAllService sas;

	@RequestMapping("/searchAll.do")
	public String searchAll(@RequestParam String keyword, Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("keyword", keyword);
		map.put("cat", "1");
		List<MatchingListObj> meetList = new ArrayList<MatchingListObj>();
		meetList=sas.searchMeet(map);
		map.put("cat", "2");
		List<MatchingListObj> eSportsList = new ArrayList<MatchingListObj>();
		map.put("cat", "3");
		List<MatchingListObj> sportsList = new ArrayList<MatchingListObj>();
		return "common/searchAll";
	}
}
