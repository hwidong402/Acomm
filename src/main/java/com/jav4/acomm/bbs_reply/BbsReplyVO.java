package com.jav4.acomm.bbs_reply;

import java.util.Date;

public class BbsReplyVO {
	
	private int reply_id;
	private int bbs_id;
	private int paRe_id;
	private String reply_content;
	private int member_code;
	private String member_nick;
	private Date reply_date;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public int getPaRe_id() {
		return paRe_id;
	}
	public void setPaRe_id(int paRe_id) {
		this.paRe_id = paRe_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	@Override
	public String toString() {
		return "BbsReplyVO [reply_id=" + reply_id + ", bbs_id=" + bbs_id + ", paRe_id=" + paRe_id + ", reply_content="
				+ reply_content + ", member_code=" + member_code + ", member_nick=" + member_nick + ", reply_date="
				+ reply_date + "]";
	}
	
	

}
