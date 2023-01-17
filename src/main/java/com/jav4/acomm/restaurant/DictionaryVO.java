package com.jav4.acomm.restaurant;


public class DictionaryVO {

	private String _id;
	private String word;
	private int jumsu;


	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getWord() {
		return word;
	}
	
	public void setWord(String word) {
		this.word = word;
	}

	public int getJumsu() {
		return jumsu;
	}
	
	public void setJumsu(int jumsu) {
		this.jumsu = jumsu;
	}

	@Override
	public String toString() {
		return "DictionaryVO [_id=" + _id + ", word=" + word + ", jumsu=" + jumsu + "]";
	}
	
}
