package com.yang.ServeMeet.matching.model.vo;

import java.util.Date;

public class MatchingHistory {
	
	private static final long serialVersionUID = 2001L;
	
	private int mhistoryId;
	private int matchingId;
	private String userName;
	private String mhContent;
	private Date mhDate;
	private String mhStatus;
	
	public MatchingHistory() {
		super();
	}

	
	
	public MatchingHistory(int matchingId, String userName, String mhContent) {
		super();
		this.matchingId = matchingId;
		this.userName = userName;
		this.mhContent = mhContent;
	}



	public MatchingHistory(int mhistoryId, int matchingId, String userName, String mhContent, Date mhDate,
			String mhStatus) {
		super();
		this.mhistoryId = mhistoryId;
		this.matchingId = matchingId;
		this.userName = userName;
		this.mhContent = mhContent;
		this.mhDate = mhDate;
		this.mhStatus = mhStatus;
	}



	public int getMhistoryId() {
		return mhistoryId;
	}



	public void setMhistoryId(int mhistoryId) {
		this.mhistoryId = mhistoryId;
	}



	public int getMatchingId() {
		return matchingId;
	}



	public void setMatchingId(int matchingId) {
		this.matchingId = matchingId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getMhContent() {
		return mhContent;
	}



	public void setMhContent(String mhContent) {
		this.mhContent = mhContent;
	}



	public Date getMhDate() {
		return mhDate;
	}



	public void setMhDate(Date mhDate) {
		this.mhDate = mhDate;
	}



	public String getMhStatus() {
		return mhStatus;
	}



	public void setMhStatus(String mhStatus) {
		this.mhStatus = mhStatus;
	}



	@Override
	public String toString() {
		return "MatchingHistory [mhistoryId=" + mhistoryId + ", matchingId=" + matchingId + ", userName=" + userName
				+ ", mhContent=" + mhContent + ", mhDate=" + mhDate + ", mhStatus=" + mhStatus + "]";
	}

	
	
	
	
}
