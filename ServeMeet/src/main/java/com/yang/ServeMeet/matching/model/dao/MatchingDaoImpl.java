package com.yang.ServeMeet.matching.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingCondition;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

@Repository
public class MatchingDaoImpl implements MatchingDao {
	
	@Autowired
	SqlSessionTemplate session;	

	@Override
	public int matchingHistoryInsert(MatchingHistory mHistory) {
		
		return session.insert("Matching.insertMatchingHistory",mHistory);

	}
	
	@Override
	public List<MatchingListObj> myMatchingList(Map<String,String> map){

		return session.selectList("Matching.myMatchingList",map);
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
	public List<Map<String,Object>> selectMhTop7List(){
		
		return session.selectList("Matching.selectMhTop7List");
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
	public List<Map<String,String>> matchingSelectList(String type) {
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
		System.out.println("조회 결과 :" +session.selectList("Matching.matchingSelectList", cat));
		return session.selectList("Matching.matchingSelectList", cat);
	}

	@Override
	public MatchingListObj matchingDetail(Map map) {
		System.out.println("객체 : " + session.selectOne("Matching.matchingDetail", map));
		return session.selectOne("Matching.matchingDetail", map);
	}

	@Override
	public int matchingRequest(int matchingId, String writerName, String guestName, String content) {
		Matching m = new Matching();
		m.setMatchingId(matchingId);
		m.setmWriter(writerName);
		m.setmGuest(guestName);
		m.setmContent(content);
		
		return session.insert("Matching.matchingRequest", m);
	}
	@Override
	public int countMatchingCon(String userName) {
		return session.selectOne("Matching.countMatchingCon",userName);
	}
	@Override
	public List<MatchingListObj> topMatchingList(String category) {
		List<MatchingListObj> list = session.selectList("Matching.topMatchingList",category);
		System.out.println("list : "+list);
		return list;
	}
	@Override
	public List<MatchingListObj> searchMatching(Map map) {
		System.out.println("DAO Map : " + map);
		ArrayList<MatchingListObj> list = new ArrayList<MatchingListObj>();
		list = (ArrayList<MatchingListObj>) map.get("searchList");
		System.out.println("dd : " + list);
		for(int i=0; i<list.size(); i++) {
			String str1 = list.get(i).getBigLocation();
			String str2 = list.get(i).getMidLocation();
			String str3 = list.get(i).getSmallCategory();
			if(list.get(i).getMidLocation() == null && list.get(i).getSmallCategory() == null) {
				System.out.println("biglocation : " + str1 + " ,midlocation : " + str2 + ", smallcategory : " + str3 );
				System.out.println("전체 지역");
			}else if(list.get(i).getBigLocation() != null && list.get(i).getSmallCategory() == null) {
				System.out.println("biglocation : " + str1 + " ,midlocation : " + str2 + ", smallcategory : " + str3 );
				System.out.println("전체지역 + 중간지역");
			}else if(list.get(i).getBigLocation() != null && list.get(i).getSmallCategory() != null) {
				System.out.println("biglocation : " + str1 + " ,midlocation : " + str2 + ", smallcategory : " + str3 );
				System.out.println("전체지역 + 중간지역 + 마지막지역");
			}
			
		}
		return session.selectList("Matching.matchingSearch", map);
	}
@Override
	public List<MatchingCondition> matchingConditions(int matchingId) {
		// TODO Auto-generated method stub
		return session.selectList("Matching.matchingConditions",matchingId);
	}
	@Override
	public String matchingAccept(int conId) {
		// TODO Auto-generated method stub
		int resutl = session.update("Matching.matchingAccept",conId);
		String str=String.valueOf(resutl);
		return str;
	}
	@Override
	public String matchingDecline(int conId) {
		int resutl = session.update("Matching.matchingDecline",conId);
		String str=String.valueOf(resutl);
		return str;

	}
	@Override
	public String matchingDeclineAll(Map<String,Integer> map) {
		int resutl = session.update("Matching.matchingDeclineAll",map);
		String str=String.valueOf(resutl);
		return str;
	}
	
	@Override
	public int mHistoryContentCount() {
		
		return session.selectOne("Matching.mHistoryContentCount");
	}
	
	@Override
	public int battingIdSelect(int matchingId) {
		
		return session.selectOne("Matching.battingIdSelect",matchingId);
	}
}
