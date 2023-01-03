package com.jav4.acomm.member;
import java.util.Date;
public class MemberVO {
    private int member_code;
    private String member_id;
    private String member_pw;
    private String member_name;
    private String member_tel;
    private String apt_code;
    private String sub_addr;
    private int member_cls;
    private Date member_date;
    private String stop_id;
    private String member_like;
    
    public int getMember_code() {
        return member_code;
    }
    public void setMember_code(int member_code) {
        this.member_code = member_code;
    }
    public String getMember_id() {
        return member_id;
    }
    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    public String getMember_pw() {
        return member_pw;
    }
    public void setMember_pw(String member_pw) {
        this.member_pw = member_pw;
    }
    public String getMember_name() {
        return member_name;
    }
    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }
    public String getMember_tel() {
        return member_tel;
    }
    public void setMember_tel(String member_tel) {
        this.member_tel = member_tel;
    }
    public String getApt_code() {
        return apt_code;
    }
    public void setApt_code(String apt_code) {
        this.apt_code = apt_code;
    }
    public String getSub_addr() {
        return sub_addr;
    }
    public void setSub_addr(String sub_addr) {
        this.sub_addr = sub_addr;
    }
    public int getMember_cls() {
        return member_cls;
    }
    public void setMember_cls(int member_cls) {
        this.member_cls = member_cls;
    }
    public Date getMember_date() {
        return member_date;
    }
    public void setMember_date(Date member_date) {
        this.member_date = member_date;
    }
    public String getStop_id() {
        return stop_id;
    }
    public void setStop_id(String stop_id) {
        this.stop_id = stop_id;
    }
    public String getMember_like() {
        return member_like;
    }
    public void setMember_like(String member_like) {
        this.member_like = member_like;
    }
    
    @Override
    public String toString() {
        return "MemberVO [member_code=" + member_code + ", member_id=" + member_id + ", member_pw=" + member_pw
                + ", member_name=" + member_name + ", member_tel=" + member_tel + ", apt_code=" + apt_code
                + ", sub_addr=" + sub_addr + ", member_cls=" + member_cls + ", member_date=" + member_date
                + ", stop_id=" + stop_id + "]";
    }
    
    
}
