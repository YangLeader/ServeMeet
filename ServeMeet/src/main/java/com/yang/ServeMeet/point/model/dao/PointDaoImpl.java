package com.yang.ServeMeet.point.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.point.model.vo.Attendence;
import com.yang.ServeMeet.point.model.vo.Point;

@Repository
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

	@Override
	public int inserAtt(Attendence a) {
		return sqlSession.insert("point.inserAttendence",a);
	}

	@Override
	public List<Attendence> selectAtt(int userNo) {
		return sqlSession.selectList("point.selectAtt",userNo);
	}

	@Override
	public int selectAttCnt(int userNo) {
		return sqlSession.selectOne("point.selectAttCnt",userNo);
	}

	@Override
	public int getCount(Point point) {
		
		return sqlSession.selectOne("point.getCount",point);
	}

	@Override
	public int insertBattingPoint(List<Map<String,Object>> list) {
		
		System.out.println("Point Dao : "+ list);
		int result = 0;
		
		for(int i = 0 ; i <list.size() ; i++) sqlSession.insert("point.insertBattingPoint",list.get(i));
		
		return result;
	}
	

}
