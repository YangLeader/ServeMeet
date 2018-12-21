package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;

import com.yang.ServeMeet.member.model.vo.Member;

public interface MemberDao {

int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);
}
