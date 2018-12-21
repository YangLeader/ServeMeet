package com.yang.ServeMeet.location.model.vo;

public class Location {

	private static final long serialVersionUID = 5001L;
	
	private String locationId;
	private String bigloCation;
	private String midloCation;
	private String smallCategory;

	public Location() {
		super();
	}

	public Location(String bigloCation) {
		super();
		this.bigloCation = bigloCation;
	}

	public Location(String bigloCation, String midloCation) {
		super();
		this.bigloCation = bigloCation;
		this.midloCation = midloCation;
	}

	public Location(String bigloCation, String midloCation, String smallCategory) {
		super();
		this.bigloCation = bigloCation;
		this.midloCation = midloCation;
		this.smallCategory = smallCategory;
	}
	
	

	public Location(String locationId, String bigloCation, String midloCation, String smallCategory) {
		super();
		this.locationId = locationId;
		this.bigloCation = bigloCation;
		this.midloCation = midloCation;
		this.smallCategory = smallCategory;
	}


	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getBigloCation() {
		return bigloCation;
	}

	public void setBigloCation(String bigloCation) {
		this.bigloCation = bigloCation;
	}

	public String getMidloCation() {
		return midloCation;
	}

	public void setMidloCation(String midloCation) {
		this.midloCation = midloCation;
	}

	public String getSmallCategory() {
		return smallCategory;
	}

	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}

	@Override
	public String toString() {
		return "Location [locationId=" + locationId + ", bigloCation=" + bigloCation + ", midloCation=" + midloCation
				+ ", smallCategory=" + smallCategory + "]";
	}
	

}
