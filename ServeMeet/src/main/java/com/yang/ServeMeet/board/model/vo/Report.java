package com.yang.ServeMeet.board.model.vo;

public class Report {
	
	private static final long serialVersionUID = 4003L;
	
	private int boardNo;
	private String userName;
	private String category;
	private String reportContent;
	
	public Report() {
		super();
	}

	public Report(int boardNo, String userName, String category, String reportContent) {
		super();
		this.boardNo = boardNo;
		this.userName = userName;
		this.category = category;
		this.reportContent = reportContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	@Override
	public String toString() {
		return "Report [boardNo=" + boardNo + ", userName=" + userName + ", category=" + category + ", reportContent="
				+ reportContent + "]";
	}
}
