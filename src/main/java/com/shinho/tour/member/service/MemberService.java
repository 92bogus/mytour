package com.shinho.tour.member.service;

import com.shinho.tour.member.vo.Member;
import com.shinho.tour.login.vo.AuthInfo;
import com.shinho.tour.login.vo.LoginCommand;

public interface MemberService {
   public void register(Member vo) throws Exception;
   public Member idCheck(String userid) throws Exception;
   public Member emailCheck(String email) throws Exception;
   public int update(Member vo) throws Exception;
   public Member viewMember(String userid) throws Exception;
   public AuthInfo pwdCheck(LoginCommand dto) throws Exception;
}