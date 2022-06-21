package com.shinho.tour.member.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
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
	
	public boolean matchPassword(String password) {
		return this.password.equals(password);
	}
	
}
