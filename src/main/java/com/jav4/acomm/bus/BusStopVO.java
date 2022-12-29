package com.jav4.acomm.bus;

public class BusStopVO {
	private String stop_id; // 정류소아이디
	private String stop_name; //정류소 이름
	private double stop_lat; //위도	
	private double stop_lon; //경도
	public String getStop_id() {
		return stop_id;
	}
	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}
	public String getStop_name() {
		return stop_name;
	}
	public void setStop_name(String stop_name) {
		this.stop_name = stop_name;
	}
	public double getStop_lat() {
		return stop_lat;
	}
	public void setStop_lat(double stop_lat) {
		this.stop_lat = stop_lat;
	}
	public double getStop_lon() {
		return stop_lon;
	}
	public void setStop_lon(double stop_lon) {
		this.stop_lon = stop_lon;
	}
	@Override
	public String toString() {
		return "BusStopVO [stop_id=" + stop_id + ", stop_name=" + stop_name + ", stop_lat=" + stop_lat + ", stop_lon="
				+ stop_lon + "]";
	}
	
	

}
