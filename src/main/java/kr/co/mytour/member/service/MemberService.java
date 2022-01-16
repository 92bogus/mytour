package kr.co.mytour.member.service;

import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.login.vo.LoginCommand;
import kr.co.mytour.member.vo.Member;

public interface MemberService {
   public void register(Member vo) throws Exception;
   public Member idCheck(String userid) throws Exception;
   public Member emailCheck(String email) throws Exception;
   public int update(Member vo) throws Exception;
   public Member viewMember(String userid) throws Exception;
   public AuthInfo pwdCheck(LoginCommand dto) throws Exception;
}