package kr.co.mytour.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.member.persistence.MemberDao;
import kr.co.mytour.member.vo.Member;

@Service
public class AuthService {
	
	@Autowired
	private MemberDao memberDao;
	
	public AuthInfo authenticate(String id, String password) throws Exception {
		Member member = memberDao.viewMember(id);
		
		if(member == null) {
			throw new Exception();
		}
		
		return new AuthInfo(member.getId(), member.getUsername(), member.getEmail());
	}
	
}
