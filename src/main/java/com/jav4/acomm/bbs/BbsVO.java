package com.jav4.acomm.bbs;

public class BbsVO {
	private String id;
	private String title;
	private String writer;
	private String content;
	private String code;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "BusStopVO [id=" + id + ", title=" + title + ", writer=" + writer + ", content=" + content + ", code=" + code
				+ "]";
	}

}
