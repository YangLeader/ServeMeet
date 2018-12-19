package com.yang.ServeMeet.chatting.model.vo;

import java.util.Date;

public class ChattingLog {

	private static final long serialVersionUID = 3001L;
	
	private int chattingId;
	private String userName;
	private Date chDate;
	private String chContent;
	private String chStatus;

	public ChattingLog() {
		super();
	}

	
	public ChattingLog(String userName, Date chDate, String chContent) {
		super();
		this.userName = userName;
		this.chDate = chDate;
		this.chContent = chContent;
	}


	public ChattingLog(int chattingId, String userName, Date chDate, String chContent, String chStatus) {
		super();
		this.chattingId = chattingId;
		this.userName = userName;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		return "ChattingLog [chattingId=" + chattingId + ", userName=" + userName + ", chDate=" + chDate
				+ ", chContent=" + chContent + ", chStatus=" + chStatus + "]";
	}
	
	
	
	
}
