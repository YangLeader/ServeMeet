package com.yang.ServeMeet.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yang.ServeMeet.point.model.vo.Point;

public class PointDaoImpl implements PointDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPoint(Point point) {
		
		return sqlSession.insert("point.insertPoint",point);
	}

	@Override
	public Point selectOne(int userNo) {
		return sqlSession.selectOne("point.selectOne",userNo);
	}

	@Override
	public int updatePoint(Point point) {
		return sqlSession.update("point.updatePoint",point);
	}

	@Override
	public int deletePoint(int userNo) {
		return sqlSession.delete("point.deletePoint",userNo);
	}

}
