package com.yang.ServeMeet.board.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {

	private static final long serialVersionUID = 4000L;
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String userName;
	private int boardCount;
	@JsonFormat(pattern="MM-dd", timezone = "Asia/Seoul")
	private Date boardDate;
	private String boardStatus;
	private int commentCount;
	private int reportCount;
	private String isAnnounce;
	
	public Board() {
		super();
	}

	public Board(int boardNo, String boardTitle, String boardContent, String userName, int boardCount, Date boardDate,
			String boardStatus, int commentCount, int reportCount, String isAnnounce) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userName = userName;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
		this.commentCount = commentCount;
		this.reportCount = reportCount;
		this.isAnnounce = isAnnounce;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getIsAnnounce() {
		return isAnnounce;
	}

	public void setIsAnnounce(String isAnnounce) {
		this.isAnnounce = isAnnounce;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", userName=" + userName + ", boardCount=" + boardCount + ", boardDate=" + boardDate
				+ ", boardStatus=" + boardStatus + ", commentCount=" + commentCount + ", reportCount=" + reportCount
				+ ", isAnnounce=" + isAnnounce + "]";
	}

}
