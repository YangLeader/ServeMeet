package com.yang.ServeMeet.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.yang.ServeMeet.point.model.dao.PointDao;
import com.yang.ServeMeet.point.model.vo.Point;

public class PointServiceImpl implements PointService {

	
	@Autowired
	private PointDao pointDao;
	
	
	
	@Override
	public int insertPoint(Point point) {
		
		return pointDao.insertPoint(point);
	}

	@Override
	public Point selectOne(int userNo) {
		return pointDao.selectOne(userNo);
	}

	@Override
	public int updatePoint(Point point) {
		return pointDao.updatePoint(point);
	}

	@Override
	public int deletePoint(int userNo) {
		return pointDao.deletePoint(userNo);
	}

}
