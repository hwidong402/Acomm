package com.jav4.acomm.bbs;

import java.util.Date;

public class BbslikeVO {
	private int like_id;
	private int bbs_id;
	private int member_code;
	private Date like_time;
	private int bbs_count;
	private int bbs_id_like;
	private Date bbs_date;
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public Date getLike_time() {
		return like_time;
	}
	public void setLike_time(Date like_time) {
		this.like_time = like_time;
	}
	public int getBbs_count() {
		return bbs_count;
	}
	public void setBbs_count(int bbs_count) {
		this.bbs_count = bbs_count;
	}
	public int getBbs_id_like() {
		return bbs_id_like;
	}
	public void setBbs_id_like(int bbs_id_like) {
		this.bbs_id_like = bbs_id_like;
	}
	public Date getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(Date bbs_date) {
		this.bbs_date = bbs_date;
	}
	
	@Override
	public String toString() {
		return "BbslikeVO [like_id=" + like_id + ", bbs_id=" + bbs_id + ", member_code=" + member_code + ", like_time="
				+ like_time + ", bbs_count=" + bbs_count + ", bbs_id_like=" + bbs_id_like + ", bbs_date=" + bbs_date
				+ "]";
	}
}
