package com.yang.ServeMeet.member.model.service;

import java.util.HashMap;

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
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
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

}
