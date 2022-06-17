package kr.co.mytour.login.vo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class AuthInfo {
	private String id;
	private String username;
	private String email;
}