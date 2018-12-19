package com.yang.ServeMeet.category.model.vo;

public class Category {
	
	private static final long serialVersionUID = 5000L;

	private int categoryId;
	private String bigCategory;
	private String midCategory;
	private String smallCategory;
	
	public Category() {
		super();
	}

	
	
	public Category(String bigCategory) {
		super();
		this.bigCategory = bigCategory;
	}



	public Category(String bigCategory, String midCategory) {
		super();
		this.bigCategory = bigCategory;
		this.midCategory = midCategory;
	}



	public Category(String bigCategory, String midCategory, String smallCategory) {
		super();
		this.bigCategory = bigCategory;
		this.midCategory = midCategory;
		this.smallCategory = smallCategory;
	}



	public Category(int categoryId, String bigCategory, String midCategory, String smallCategory) {
		super();
		this.categoryId = categoryId;
		this.bigCategory = bigCategory;
		this.midCategory = midCategory;
		this.smallCategory = smallCategory;
	}



	public int getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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



	public String getSmallCategory() {
		return smallCategory;
	}



	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}



	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", bigCategory=" + bigCategory + ", midCategory=" + midCategory
				+ ", smallCategory=" + smallCategory + "]";
	}
	
	
	
	
}
