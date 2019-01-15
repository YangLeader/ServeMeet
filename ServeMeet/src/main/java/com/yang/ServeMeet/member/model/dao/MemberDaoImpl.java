package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		System.out.println(member);
		return sqlSession.insert("member.insertMember",member);
	}

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.loginMember",userId);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember",member);
	}

	@Override
	public int deleteMember(int userNo) {
		return sqlSession.delete("member.deleteMember",userNo);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("member.checkIdDuplicate",hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int checkNameDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("member.checkNameDuplicate",hmap);
		return (Integer)hmap.get("result");
	}

	@Override
	public String searchIdConfirm(HashMap<String,String> hmap) {
		String result = "";
		result = sqlSession.selectOne("member.searchIdConfirm", hmap);
		
		System.out.println("result : " + result);
		if(result == null) {
			result ="";
		}
		return result;
	}
	
	@Override
	public int updatePoint(HashMap<String,Integer> hmap) {
		
		return sqlSession.update("member.updatePoint",hmap);
	}

	@Override
	public int getPoint(int userNo) {
		return sqlSession.selectOne("member.getPoint",userNo);
	}
	@Override
	public List<String> memberSearch(Map<String,String> map) {
		// TODO Auto-generated method stub

		List<String> list=sqlSession.selectList("member.memberSearch",map);

		return list;
	}

	@Override
	public int searchPwdCheck(HashMap<String, String> hmap) {
		return sqlSession.selectOne("member.searchPwdCheck",hmap);
	}

	@Override
	public int resetPwd(HashMap<String, String> hmap) {
		return sqlSession.update("member.resetPwd",hmap);
	}

	@Override
	public int totalUser() {
		return sqlSession.selectOne("member.totalUser");
	}

	@Override
	public int todayUser() {
		return sqlSession.selectOne("member.todayUser");
	}

	@Override
	public int deleteUser() {
		return sqlSession.selectOne("member.deleteUser");
	}

	@Override
	public List<Map<String, String>> memberList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("member.memberList",null,rowBounds);
	}

	@Override
	public int memberTotalContents() {
		return sqlSession.selectOne("member.memberTotalContents");
	}

	@Override
	public int returnMember(int userNo) {
		return sqlSession.selectOne("member.returnMember",userNo);
	}

	

}
