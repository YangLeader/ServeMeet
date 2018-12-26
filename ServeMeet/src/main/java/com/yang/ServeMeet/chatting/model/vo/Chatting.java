package com.yang.ServeMeet.chatting.model.vo;

public class Chatting {

	private static final long serialVersionUID = 3000L;

	private int chattingId;
	private String chattingName;

	public Chatting(int chattingId, String chattingName) {
		super();
		this.chattingId = chattingId;
		this.chattingName = chattingName;
	}

	public Chatting() {
		super();
	}

	public int getChattingId() {
		return chattingId;
	}

	public void setChattingId(int chattingId) {
		this.chattingId = chattingId;
	}

	public String getChattingName() {
		return chattingName;
	}

	public void setChattingName(String chattingName) {
		this.chattingName = chattingName;
	}


	@Override
	public String toString() {
		return "Chatting [chattingId=" + chattingId + ", chattingName=" + chattingName + "]";
	}

}
