package com.yang.ServeMeet.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.common.util.Utils;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/boardList.do")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(boardService.selectBoardList(cPage, numPerPage));
		
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = boardService.selectBoardTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "board/boardList";
	}
	
	@RequestMapping("/board/boardForm.do")
	public String boardForm() {
		
		return "board/boardForm";
	}
	
	@RequestMapping("/board/boardFormEnd.do")
	public String insertBoard(Board board, Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {

		// 1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
				
		List<BoardFile> boardFileList = new ArrayList<BoardFile>();
				
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
				
		System.out.println("폴더가 있나요? " + dir.exists());
				
		if(dir.exists() == false) dir.mkdirs();
				
		// 3. 파일 업로드 시작 
		for(MultipartFile f : upFile) {
			
			System.out.println("f 가 존재 하는가? " + f.getOriginalFilename());
			if(!f.isEmpty()) {
				// 원본 이름 가져오기
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
						
				int rnNum = (int)(Math.random() * 1000);
						
				// 서버에서 저장 후 관리할 파일 명
				String changeName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
						
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	
				BoardFile bf = new BoardFile();
				bf.setOriginName(originName);
				bf.setChangeName(changeName);
				
				System.out.println("원본 이름 : " + bf.getOriginName());
				System.out.println("바뀐 이름 : " + bf.getChangeName());
						
				boardFileList.add(bf);
			}
		}
		
				
		int result;
				
		try {
					
			result = boardService.insertBoard(board, boardFileList);
					
		} catch(Exception e) {
					
			throw new BoardException("게시글 등록 오류!");
					
		}
				
		String loc = "/board/boardList.do";
		String msg = "";
				
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/board/boardView.do?no="+board.getBoardNo();
					
		} else {
			msg = "게시글 등록 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
		
	}
	
	@RequestMapping("/board/boardView.do")
	public String selectOneBoard(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, @RequestParam int no, Model model) {
		
		int totalContents = boardService.selectBoardTotalContents();
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		boardService.updateViewCount(no);
		
		model.addAttribute("board", boardService.selectOneBoard(no))
		.addAttribute("boardFileList", boardService.selectBoardFileList(no))
		.addAttribute("list", boardService.selectBoardList(cPage, numPerPage))
		.addAttribute("pageBar", pageBar)
		.addAttribute("cList", boardService.selectCommentList(no));
		
		return "board/boardView";
		
	}
	
	@RequestMapping("/board/boardUpdateView.do")
	public void boardUpdateView(@RequestParam("no") int boardNo, Model model) {
		
		model.addAttribute("board",boardService.selectOneBoard(boardNo))
		.addAttribute("boardFileList", boardService.selectBoardFileList(boardNo));
		
	}
	
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(Board board, HttpSession session, Model model, 
			@RequestParam(value="upFile",required=false) MultipartFile[] upFiles) {
		int boardNo = board.getBoardNo();
		
		// 원본 게시글 내용 수정
		Board originBoard = boardService.selectOneBoard(boardNo);
		originBoard.setBoardTitle(board.getBoardTitle());
		originBoard.setBoardContent(board.getBoardContent());
		
		// 1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		List<BoardFile> boardFileList = boardService.selectBoardFileList(boardNo);
		if(boardFileList == null) boardFileList = new ArrayList<BoardFile>();
		
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 3. 파일 업로드 시작 (MultipartFile 사용 시 )
		int idx = 0;
		for(MultipartFile f : upFiles) {
			BoardFile bf = null;
			if(!f.isEmpty()) {
				// 원본 파일 삭제
				if(boardFileList.size() > idx) {
					boolean delelteFile = new File(saveDir+"/"+boardFileList.get(idx).getChangeName()).delete();
				
					System.out.println("원본파일 삭제 여부 : " + delelteFile);
					
					bf = boardFileList.get(idx);
				} else {
					bf = new BoardFile();
					bf.setBoardNo(boardNo);
					
					boardFileList.add(bf);
				}
				// 원본 이름 가져오기
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rndNum = (int)(Math.random() * 1000);
				
				// 서버에서 저장 후 관리할 파일 명
				String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				bf.setOriginName(originName);
				bf.setChangeName(renamedName);
				
				boardFileList.set(idx, bf);
			}
			
			idx++;
		}
		
		int result = boardService.updateBoard(board, boardFileList);
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
			
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam("no") int boardNo, HttpSession session, Model model) {
		
		List<BoardFile> delList = boardService.selectBoardFileList(boardNo);
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		// 첨부 파일 삭제
		if(delList != null) for(BoardFile bf : delList) new File(saveDir + "/" + bf.getChangeName()).delete();
		
		int result = boardService.deleteBoard(boardNo);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
			
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/board/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName, HttpSession session){
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		boolean check = boardService.deleteFile(attNo) != 0 ? true : false;
		
		if(check) new File(saveDir + "/" + rName).delete();
		
		return check;
	}
	
	// ---------------- BoardComment 관련 ----------------- //
	
	@RequestMapping("/board/insertComment.do")
	public String insertComment(BoardComment bComment, Model model) {
		
		// 성공
		/*System.out.println(bComment.getBoardNo());
		System.out.println(bComment.getUserName());
		System.out.println(bComment.getCommentCon());*/
		
		int result;
		
		
		try {
					
			result = boardService.insertBoardComment(bComment);
					
		} catch(Exception e) {
					
			throw new BoardException(e.getMessage());
					
		}
				
		String loc = "/board/boardList.do";
		String msg = "";
				
		if(result > 0) {
			msg = "댓글 등록 성공!";
			loc = "/board/boardView.do?no="+bComment.getBoardNo();
					
		} else {
			msg = "댓글 등록 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
	}
	
	@RequestMapping("/board/updateComment.do")
	public String updateComment(BoardComment bComment, Model model) {
		
		int result;
		
		try {
					
			result = boardService.updateBoardComment(bComment);
					
		} catch(Exception e) {
					
			throw new BoardException(e.getMessage());
					
		}
				
		String loc = "/board/boardList.do";
		String msg = "";
				
		if(result > 0) {
			msg = "댓글 수정 성공!";
			loc = "/board/boardView.do?no="+bComment.getBoardNo();
					
		} else {
			msg = "댓글 수정 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
	}
	
	@RequestMapping("/board/deleteComment.do")
	public String deleteComment(BoardComment bComment, Model model) {
		
		int result;
		
		try {
					
			result = boardService.deleteBoardComment(bComment);
					
		} catch(Exception e) {
					
			throw new BoardException(e.getMessage());
					
		}
				
		String loc = "/board/boardList.do";
		String msg = "";
				
		if(result > 0) {
			msg = "댓글 삭제 성공!";
			loc = "/board/boardView.do?no="+bComment.getBoardNo();
					
		} else {
			msg = "댓글 삭제 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
	}
	
	@RequestMapping("/board/searchBoard.do")
	public String searchBoard(@RequestParam("con") String condition, @RequestParam("keyword") String keyword, Model model) {
		
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		list = boardService.searchBoard(condition, keyword);
		
		model.addAttribute("list", list);
		
		return "board/boardList";
		
	}
	
	/*@RequestMapping("/board/reportBoard.do")
	public String reportBoard(@RequestParam("no") int boardNo, @RequestParam("name") String userName, Model model) {
		
		int result;
		
		
		try {
					
			result = boardService.reportBoard(boardNo, userName);
					
		} catch(Exception e) {
					
			throw new BoardException(e.getMessage());
					
		}
				
		String loc = "/board/boardList.do";
		String msg = "";
				
		if(result > 0) {
			msg = "댓글 삭제 성공!";
			loc = "/board/boardView.do?no="+ boardNo;
					
		} else {
			msg = "댓글 삭제 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
	}*/
}
