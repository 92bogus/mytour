package kr.co.mytour.login.vo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class AuthInfo {
	private String id;
	private String username;
	private String email;

	public AuthInfo(String id, String username, String email) {
		this.id = id;
		this.username = username;
		this.email = email;
	}
}