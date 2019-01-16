package com.yang.ServeMeet.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.service.BoardService;
import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.common.util.Utils;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.yang.ServeMeet.member.model.vo.Member;

@SessionAttributes(value= {"member"})


@Controller
public class adminController {
	
	@Autowired
	private BoardService boardService;
	
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
	
	@RequestMapping("/admin/adminAnnouncement.do")
	public String adminAnnouncement(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, Model model) {
			
			int numPerPage = 10; // 한 페이지당 게시글 수
			
			// 1. 현재 페이지 게시글 목록 가져오기
			ArrayList<Map<String, String>> list = 
					new ArrayList<Map<String, String>>(boardService.selectBoardList(cPage, numPerPage));
			
			
			// 2. 전체 게시글 개수 가져오기
			int totalContents = boardService.selectBoardTotalContents();
			
			/*// 3. 페이지 계산 후 작성할 HTML 추가
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");*/
			
			model.addAttribute("list", list)
			.addAttribute("totalContents", totalContents);
		
		return "admin/adminAnnouncement";
	}
	
	
	@RequestMapping("/admin/announcementForm.do")
	public String announcementForm() {
		
		return "admin/announcementForm";
	}
	
	
	@RequestMapping("/admin/boardFormEnd.do")
	public String announcementFormEnd(Board board, Model model, HttpSession session,
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
							
					throw new BoardException("공지글 등록 오류!");
							
				}
				
				String loc = "/admin/adminAnnouncement.do";
				String msg = "";
						
				if(result > 0) {
					msg = "공지글이 등록되었습니다.";
					loc = "/admin/adminAnnouncement.do";
							
				} else {
					msg = "공지글 등록 실패!";
				}
					
				model.addAttribute("loc", loc).addAttribute("msg", msg);
						
				return "common/msg";
						
	}

}
