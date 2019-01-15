package com.yang.ServeMeet.member.model.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(int i);
	
	int checkIdDuplicate(String userId);
	
	int checkNameDuplicate(String userName);

	String searchIdConfirm(String userName, String email);

	int updatePoint(int userNo, int increasePoint);

	int getPoint(int userNo);

	List<String> memberSearch(Map<String,String> map);

	int searchPwdCheck(String userId, String email);

	int resetPwd(String userId, String userPwd);

	int totalUser();

	int todayUser();

	int deleteUser();

	List<Map<String, String>> memberList(int cPage, int numPerPage);

	int memberTotalContents();

	int returnMember(int userNo);


}
