package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;
import java.util.List;

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
	public int deleteMember(String userId) {
		return sqlSession.delete("member.deleteMember",userId);
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
	public int searchPwdConfirm(HashMap<String, String> hmap) {
		
		return sqlSession.selectOne("member.searchPwdConfirm", hmap);
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
	public List<String> memberSearch(String keyword) {
		// TODO Auto-generated method stub
		System.out.println("keywoardkeywoardkeywoardkeywoard"+keyword);
		List<String> list=sqlSession.selectList("member.memberSearch",keyword);
		System.out.println(list);
		return list;
	}

}
