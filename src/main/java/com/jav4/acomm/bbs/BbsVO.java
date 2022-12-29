package com.jav4.acomm.bbs;

import java.util.Date;

public class BbsVO {
	private String bbs_id;
	private String bbs_title;
	private Date bbs_date;
	private String bbs_writer;
	private String bbs_content;
	private String bbs_file;
	private String apt_code;
	private String bbs_notice;
	private String bbs_cate;
	
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public Date getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(Date bbs_date) {
		this.bbs_date = bbs_date;
	}
	public String getBbs_writer() {
		return bbs_writer;
	}
	public void setBbs_writer(String bbs_writer) {
		this.bbs_writer = bbs_writer;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_file() {
		return bbs_file;
	}
	public void setBbs_file(String bbs_file) {
		this.bbs_file = bbs_file;
	}
	public String getApt_code() {
		return apt_code;
	}
	public void setApt_code(String apt_code) {
		this.apt_code = apt_code;
	}
	public String getBbs_notice() {
		return bbs_notice;
	}
	public void setBbs_notice(String bbs_notice) {
		this.bbs_notice = bbs_notice;
	}
	public String getBbs_cate() {
		return bbs_cate;
	}
	public void setBbs_cate(String bbs_cate) {
		this.bbs_cate = bbs_cate;
	}
	
	@Override
	public String toString() {
		return "BbsVO [bbs_id=" + bbs_id + ", bbs_title=" + bbs_title + ", bbs_date=" + bbs_date + ", bbs_writer="
				+ bbs_writer + ", bbs_content=" + bbs_content + ", bbs_file=" + bbs_file + ", apt_code=" + apt_code
				+ ", bbs_notice=" + bbs_notice + ", bbs_cate=" + bbs_cate + "]";
	}
}
