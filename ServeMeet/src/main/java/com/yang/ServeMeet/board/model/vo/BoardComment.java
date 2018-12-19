package com.yang.ServeMeet.board.model.vo;

import java.util.Date;

public class BoardComment {

	
	private static final long serialVersionUID = 4001L;
	
	private int commentId;
	private int boardNo;
	private String userName;
	private Date commentDate;
	private String commentCon;
	private String commentStatus;
	
	public BoardComment() {
		super();
	}

	
	
	public BoardComment(int boardNo, String userName, Date commentDate, String commentCon) {
		super();
		this.boardNo = boardNo;
		this.userName = userName;
		this.commentDate = commentDate;
		this.commentCon = commentCon;
	}



	public BoardComment(int commentId, int boardNo, String userName, Date commentDate, String commentCon,
			String commentStatus) {
		super();
		this.commentId = commentId;
		this.boardNo = boardNo;
		this.userName = userName;
		this.commentDate = commentDate;
		this.commentCon = commentCon;
		this.commentStatus = commentStatus;
	}



	public int getCommentId() {
		return commentId;
	}



	public void setCommentId(int commentId) {
		this.commentId = commentId;
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



	public Date getCommentDate() {
		return commentDate;
	}



	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}



	public String getCommentCon() {
		return commentCon;
	}



	public void setCommentCon(String commentCon) {
		this.commentCon = commentCon;
	}



	public String getCommentStatus() {
		return commentStatus;
	}



	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}



	@Override
	public String toString() {
		return "BoardComment [commentId=" + commentId + ", boardNo=" + boardNo + ", userName=" + userName
				+ ", commentDate=" + commentDate + ", commentCon=" + commentCon + ", commentStatus=" + commentStatus
				+ "]";
	}
	
	
	
}
