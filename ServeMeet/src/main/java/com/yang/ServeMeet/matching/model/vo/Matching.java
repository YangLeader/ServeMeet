package com.yang.ServeMeet.matching.model.vo;

public class Matching {

	
	private static final long serialVersionUID = 2000L;
	
	private int matchingId;
	private String mTitle;
	private String mContent;
	private int mPeoplenum;
	private int locationId;
	private int categoryId;
	private String userName1;
	private String userName2;
	private String mStatus;
	
	public Matching() {
		super();
	}
	
	

	public Matching(String mTitle, String mContent, int mPeoplenum, int locationId, int categoryId, String userName1) {
		super();
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.userName1 = userName1;
	}



	public Matching(int matchingId, String mTitle, String mContent, int mPeoplenum, int locationId, int categoryId,
			String userName1, String userName2, String mStatus) {
		super();
		this.matchingId = matchingId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.userName1 = userName1;
		this.userName2 = userName2;
		this.mStatus = mStatus;
	}

	public int getMatchingId() {
		return matchingId;
	}

	public void setMatchingId(int matchingId) {
		this.matchingId = matchingId;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public int getmPeoplenum() {
		return mPeoplenum;
	}

	public void setmPeoplenum(int mPeoplenum) {
		this.mPeoplenum = mPeoplenum;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Matching [matchingId=" + matchingId + ", mTitle=" + mTitle + ", mContent=" + mContent + ", mPeoplenum="
				+ mPeoplenum + ", locationId=" + locationId + ", categoryId=" + categoryId + ", userName1=" + userName1
				+ ", userName2=" + userName2 + ", mStatus=" + mStatus + "]";
	}
	
	
	
	
	
	
	
}
