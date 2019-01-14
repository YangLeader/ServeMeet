package com.yang.ServeMeet.matching.model.vo;

public class MatchingCondition {

	private int mconid;
	private int matchingid;
	private String mwriter;
	private String mguest;
	private String mmsg;
	private String mstatus;
	public MatchingCondition(int mconid, int matchingid, String mwriter, String mguest, String mmsg, String mstatus) {
		super();
		this.mconid = mconid;
		this.matchingid = matchingid;
		this.mwriter = mwriter;
		this.mguest = mguest;
		this.mmsg = mmsg;
		this.mstatus = mstatus;
	}
	public MatchingCondition() {
		super();
	}
	public int getMconid() {
		return mconid;
	}
	public void setMconid(int mconid) {
		this.mconid = mconid;
	}
	public int getMatchingid() {
		return matchingid;
	}
	public void setMatchingid(int matchingid) {
		this.matchingid = matchingid;
	}
	public String getMwriter() {
		return mwriter;
	}
	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}
	public String getMguest() {
		return mguest;
	}
	public void setMguest(String mguest) {
		this.mguest = mguest;
	}
	public String getMmsg() {
		return mmsg;
	}
	public void setMmsg(String mmsg) {
		this.mmsg = mmsg;
	}
	public String getMstatus() {
		return mstatus;
	}
	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}
	@Override
	public String toString() {
		return "MatchingCondition [mconid=" + mconid + ", matchingid=" + matchingid + ", mwriter=" + mwriter
				+ ", mguest=" + mguest + ", mmsg=" + mmsg + ", mstatus=" + mstatus + "]";
	}
	
	
	
}
