package kr.co.mytour.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.login.vo.LoginCommand;
import kr.co.mytour.member.persistence.MemberDao;
import kr.co.mytour.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

   @Autowired
   private MemberDao dao;
   
   @Override
   public void register(Member vo) throws Exception {
      System.out.println(vo.toString());
      dao.register(vo);
   }

   @Override
   public Member idCheck(String userid) throws Exception {
      return dao.idCheck(userid);
   }
	
   @Override
   public Member emailCheck(String email) throws Exception {
	   return dao.emailCheck(email);
   }

   @Override
   public int update(Member vo) throws Exception {
	   int updatedRows = dao.update(vo);
	   return updatedRows;
   }
	
   @Override
   public Member viewMember(String userid) throws Exception {
	   return dao.viewMember(userid);
   }
	
   @Override
   public AuthInfo pwdCheck(LoginCommand dto) throws Exception {
	   return dao.pwdCheck(dto);
   }

}