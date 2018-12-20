package com.yang.serveMeet.location.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.serveMeet.location.model.vo.Location;

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
}
