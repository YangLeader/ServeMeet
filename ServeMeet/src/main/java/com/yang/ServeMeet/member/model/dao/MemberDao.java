package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;

import com.yang.ServeMeet.member.model.vo.Member;

public interface MemberDao {

int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int updatePoint(HashMap<String, Integer> hmap);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);

	int checkNameDuplicate(HashMap<String, Object> hmap);

	String searchIdConfirm(HashMap<String, String> hmap);

	int getPoint(int userNo);

	int searchPwdCheck(HashMap<String, String> hmap);

	int resetPwd(HashMap<String, String> hmap);
}
