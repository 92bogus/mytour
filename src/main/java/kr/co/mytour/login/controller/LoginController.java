package kr.co.mytour.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mytour.login.service.AuthService;
import kr.co.mytour.login.validator.LoginCommandValidator;
import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.login.vo.LoginCommand;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private AuthService authService;
	
	@GetMapping
	public String goLogin(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		//	클라이언트에서 REMEMBER란 쿠기가 전송되었을경우, 로그인 폼 페이지에 아이디와 아이디 기억 체크박스를 체크해준다
		if(rCookie != null) {
			loginCommand.setId(rCookie.getValue());
			loginCommand.setUseCookie(true);
		}
		
		logger.info("LoginCommand Info: " + loginCommand.toString());
		
		return "login/loginForm";
	}
	
	@PostMapping
	public String doLogin(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
		new LoginCommandValidator().validate(loginCommand, errors);
		
		logger.info("LoginCommand Info: " + loginCommand.toString());
		
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		
		try {
			AuthInfo authInfo = authService.authenticate(loginCommand.getId(), loginCommand.getPassword());
			
			session.setAttribute("authInfo", authInfo);
			
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
			rememberCookie.setPath("/");
			
			if(loginCommand.isUseCookie()) {	
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);	//	30일동안 저장
			} else {
				rememberCookie.setMaxAge(0);
			}
			
			response.addCookie(rememberCookie);
			
			return "login/loginSuccess";
		} catch(Exception e) {
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		}
		
	}
}
