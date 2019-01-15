package com.yang.ServeMeet.matching.model.vo;

import java.sql.Date;

public class Matching {

	
	private static final long serialVersionUID = 2000L;
	
	private int matchingId;
	private String mTitle;
	private String mContent;
	private int mPeoplenum;
	private String locationId;
	private int categoryId;
	private String mWriter;
	private String mGuest;
	private String mtime;
	private String mStatus;
	private String mApplicant;
	
	public Matching() {
		super();
	}
	
	

	public String getmApplicant() {
		return mApplicant;
	}



	public void setmApplicant(String mApplicant) {
		this.mApplicant = mApplicant;
	}



	public Matching(int matchingId, String mTitle, String mContent, int mPeoplenum, String locationId, int categoryId,
			String mWriter, String mGuest, String mtime, String mStatus, String mApplicant) {
		super();
		this.matchingId = matchingId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.mWriter = mWriter;
		this.mGuest = mGuest;
		this.mtime = mtime;
		this.mStatus = mStatus;
		this.mApplicant = mApplicant;
	}



	public Matching(int matchingId, String mTitle, String mContent, int mPeoplenum, String locationId, int categoryId,
			String mWriter, String mGuest, String mtime, String mStatus) {
		super();
		this.matchingId = matchingId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.mWriter = mWriter;
		this.mGuest = mGuest;
		this.mtime = mtime;
		this.mStatus = mStatus;
	}



	public Matching(String mTitle, String mContent, int mPeoplenum, String locationId, int categoryId, String mWriter) {
		super();
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.mWriter = mWriter;
	}



	public Matching(int matchingId, String mTitle, String mContent, int mPeoplenum, String locationId, int categoryId,
			String mWriter, String mGuest, String mStatus) {
		super();
		this.matchingId = matchingId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mPeoplenum = mPeoplenum;
		this.locationId = locationId;
		this.categoryId = categoryId;
		this.mWriter = mWriter;
		this.mGuest = mGuest;
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

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

		

	public String getmWriter() {
		return mWriter;
	}



	public void setmWriter(String mWriter) {
		this.mWriter = mWriter;
	}



	public String getmGuest() {
		return mGuest;
	}



	public void setmGuest(String mGuest) {
		this.mGuest = mGuest;
	}

	


	public String getMtime() {
		return mtime;
	}



	public void setMtime(String mtime) {
		this.mtime = mtime;
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
				+ mPeoplenum + ", locationId=" + locationId + ", categoryId=" + categoryId + ", mWriter=" + mWriter
				+ ", mGuest=" + mGuest + ", mtime=" + mtime + ", mStatus=" + mStatus + ", mApplicant=" + mApplicant
				+ "]";
	}




	
	
	
	
	
	
	
}
