package com.yang.ServeMeet.chatting.model.vo;

public class ChatUser {
	private int chattingId;
	private String userName;
	@Override
	public String toString() {
		return "ChatUser [chattingId=" + chattingId + ", userName=" + userName + "]";
	}
	public ChatUser(int chattingId, String userName) {
		super();
		this.chattingId = chattingId;
		this.userName = userName;
	}
	public ChatUser() {
		super();
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

	
	

}
