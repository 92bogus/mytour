package kr.co.mytour.member.vo;

import java.util.Date;

public class Member {
	private Integer mno;
	private String id;
	private String password;
	private String username;
	private String email;
	private String mobile;
	private String zipcode;
	private String roadAddr;
	private String detailedAddr;
	private Date regdate;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getDetailedAddr() {
		return detailedAddr;
	}
	public void setDetailedAddr(String detailedAddr) {
		this.detailedAddr = detailedAddr;
	}
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getId() {
		return this.id;
	}
	public void setUserid(String id) {
		this.id = id;
	}
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public boolean matchPassword(String password) {
		return this.password.equals(password);
	}
	
}
