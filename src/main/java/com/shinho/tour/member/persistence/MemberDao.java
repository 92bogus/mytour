package com.shinho.tour.member.persistence;

import com.shinho.tour.login.vo.AuthInfo;
import com.shinho.tour.login.vo.LoginCommand;
import com.shinho.tour.member.vo.Member;

public interface MemberDao {
   public void register(Member vo) throws Exception;
   public Member idCheck(String userid) throws Exception;
   public Member emailCheck(String email) throws Exception;
   public int update(Member vo) throws Exception;
   public Member viewMember(String userid) throws Exception;
   public AuthInfo pwdCheck(LoginCommand dto) throws Exception;
   
   public Member selectByIdAndPassword(LoginCommand loginCommand);
}