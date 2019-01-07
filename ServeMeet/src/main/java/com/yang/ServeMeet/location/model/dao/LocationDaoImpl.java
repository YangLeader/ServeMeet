package com.yang.ServeMeet.location.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.location.model.vo.Location;

@Repository
public class LocationDaoImpl implements LocationDao {

	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Override
	public List<Location> selectLoc() {
		return sqlsession.selectList("location.selectLoc");
	}

	@Override
	public List<Location> selectBloc(String bloc){
		System.out.println("dao:"+bloc);
	
			return sqlsession.selectList("location.selectBloc", bloc);

	}
	
	@Override
	public List<Location> selectSloc(String sloc){
		return sqlsession.selectList("location.selectCloc", sloc);
	}

	@Override
	public String locationCheck(String bigLoc,String midLoc,String smallLoc) {
		
		System.out.println("bigLoc : " + bigLoc);
		System.out.println("midLoc : " + midLoc);
		System.out.println("smallLoc : " + smallLoc);		
		
		Location loc = new Location();
		loc.setBigloCation(bigLoc);
		loc.setMidloCation(midLoc);
		loc.setSmallCategory(smallLoc);
		
		return sqlsession.selectOne("location.locationChk", loc);
	
	}
}
