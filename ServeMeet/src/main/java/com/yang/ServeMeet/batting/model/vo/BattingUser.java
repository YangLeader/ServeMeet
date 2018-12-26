package com.yang.ServeMeet.batting.model.vo;

public class BattingUser {
	
	private static final long serialVersionUID = 5001L;
	
	private int battingId;
	private String userName;
	private String battingSelect;
	
	public BattingUser() {
		super();
	}


	
	public BattingUser(int battingId, String userName) {
		super();
		this.battingId = battingId;
		this.userName = userName;
	}


	public BattingUser(String userName, String battingSelect) {
		super();
		this.userName = userName;
		this.battingSelect = battingSelect;
	}



	public BattingUser(int battingId, String userName, String battingSelect) {
		super();
		this.battingId = battingId;
		this.userName = userName;
		this.battingSelect = battingSelect;
	}



	public int getBattingId() {
		return battingId;
	}



	public void setBattingId(int battingId) {
		this.battingId = battingId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getBattingSelect() {
		return battingSelect;
	}



	public void setBattingSelect(String battingSelect) {
		this.battingSelect = battingSelect;
	}



	@Override
	public String toString() {
		return "BattingUser [battingId=" + battingId + ", userName=" + userName + ", battingSelect=" + battingSelect
				+ "]";
	}
	
	

}
