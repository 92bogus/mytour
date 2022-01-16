package kr.co.mytour.login.vo;

public class LoginCommand {
	
	private String id;
	private String password;
	private boolean useCookie;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginCommand [id=" + id + ", password=" + password + ", useCookie=" + useCookie + "]";
	}
	
}
