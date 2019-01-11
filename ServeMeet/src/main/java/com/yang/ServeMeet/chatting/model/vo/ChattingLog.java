package com.yang.ServeMeet.chatting.model.vo;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChattingLog {

	private static final long serialVersionUID = 3001L;
	
	private int chattingId;
	private int userNo;
	private String userName;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.m", timezone = "Asia/Seoul")
	private Timestamp chDate;
	private String chContent;
	private int chStatus;
	private String chattingName;
	private List<String> list;

	


	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public ChattingLog(int chattingId, int userNo, String userName, Timestamp chDate, String chContent, int chStatus,
			String chattingName, List<String> list) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.userName = userName;
		this.chDate = chDate;
		this.chContent = chContent;
		this.chStatus = chStatus;
		this.chattingName = chattingName;
		this.list = list;
	}

	public ChattingLog(int chattingId, int userNo, Timestamp chDate, String chContent, int chStatus,
			String chattingName) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chDate = chDate;
		this.chContent = chContent;
		this.chStatus = chStatus;
		this.chattingName = chattingName;
	}
	
	public ChattingLog(int chattingId, int userNo, String chContent,List<String> list) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chContent = chContent;
		this.list=list;
	}

	public ChattingLog() {
		super();
	}
	
	public int getChattingId() {
		return chattingId;
	}
	public void setChattingId(int chattingId) {
		this.chattingId = chattingId;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Timestamp getChDate() {
		return chDate;
	}
	public void setChDate(Timestamp chDate) {
		this.chDate = chDate;
	}
	public String getChContent() {
		return chContent;
	}
	public void setChContent(String chContent) {
		this.chContent = chContent;
	}
	public int getChStatus() {
		return chStatus;
	}
	public void setChStatus(int chStatus) {
		this.chStatus = chStatus;
	}
	public String getChattingName() {
		return chattingName;
	}
	public void setChattingName(String chattingName) {
		this.chattingName = chattingName;
	}

	@Override
	public String toString() {
		return "ChattingLog [chattingId=" + chattingId + ", userNo=" + userNo + ", userName=" + userName + ", chDate="
				+ chDate + ", chContent=" + chContent + ", chStatus=" + chStatus + ", chattingName=" + chattingName
				+ ", list=" + list + "]";
	}

				   

	
	
	
	
}
