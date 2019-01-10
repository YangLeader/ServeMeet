package com.yang.ServeMeet.matching.model.vo;

public class MatchingListObj extends Matching{
	private String bigCategory;
	private String midCategory;
	private String bigLocation;
	private String midLocation;
	private String smallCategory;

	public MatchingListObj() {}
	
	public MatchingListObj(String bigCategory, String midCategory, String bigLocation, String midLocation,
			String smallCategory) {
		super();
		this.bigCategory = bigCategory;
		this.midCategory = midCategory;
		this.bigLocation = bigLocation;
		this.midLocation = midLocation;
		this.smallCategory = smallCategory;
	}

	public String getBigCategory() {
		return bigCategory;
	}

	public void setBigCategory(String bigCategory) {
		this.bigCategory = bigCategory;
	}

	public String getMidCategory() {
		return midCategory;
	}

	public void setMidCategory(String midCategory) {
		this.midCategory = midCategory;
	}

	public String getBigLocation() {
		return bigLocation;
	}

	public void setBigLocation(String bigLocation) {
		this.bigLocation = bigLocation;
	}

	public String getMidLocation() {
		return midLocation;
	}

	public void setMidLocation(String midLocation) {
		this.midLocation = midLocation;
	}

	public String getSmallCategory() {
		return smallCategory;
	}

	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}

	@Override
	public String toString() {
		return "MatchingListObj [bigCategory=" + bigCategory + ", midCategory=" + midCategory + ", bigLocation="
				+ bigLocation + ", midLocation=" + midLocation + ", smallCategory=" + smallCategory + "]";
	}
	
	
	
}
