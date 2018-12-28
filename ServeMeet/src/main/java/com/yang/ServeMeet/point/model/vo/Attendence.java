package com.yang.ServeMeet.point.model.vo;

import java.util.Date;

public class Attendence {
	
	private static final long serialVersionUID = 1001L;
	
	private int att_id;
	private int userNo;
	private Date att_date;
	private int att_point;
	
	
	public Attendence() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Attendence(int att_id, int userNo, Date att_date, int att_point) {
		super();
		this.att_id = att_id;
		this.userNo = userNo;
		this.att_date = att_date;
		this.att_point = att_point;
	}


	public int getAtt_id() {
		return att_id;
	}


	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getAtt_date() {
		return att_date;
	}


	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}


	public int getAtt_point() {
		return att_point;
	}


	public void setAtt_point(int att_point) {
		this.att_point = att_point;
	}


	@Override
	public String toString() {
		return "Attendence [att_id=" + att_id + ", userNo=" + userNo + ", att_date=" + att_date + ", att_point="
				+ att_point + "]";
	}
	
	
	
	
	

}
