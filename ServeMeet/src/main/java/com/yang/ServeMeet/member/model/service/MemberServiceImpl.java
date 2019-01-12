package com.yang.ServeMeet.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.member.model.dao.MemberDao;
import com.yang.ServeMeet.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectOne(String userId) {
		return memberDao.selectOne(userId);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(int userNo) {
		return memberDao.deleteMember(userNo);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = 
				new HashMap<String, Object>();
		
		hmap.put("userId", userId);
		
		return memberDao.checkIdDuplicate(hmap);
	}

	@Override
	public int checkNameDuplicate(String userName) {
		HashMap<String, Object> hmap = 
				new HashMap<String, Object>();
		
		hmap.put("userName", userName);
		return memberDao.checkNameDuplicate(hmap);
	}

	@Override
	public String searchIdConfirm(String userName, String email) {
		
		HashMap<String,String> hmap =  new HashMap<String, String>();
		
		hmap.put("userName", userName);
		hmap.put("email", email);
		
		
		return memberDao.searchIdConfirm(hmap);
	}

	

	@Override
	public int updatePoint(int userNo, int increasePoint) {
		HashMap<String,Integer> hmap = new HashMap<String,Integer>();

		hmap.put("userNo", userNo);
		hmap.put("increasePoint", increasePoint);
		
		return memberDao.updatePoint(hmap);
	}

	@Override
	public int getPoint(int userNo) {
		return memberDao.getPoint(userNo);
	}
	@Override
	public List<String> memberSearch(Map<String,String> map) {
		// TODO Auto-generated method stub
		return memberDao.memberSearch(map);
	}

	@Override
	public int searchPwdCheck(String userId, String email) {
		HashMap<String,String> hmap = new HashMap<String,String>();
		
		hmap.put("userId", userId);
		hmap.put("email",email);
		return memberDao.searchPwdCheck(hmap);
	}

	@Override
	public int resetPwd(String userId, String userPwd) {
		
		HashMap<String,String> hmap = new HashMap<String,String>();
		hmap.put("userId", userId);
		hmap.put("userPwd",userPwd);
		
		return memberDao.resetPwd(hmap);
		
	}

	@Override
	public int totalUser() {
		return memberDao.totalUser();
	}

	@Override
	public int todayUser() {
		return memberDao.todayUser();
	}

	@Override
	public int deleteUser() {
		return memberDao.deleteUser();
	}

}
