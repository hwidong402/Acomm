package com.jav4.acomm.apt;

public class AptVO {

	private String code; 
	private String name; 
	private String addr;
	private String area;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	@Override
	public String toString() {
		return "AptSellVO [code=" + code + ", name=" + name + ", addr=" + addr + ", area=" + area + "]";
	} 
}
