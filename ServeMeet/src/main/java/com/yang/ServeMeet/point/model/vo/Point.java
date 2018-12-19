package com.yang.ServeMeet.point.model.vo;

import java.util.Date;

public class Point {

	
	private static final long serialVersionUID = 1001L;
	
	private int userNo;
	private int increasePoint;
	private Date pDate;
	private String pContent;
	
	public Point() {
		super();
	}

	public Point(int userNo, int increasePoint, Date pDate, String pContent) {
		super();
		this.userNo = userNo;
		this.increasePoint = increasePoint;
		this.pDate = pDate;
		this.pContent = pContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getIncreasePoint() {
		return increasePoint;
	}

	public void setIncreasePoint(int increasePoint) {
		this.increasePoint = increasePoint;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	@Override
	public String toString() {
		return "Point [userNo=" + userNo + ", increasePoint=" + increasePoint + ", pDate=" + pDate + ", pContent="
				+ pContent + "]";
	}
	
	
	
	
	
}
