package com.yang.ServeMeet.chatting.model.vo;

import java.util.Date;

public class ChattingLog {

	private static final long serialVersionUID = 3001L;
	
	private int chattingId;
	private int userNo;
	private Date chDate;
	private String chContent;
	private String chStatus;

	public ChattingLog() {
		super();
	}

	
	public ChattingLog(int userNo, Date chDate, String chContent) {
		super();
		this.userNo = userNo;
		this.chDate = chDate;
		this.chContent = chContent;
	}
	


	public ChattingLog(int chattingId, int userNo, String chContent, String chStatus) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chContent = chContent;
		this.chStatus = chStatus;
	}


	public ChattingLog(int chattingId, int userNo, Date chDate, String chContent, String chStatus) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chDate = chDate;
		this.chContent = chContent;
		this.chStatus = chStatus;
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

	public Date getChDate() {
		return chDate;
	}

	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}

	public String getChContent() {
		return chContent;
	}

	public void setChContent(String chContent) {
		this.chContent = chContent;
	}

	public String getChStatus() {
		return chStatus;
	}

	public void setChStatus(String chStatus) {
		this.chStatus = chStatus;
	}

	@Override
	public String toString() {
		return "ChattingLog [chattingId=" + chattingId + ", userNo=" + userNo + ", chDate=" + chDate
				+ ", chContent=" + chContent + ", chStatus=" + chStatus + "]";
	}
	
	
	
	
}
