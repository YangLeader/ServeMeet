package com.yang.ServeMeet.batting.model.vo;

public class Batting {
	
	private static final long serialVersionUID = 5000L;
	
	private int battingId;
	private int matchingId;
	private int battingPNumA;
	private int battingPNumB;
	private String bStatus;
	
	public Batting() {
		super();
	}

	
	
	public Batting(int matchingId, int battingPNumA, int battingPNumB) {
		super();
		this.matchingId = matchingId;
		this.battingPNumA = battingPNumA;
		this.battingPNumB = battingPNumB;
	}



	public Batting(int battingId, int matchingId, int battingPNumA, int battingPNumB, String bStatus) {
		super();
		this.battingId = battingId;
		this.matchingId = matchingId;
		this.battingPNumA = battingPNumA;
		this.battingPNumB = battingPNumB;
		this.bStatus = bStatus;
	}



	public int getBattingId() {
		return battingId;
	}



	public void setBattingId(int battingId) {
		this.battingId = battingId;
	}



	public int getMatchingId() {
		return matchingId;
	}



	public void setMatchingId(int matchingId) {
		this.matchingId = matchingId;
	}



	public int getBattingPNumA() {
		return battingPNumA;
	}



	public void setBattingPNumA(int battingPNumA) {
		this.battingPNumA = battingPNumA;
	}



	public int getBattingPNumB() {
		return battingPNumB;
	}



	public void setBattingPNumB(int battingPNumB) {
		this.battingPNumB = battingPNumB;
	}



	public String getbStatus() {
		return bStatus;
	}



	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}



	@Override
	public String toString() {
		return "Batting [battingId=" + battingId + ", matchingId=" + matchingId + ", battingPNumA=" + battingPNumA
				+ ", battingPNumB=" + battingPNumB + ", bStatus=" + bStatus + "]";
	}

	
	
}
