package com.yang.ServeMeet.board.model.vo;

public class BoardFile {
	
	
	private static final long serialVersionUID = 4002L;
	
	private int fileId;
	private int boardNo;
	private int mhistoryId;
	private String originName;
	private String changeName;
	private String fileLocation;
	private String userName;

	public BoardFile() {
		super();
	}

	public BoardFile(int boardNo, int mhistoryId, String originName, String changeName, String fileLocation,
			String userName) {
		super();
		this.boardNo = boardNo;
		this.mhistoryId = mhistoryId;
		this.originName = originName;
		this.changeName = changeName;
		this.fileLocation = fileLocation;
		this.userName = userName;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMhistoryId() {
		return mhistoryId;
	}

	public void setMhistoryId(int mhistoryId) {
		this.mhistoryId = mhistoryId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "BoardFile [fileId=" + fileId + ", boardNo=" + boardNo + ", mhistoryId=" + mhistoryId + ", originName="
				+ originName + ", changeName=" + changeName + ", fileLocation=" + fileLocation + ", userName="
				+ userName + "]";
	}

	
	
	
}
