package com.jav4.acomm.bbs;

public class LikeVO {

	private String member_id;
	private int bbs_id;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	
	@Override
	public String toString() {
		return "LikeVO [member_id=" + member_id + ", bbs_id=" + bbs_id + "]";
	}
}
