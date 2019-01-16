package com.yang.ServeMeet.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.yang.ServeMeet.common.util.Utils;
import com.yang.ServeMeet.member.model.service.MemberService;
import com.yang.ServeMeet.member.model.vo.Member;
import com.yang.ServeMeet.point.model.service.PointService;
import com.yang.ServeMeet.point.model.vo.Point;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberSearch.do")
	@ResponseBody
	public List<String> memberSearch(@RequestParam String keyword,HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		List<String> list = new ArrayList<String>();
		
		Member m = (Member)session.getAttribute("member");
		map.put("keyword", keyword);
		map.put("myName",m.getUserName() );
		list=memberService.memberSearch(map);
		
		return list;
	}
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		if(logger.isDebugEnabled()) logger.debug("회원가입페이지 고");
		return "member/memberEnroll";
	}
	
	
	
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
	if(logger.isDebugEnabled()) logger.debug("회원가입완료");
	
	// 원래 비밀번호
			String rawPassword = member.getUserPwd();
			System.out.println("비밀번호 암호화 전 : " +rawPassword);
			
			// ***** 암호화 코드 ***** //
			// BcryptPasswordEncoder - 랜덤 salt 생성하는 암호 모듈
			 member.setUserPwd(bcryptPasswordEncoder.encode(rawPassword));
			// $2a$10$YhQOO0726Fco64zmRybgGeKRYjA5wm/lcDonK81atI.00Y8NA06fu
			// $2a$10$ : 암호화에 사용된 알고리즘
			// ******************* //
			
			System.out.println("비밀번호 암호화 후 : "+member.getUserPwd());
			
			int result = memberService.insertMember(member);
			memberService.updatePoint(member.getUserNo(), 300);
			String loc = "/";
			String msg = "";
			
			if(result > 0) msg = "회원가입이 완료되었습니다!";
			else msg = "회원 가입 실패!";
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			
			return "common/msg";
	}
	
	@RequestMapping("/member/memberLoginView.do")
	public String memberLoginView() {
		return "member/memberLoginView";
	}
	
	@RequestMapping(value="/member/memberLogin.do",
	        method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String userId,
							  @RequestParam String userPwd) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 로그인 기능 확인!");
		
		ModelAndView mv = new ModelAndView();
		
		Member m = memberService.selectOne(userId);
		
		String loc = "/";
		String msg = "";
		
		
		if( m == null) {
			msg = "존재하지 않는 회원입니다.";
		} else {
			
			if(bcryptPasswordEncoder.matches(userPwd, m.getUserPwd())) {
				
				msg="login";
				
				// Model 객체는 일반적으로 데이터 저장 시 Request영역을 사용한다.
				// 하지만 @SessionAttribute 어노테이션을 활용하면
				// 세션 영역에 데이터를 저장할 수 도 있다.
				mv.addObject("member", m);
				if(userId.equals("admin")) {
					loc="/admin/admin.do";
				}
			} else {
				msg = "비밀번호가 틀렸습니다!";
			}
		}
		
		mv.addObject("loc", loc).addObject("msg", msg);
		
		
			mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus,
			HttpSession session, Model model) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 로그아웃 실행 확인!");
		
		// 현재 세션의 상태를 완료됨으로 처리함으로써 세션을 종료 시키는 방법
		if( !sessionStatus.isComplete()) sessionStatus.setComplete();
		// session.invalidate();
		
		String loc = "/";
		String msg= "로그아웃 되었습니다.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView() {
		
		if(logger.isDebugEnabled()) logger.debug("회원 상세 페이지 이동 확인!");
		
		return "member/myPage";
		
	}
	
	@RequestMapping("member/memberUpdate.do")
	public ModelAndView memberUpdate(Member m) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 정보 수정 확인!");
		
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.updateMember(m);
		
		String loc = "/";
		String msg ="";
		
		if(result > 0) {
			
			msg="회원 정보가 수정되었습니다!";
			mv.addObject("member", m);
			
		} else msg = "회원 정보 수정 실패!";
		
		mv.addObject("loc", loc).addObject("msg", msg)
		.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, 
			Member m, Model model) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 정보 삭제 확인!");
		
		int result = memberService.deleteMember(m.getUserNo());
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			msg = "탈퇴되었습니다.";
			sessionStatus.setComplete();
		} else {
			msg = "회원 탈퇴 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/member/memberReturn.do")
	public String memberReturn(SessionStatus sessionStatus, 
			Member m, Model model) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 복구 확인!");
		
		int result = memberService.returnMember(m.getUserNo());
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			msg = "회원 복구 성공!";
			sessionStatus.setComplete();
		} else {
			msg = "회원 복구 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		
		if(logger.isDebugEnabled()) logger.debug("아이디 일치 여부 확인!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/checkNameDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkNameDuplicate(@RequestParam String userName){
		
		if(logger.isDebugEnabled()) logger.debug("닉네임 일치 여부 확인!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkNameDuplicate(userName) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/searchId.do")
	public String searchId() {
		if(logger.isDebugEnabled()) logger.debug("아이디 찾기 페이지 고");
		return "member/searchId";
	}
	
	@RequestMapping("/member/searchPwd.do")
	public String searchPwd() {
		if(logger.isDebugEnabled()) logger.debug("비밀번호 찾기 페이지 고");
		return "member/searchPwd";
	}
	
	@RequestMapping("/member/memberInfo.do")
	public String memberInfo() {
		if(logger.isDebugEnabled()) logger.debug("내 정보 페이지 고");
		return "member/memberInfo";
	}
	
	@RequestMapping("/member/searchIdConfirm.do")
	@ResponseBody
	public String searchIdConfirm(@RequestParam String userName, @RequestParam String email){
		
		if(logger.isDebugEnabled()) logger.debug("아이디 일치 여부 확인!");
		
		String isSame = memberService.searchIdConfirm(userName,email);
		
		return isSame;
	}
	
	@RequestMapping("/member/searchPwdCheck.do")
	@ResponseBody
	public int searchPwdCheck(@RequestParam String userId, @RequestParam String email){
		
		if(logger.isDebugEnabled()) logger.debug("아이디와 이메일 일치 여부 확인!");
		
		int isSame = memberService.searchPwdCheck(userId,email);
		return isSame;
	}
	
	@RequestMapping("/member/sendEmail.do")
	@ResponseBody
	public int sendPwdEmail(@RequestParam String email) {
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";		
			String hostSMTPid = "**@naver.com"; // 본인의 아이디 입력		
			String hostSMTPpwd = "**"; // 비밀번호 입력
			
			// 보내는 사람 EMail, 제목, 내용 
			String fromEmail = "servemeet19@naver.com"; // 보내는 사람 eamil
			String fromName = "ServeMeet";  // 보내는 사람 이름
			String subject = "이메일 발송 테스트"; // 제목
			
			// 받는 사람 E-Mail 주소
			String mail = email;  // 받는 사람 email	
			
			// 인증번호 랜덤 6자리
			int identify = (int)(Math.random()*100000)+100000;
			
			try {
				HtmlEmail hEmail = new HtmlEmail();
				hEmail.setDebug(true);
				hEmail.setCharset(charSet);
				hEmail.setSSL(true);
				hEmail.setHostName(hostSMTP);
				hEmail.setSmtpPort(587);	// SMTP 포트 번호 입력

				hEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
				hEmail.setTLS(true);
				hEmail.addTo(mail, charSet);
				hEmail.setFrom(fromEmail, fromName, charSet);
				hEmail.setSubject(subject);
				hEmail.setHtmlMsg("<div width ='500px' height='100px'><p><b>비밀번호 변경을 위한 인증메일입니다.</b><br><hr><br> 인증번호는 "+identify+"입니다.</p></div>"); // 본문 내용
				hEmail.send();			
			} catch (Exception e) {
				System.out.println(e);
			}
			
			return identify;
	}
	
	@RequestMapping("/member/resetPwd.do")
	@ResponseBody
	public String resetPwd(@RequestParam String userId, @RequestParam String userPwd){
		
		if(logger.isDebugEnabled()) logger.debug("비밀번호 변경 확인!");
		
		ModelAndView mv = new ModelAndView();
		
		String password = bcryptPasswordEncoder.encode(userPwd);
		
		memberService.resetPwd(userId,password);
		
		String loc = "/";
		String msg ="비밀번호 변경 완료!";
		
		
		
		mv.addObject("loc", loc).addObject("msg", msg)
		.setViewName("common/msg");
		
		return "common/msg";
	}
	
	@RequestMapping("/member/totalUser")
	@ResponseBody
	public int totalUser() {
		if(logger.isDebugEnabled()) logger.debug("총 회원수 조회");
		
		int result = memberService.totalUser();
		
		return result;
	}
	
	@RequestMapping("/member/todayUser")
	@ResponseBody
	public int todayUser() {
		if(logger.isDebugEnabled()) logger.debug("오늘 가입한 회원수 조회");
		
		int result = memberService.todayUser();
		
		return result;
	}
	
	@RequestMapping("/member/deleteUser")
	@ResponseBody
	public int deleteUser() {
		if(logger.isDebugEnabled()) logger.debug("총 회원수 조회");
		
		int result = memberService.deleteUser();
		
		return result;
	}
	
	@RequestMapping(value="member/memberList.do", method= RequestMethod.GET)
	public String memberList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(memberService.memberList(cPage, numPerPage));
		
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = memberService.memberTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminMember.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		return "member/memberList";
	}
	
	
	

}
