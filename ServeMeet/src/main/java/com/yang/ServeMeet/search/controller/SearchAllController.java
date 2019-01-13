package com.yang.ServeMeet.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ServeMeet.search.model.service.SearchAllService;
@Controller
public class SearchAllController {
	@Autowired
	private SearchAllService sas;

	@RequestMapping("/searchAll.do")
	public String searchAll(@RequestParam String keyword, Model model) {

		return "common/searchAll";
	}
}
