package com.yang.ServeMeet.member.model.vo;

import java.sql.Date;

public class Member {
	
	
	private static final long serialVersionUID = 1000L;
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private int point;
	private String userStatus;
	private Date entryDate;
	
	
	public Member() {
		super();
	}
	


	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}


	public Member(int userNo, String userPwd,String email) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.email = email;
	}




	public Member(int userNo, String userId, String userPwd, String userName, String email, String userStatus, Date entryDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.userStatus = userStatus;
		this.entryDate = entryDate;
	}



	public Date getEntryDate() {
		return entryDate;
	}



	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}



	public String getUserStatus() {
		return userStatus;
	}



	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}



	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", point=" + point + ", userStatus=" + userStatus + ", entryDate=" + entryDate
				+ "]";
	}
	
	
	
	

}
