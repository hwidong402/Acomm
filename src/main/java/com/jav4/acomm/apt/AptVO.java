package com.jav4.acomm.apt;
//아파트 vo
public class AptVO {
	private String apt_code; // 아파트 마다 가지고 있는 코드
	private String apt_name; // 아파트 이름
	private String apt_city; // 아파트 지역 ex) 부산, 인천, 대전 등
	private String apt_town; // 시 or 구 or 군 등등등...
	private String apt_village; // 좌동 , 중동 할때 동 친구들
	private String apt_addr; // full address
	private String apt_subaddr; // 간단한 주소 표시
	private double apt_lat; // 위도
	private double apt_lon; // 경도
	private int apt_addrcode; //법정동코드
	
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
	public int getApt_addrcode() {
		return apt_addrcode;
	}
	public void setApt_addrcode(int apt_addrcode) {
		this.apt_addrcode = apt_addrcode;
	}
	@Override
	public String toString() {
		return "AptVO [apt_code=" + apt_code + ", apt_name=" + apt_name + ", apt_city=" + apt_city + ", apt_town="
				+ apt_town + ", apt_village=" + apt_village + ", apt_addr=" + apt_addr + ", apt_subaddr=" + apt_subaddr
				+ ", apt_lat=" + apt_lat + ", apt_lon=" + apt_lon + ", apt_addrcode=" + apt_addrcode + "]";
	}
	
	
	
	
}