package com.yang.ServeMeet.member.model.dao;

import java.util.HashMap;

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

}
