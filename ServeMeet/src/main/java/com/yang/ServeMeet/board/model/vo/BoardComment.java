package com.yang.ServeMeet.board.model.vo;

public class BoardComment {

	
	private static final long serialVersionUID = 4001L;
	
	private int commentId;
	private int boardNo;
	private String userName;
	private String commentDate;
	private String commentCon;
	private int refCid;
	private String commentStatus;
	private int orderList;
	private String getName;
	
	public BoardComment() {
		super();
	}
	
	public BoardComment(int commentId, int boardNo, String userName, String commentDate, String commentCon, int refCid,
			String commentStatus, int orderList, String getName) {
		super();
		this.commentId = commentId;
		this.boardNo = boardNo;
		this.userName = userName;
		this.commentDate = commentDate;
		this.commentCon = commentCon;
		this.refCid = refCid;
		this.commentStatus = commentStatus;
		this.orderList = orderList;
		this.getName = getName;
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



	public String getCommentDate() {
		return commentDate;
	}



	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}



	public String getCommentCon() {
		return commentCon;
	}



	public void setCommentCon(String commentCon) {
		this.commentCon = commentCon;
	}


	public int getRefCid() {
		return refCid;
	}



	public void setRefCid(int refCid) {
		this.refCid = refCid;
	}


	public String getCommentStatus() {
		return commentStatus;
	}



	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	public int getOrderList() {
		return orderList;
	}

	public void setOrderList(int orderList) {
		this.orderList = orderList;
	}
	
	public String getGetName() {
		return getName;
	}

	public void setGetName(String getName) {
		this.getName = getName;
	}

	@Override
	public String toString() {
		return "BoardComment [commentId=" + commentId + ", boardNo=" + boardNo + ", userName=" + userName
				+ ", commentDate=" + commentDate + ", commentCon=" + commentCon + ", refCid=" + refCid
				+ ", commentStatus=" + commentStatus + ", orderList=" + orderList + ", getName=" + getName + "]";
	}

	
}
