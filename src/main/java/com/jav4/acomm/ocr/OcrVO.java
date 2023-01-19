package com.jav4.acomm.ocr;

public class OcrVO {
	private String apt_subaddr;
	private String member_name;
	private int member_code;
	
	public String getApt_subaddr() {
		return apt_subaddr;
	}
	public void setApt_subaddr(String apt_subaddr) {
		this.apt_subaddr = apt_subaddr;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	@Override
	public String toString() {
		return "OcrVO [apt_subaddr=" + apt_subaddr + ", member_name=" + member_name + ", member_code=" + member_code
				+ "]";
	}
}
