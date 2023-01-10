package com.jav4.acomm.aptsell;

public class AptSellVO {
	private String aptsell_id; //아파트상세코드
	private int apt_price; //아파트 거래금액
	private String apt_name; //아파트이름
	private int sell_year; //거래년도
	private int sell_mon; //거래월
	private int sell_floor; //판매아파트 층
	private String apt_subaddr;
	
	public String getAptsell_id() {
		return aptsell_id;
	}
	public void setAptsell_id(String aptsell_id) {
		this.aptsell_id = aptsell_id;
	}
	public int getApt_price() {
		return apt_price;
	}
	public void setApt_price(int apt_price) {
		this.apt_price = apt_price;
	}
	public String getApt_name() {
		return apt_name;
	}
	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
	}
	public int getSell_year() {
		return sell_year;
	}
	public void setSell_year(int sell_year) {
		this.sell_year = sell_year;
	}
	public int getSell_mon() {
		return sell_mon;
	}
	public void setSell_mon(int sell_mon) {
		this.sell_mon = sell_mon;
	}
	public int getSell_floor() {
		return sell_floor;
	}
	public void setSell_floor(int sell_floor) {
		this.sell_floor = sell_floor;
	}
	public String getApt_subaddr() {
		return apt_subaddr;
	}
	public void setApt_subaddr(String apt_subaddr) {
		this.apt_subaddr = apt_subaddr;
	}
	@Override
	public String toString() {
		return "AptSellVO [aptsell_id=" + aptsell_id + ", apt_price=" + apt_price + ", apt_name=" + apt_name
				+ ", sell_year=" + sell_year + ", sell_mon=" + sell_mon + ", sell_floor=" + sell_floor
				+ ", apt_subaddr=" + apt_subaddr + "]";
	}
	



}
