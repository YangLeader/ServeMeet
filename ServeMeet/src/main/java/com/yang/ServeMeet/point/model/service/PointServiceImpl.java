package com.yang.ServeMeet.point.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.point.model.dao.PointDao;
import com.yang.ServeMeet.point.model.vo.Attendence;
import com.yang.ServeMeet.point.model.vo.Point;

@Service
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


	@Override
	public int insertAtt(Attendence a) {
		return pointDao.inserAtt(a);
	}

	@Override
	public List<Attendence> selectAtt(int userNo) {
		return pointDao.selectAtt(userNo);
	}

	@Override
	public int selectAttCnt(int userNo) {
		return pointDao.selectAttCnt(userNo);
	}

	@Override
	public int getCount(Point point) {
	
		return pointDao.getCount(point);
	}
	
	@Override
	public int insertBattingPoint(List<Map<String,Object>> list) {
		
		System.out.println("포인트 service " + list);
		return pointDao.insertBattingPoint(list);
	}

	@Override
	public List<Map<String, String>> selectPointList(int cPage, int numPerPage, int userNo) {
		return pointDao.selectPointList(cPage,numPerPage,userNo);
	}

	@Override
	public int selectPointTotalContents(int userNo) {
		return pointDao.selectPointTotalContents(userNo);
	}

}
