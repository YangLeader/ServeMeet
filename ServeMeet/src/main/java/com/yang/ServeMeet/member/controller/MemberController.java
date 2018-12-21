package com.yang.ServeMeet.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.yang.ServeMeet.member.model.service.MemberService;
import com.yang.ServeMeet.member.model.vo.Member;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	/*@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;*/
	
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
			// member.setUserPwd(bcryptPasswordEncoder.encode(rawPassword));
			// $2a$10$YhQOO0726Fco64zmRybgGeKRYjA5wm/lcDonK81atI.00Y8NA06fu
			// $2a$10$ : 암호화에 사용된 알고리즘
			// ******************* //
			
			System.out.println("비밀번호 암호화 후 : "+member.getUserPwd());
			
			int result = memberService.insertMember(member);
			
			String loc = "/";
			String msg = "";
			
			if(result > 0) msg = "회원 가입 성공!";
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
			
			if(userPwd.equals(m.getUserPwd())) {
				msg="로그인 성공";
				mv.addObject("member",m);
			}else {
				msg = "비밀번호가 틀렸습니다.";
			}
			//if(bcryptPasswordEncoder.matches(password, m.getUserPwd())) {
				
				msg="로그인 성공!";
				
				// Model 객체는 일반적으로 데이터 저장 시 Request영역을 사용한다.
				// 하지만 @SessionAttribute 어노테이션을 활용하면
				// 세션 영역에 데이터를 저장할 수 도 있다.
				//mv.addObject("member", m);
				
			//} else {
				//msg = "비밀번호가 틀렸습니다!";
			//}
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
		String msg= "로그아웃 성공";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String userId) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 상세 페이지 이동 확인!");
		
		return "member/memberView";
		
	}
	
	@RequestMapping("member/memberUpdate.do")
	public ModelAndView memberUpdate(Member m) {
		
		if(logger.isDebugEnabled()) logger.debug("회원 정보 수정 확인!");
		
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.updateMember(m);
		
		String loc = "/";
		String msg ="";
		
		if(result > 0) {
			
			msg="회원 정보 수정 성공!";
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
		
		int result = memberService.deleteMember(m.getUserId());
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			msg = "회원 탈퇴 성공!";
			sessionStatus.setComplete();
		} else {
			msg = "회원 탈퇴 실패!";
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

}
