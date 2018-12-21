package com.yang.ServeMeet.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yang.ServeMeet.board.model.service.BoardService;

@Controller
public class boardController {

/*//	@Autowired
//	private BoardService boardService;
*/	
	@RequestMapping("/board/boardList.bo")
	public String selectBoardList() {
		
		return "board/boardList";
	}
}
