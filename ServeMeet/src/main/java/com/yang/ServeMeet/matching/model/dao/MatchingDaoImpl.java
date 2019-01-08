package com.yang.ServeMeet.matching.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

@Repository
public class MatchingDaoImpl implements MatchingDao {
	
	@Autowired
	SqlSessionTemplate session;	

	@Override
	public int matchingHistoryInsert(MatchingHistory mHistory) {
		
		return session.insert("Matching.insertMatchingHistory",mHistory);

	}
	
	@Override
	public List<Map<String,String>> myMatchingList(String userName,String type){
		
		String mapperPath = type.equals("P") ? "Matching.myMatchingList" : "Matching.myMatchingEndList";
		
		return session.selectList(mapperPath,userName);
	}
	
	@Override
	public Map<String,String> mHistorySelectOne(int mHistoryId) {
		
		return session.selectOne("Matching.mHistorySelectOne",mHistoryId);
	}

	@Override

	public int matchingInsert(Matching matching) {

		return session.insert("Matching.insertMatching",matching);
	}


	public Matching matchingSelectOne(int matchingId) {
		
		return session.selectOne("Matching.matchingSelectOne",matchingId);
	}
	
	@Override
	public int insertMHistory(MatchingHistory mHistory) {
				
		return session.insert("Matching.mHistoryInsert",mHistory);
	}
	
	@Override
	public int insertMHistoryFile(BoardFile boardFile) {
		
		return session.insert("Matching.insertmHistoryFile", boardFile);
	}
	
	@Override
	public List<Map<String,String>> mHistoryList(){
		
		return session.selectList("Matching.mHistoryList");
	}

	@Override
	public List matchingSelectList(String type) {
		String cat = "";
		if(type.equals("M")) {
			System.out.println("소모임 입니다.");
			cat = "1";
		}else if(type.equals("S")) {
			System.out.println("스포츠 입니다.");
			cat = "2";
		}else {
			System.out.println("E-스포츠 입니다.");
			cat = "3";
		}
		return session.selectList("Matching.matchingSelectList", cat);
	}
}
