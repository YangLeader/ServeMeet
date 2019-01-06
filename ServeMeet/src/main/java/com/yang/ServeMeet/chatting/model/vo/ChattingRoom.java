package com.yang.ServeMeet.chatting.model.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChattingRoom {

	private static final long serialVersionUID = 3001L;
	
	private int chattingId;
	private int userNo;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.m", timezone = "Asia/Seoul")
	private Timestamp chDate;
	private String chContent;
	private int nCount;
	private String chattingName;
	public ChattingRoom(int chattingId, int userNo, Timestamp chDate, String chContent, int nCount,
			String chattingName) {
		super();
		this.chattingId = chattingId;
		this.userNo = userNo;
		this.chDate = chDate;
		this.chContent = chContent;
		this.nCount = nCount;
		this.chattingName = chattingName;
	}
	public ChattingRoom() {
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
	public int getnCount() {
		return nCount;
	}
	public void setnCount(int nCount) {
		this.nCount = nCount;
	}
	public String getChattingName() {
		return chattingName;
	}
	
	@Override
	public String toString() {
		return "ChattingRoom [chattingId=" + chattingId + ", userNo=" + userNo + ", chDate=" + chDate + ", chContent="
				+ chContent + ", nCount=" + nCount + ", chattingName=" + chattingName + "]";
	}
	
	
	
	
	
}
