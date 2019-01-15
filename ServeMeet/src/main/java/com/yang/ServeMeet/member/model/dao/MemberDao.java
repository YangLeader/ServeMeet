package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.member.model.vo.Member;

public interface MemberDao {

int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(int userNo);
	
	int updatePoint(HashMap<String, Integer> hmap);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);

	int checkNameDuplicate(HashMap<String, Object> hmap);

	String searchIdConfirm(HashMap<String, String> hmap);

	int getPoint(int userNo);

	List<String> memberSearch(Map<String,String> map);

	int searchPwdCheck(HashMap<String, String> hmap);

	int resetPwd(HashMap<String, String> hmap);
	
	int totalUser();

	int todayUser();

	int deleteUser();
	
	List<Map<String, String>> memberList(int cPage, int numPerPage);

	int memberTotalContents();
	
	int returnMember(int userNo);

}
