package com.jav4.acomm.aptsell;

public class AptSellVO {
	private String apt_code;
	private String apt_name;
	private String apt_city;
	private String apt_town;
	private String apt_village;
	private String apt_addr;
	private String apt_subaddr;
	private double apt_lat;
	private double apt_lon;
	public String getApt_code() {
		return apt_code;
	}
	public void setApt_code(String apt_code) {
		this.apt_code = apt_code;
	}
	public String getApt_name() {
		return apt_name;
	}
	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
	}
	public String getApt_city() {
		return apt_city;
	}
	public void setApt_city(String apt_city) {
		this.apt_city = apt_city;
	}
	public String getApt_town() {
		return apt_town;
	}
	public void setApt_town(String apt_town) {
		this.apt_town = apt_town;
	}
	public String getApt_village() {
		return apt_village;
	}
	public void setApt_village(String apt_village) {
		this.apt_village = apt_village;
	}
	public String getApt_addr() {
		return apt_addr;
	}
	public void setApt_addr(String apt_addr) {
		this.apt_addr = apt_addr;
	}
	public String getApt_subaddr() {
		return apt_subaddr;
	}
	public void setApt_subaddr(String apt_subaddr) {
		this.apt_subaddr = apt_subaddr;
	}
	public double getApt_lat() {
		return apt_lat;
	}
	public void setApt_lat(double apt_lat) {
		this.apt_lat = apt_lat;
	}
	public double getApt_lon() {
		return apt_lon;
	}
	public void setApt_lon(double apt_lon) {
		this.apt_lon = apt_lon;
	}
	@Override
	public String toString() {
		return "AptSellVO [apt_code=" + apt_code + ", apt_name=" + apt_name + ", apt_city=" + apt_city + ", apt_town="
				+ apt_town + ", apt_village=" + apt_village + ", apt_addr=" + apt_addr + ", apt_subaddr=" + apt_subaddr
				+ ", apt_lat=" + apt_lat + ", apt_lon=" + apt_lon + "]";
	}
	
	
	
}
