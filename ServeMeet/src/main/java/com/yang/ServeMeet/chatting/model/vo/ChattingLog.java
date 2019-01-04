package com.yang.ServeMeet.chatting.model.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChattingLog {

	private static final long serialVersionUID = 3001L;
	
	private int chattingId;
	private int userNo;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.m", timezone = "Asia/Seoul")
	private Timestamp chDate;
	private String chContent;
	private int chStatus;
	private String chattingName;
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
	
	public ChattingLog(int chattingId, int userNo, String chContent) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chContent = chContent;
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
		return "ChattingLog [chattingId=" + chattingId + ", userNo=" + userNo + ", chDate=" + chDate + ", chContent="
				+ chContent + ", chStatus=" + chStatus + ", chattingName=" + chattingName + "]";
	}
				   

	
	
	
	
}
