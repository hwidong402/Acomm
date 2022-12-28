package com.jav4.acomm.member;

public class MemberVO {

	private String id; 
	private String pw; 
	private String name; 
	private String code; 
	private String sub_addr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSub_addr() {
		return sub_addr;
	}
	public void setSub_addr(String sub_addr) {
		this.sub_addr = sub_addr;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", code=" + code + ", sub_addr=" + sub_addr
				+ "]";
	} 
}
