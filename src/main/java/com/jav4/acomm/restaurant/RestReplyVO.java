package com.jav4.acomm.restaurant;

public class RestReplyVO {

		private int rere_id;
		private int member_code;
		private String rere_writer;
		private String rere_content;
		private int rest_id;
		private float rere_score;
		private String apt_code;
		
		public int getMember_code() {
			return member_code;
		}
		public void setMember_code(int member_code) {
			this.member_code = member_code;
		}
		public String getApt_code() {
			return apt_code;
		}
		public void setApt_code(String apt_code) {
			this.apt_code = apt_code;
		}
		public int getRere_id() {
			return rere_id;
		}
		public void setRere_id(int rere_id) {
			this.rere_id = rere_id;
		}
		public String getRere_writer() {
			return rere_writer;
		}
		public void setRere_writer(String rere_writer) {
			this.rere_writer = rere_writer;
		}
		public String getRere_content() {
			return rere_content;
		}
		public void setRere_content(String rere_content) {
			this.rere_content = rere_content;
		}
		public int getRest_id() {
			return rest_id;
		}
		public void setRest_id(int rest_id) {
			this.rest_id = rest_id;
		}
		public float getRere_score() {
			return rere_score;
		}
		public void setRere_score(float rere_score) {
			this.rere_score = rere_score;
		}

}
