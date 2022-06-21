package com.shinho.tour.login.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginCommand {
	private String id;
	private String password;
	private boolean useCookie;
}
