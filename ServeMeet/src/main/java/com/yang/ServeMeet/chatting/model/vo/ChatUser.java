package com.yang.ServeMeet.chatting.model.vo;

public class ChatUser {
	private int chattingId;
	private int userNo1;
	private int userNo2;
	public ChatUser(int chattingId, int userNo1, int userNo2) {
		super();
		this.chattingId = chattingId;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
	}
	public ChatUser() {
		super();
	}
	public int getChattingId() {
		return chattingId;
	}
	public void setChattingId(int chatNo) {
		this.chattingId = chatNo;
	}
	public int getUserNo1() {
		return userNo1;
	}
	public void setUserNo1(int userNo1) {
		this.userNo1 = userNo1;
	}
	public int getUserNo2() {
		return userNo2;
	}
	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}
	@Override
	public String toString() {
		return "ChatUser [chattingId=" + chattingId + ", userNo1=" + userNo1 + ", userNo2=" + userNo2 + "]";
	}
	
	

}
