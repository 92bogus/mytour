//package com.shinho.tour.login.service;
//
//import com.shinho.tour.member.persistence.MemberDao;
//import com.shinho.tour.member.vo.Member;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.shinho.tour.login.vo.AuthInfo;
//
//@Service
//public class AuthService {
//
//	@Autowired
//	private MemberDao memberDao;
//
//	public AuthInfo authenticate(String id, String password) throws Exception {
//		Member member = memberDao.viewMember(id);
//
//		if(member == null) {
//			throw new Exception();
//		}
//
//		return new AuthInfo(member.getId(), member.getUsername(), member.getEmail());
//	}
//
//}
