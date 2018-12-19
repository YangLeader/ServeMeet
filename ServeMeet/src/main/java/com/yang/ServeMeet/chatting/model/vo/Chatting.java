package com.yang.ServeMeet.chatting.model.vo;

public class Chatting {

	
	private static final long serialVersionUID = 3000L;
	
	private int chattingId;
	private String userName1;
	private String userName2;
	
	
	public Chatting() {
		super();
	}


	public Chatting(int chattingId, String userName1, String userName2) {
		super();
		this.chattingId = chattingId;
		this.userName1 = userName1;
		this.userName2 = userName2;
	}


	public int getChattingId() {
		return chattingId;
	}


	public void setChattingId(int chattingId) {
		this.chattingId = chattingId;
	}


	public String getUserName1() {
		return userName1;
	}


	public void setUserName1(String userName1) {
		this.userName1 = userName1;
	}


	public String getUserName2() {
		return userName2;
	}


	public void setUserName2(String userName2) {
		this.userName2 = userName2;
	}


	@Override
	public String toString() {
		return "Chatting [chattingId=" + chattingId + ", userName1=" + userName1 + ", userName2=" + userName2 + "]";
	}
	
	
	
	
	
	
}
