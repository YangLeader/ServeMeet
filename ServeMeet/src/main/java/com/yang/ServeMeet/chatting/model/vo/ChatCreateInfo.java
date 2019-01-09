package com.yang.ServeMeet.chatting.model.vo;

import java.util.List;

public class ChatCreateInfo {
	private String chatName;
	private List<String> userName;
	public ChatCreateInfo(String chatName, List<String> userName) {
		super();
		this.chatName = chatName;
		this.userName = userName;
	}
	public ChatCreateInfo() {
		super();
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public List<String> getUserName() {
		return userName;
	}
	public void setUserName(List<String> userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "chatCreateInfo [chatName=" + chatName + ", userName=" + userName + "]";
	}
	
	
}
