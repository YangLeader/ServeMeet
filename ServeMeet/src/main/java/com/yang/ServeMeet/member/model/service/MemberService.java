package com.yang.ServeMeet.member.model.service;

import com.yang.ServeMeet.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(String userId);
	
	int checkNameDuplicate(String userName);

	String searchIdConfirm(String userName, String email);

	int updatePoint(int userNo, int increasePoint);

	int getPoint(int userNo);

	int searchPwdCheck(String userId, String email);

	int resetPwd(String userId, String userPwd);

}
