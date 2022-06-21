//package com.shinho.tour.member.service;
//
//import com.shinho.tour.member.persistence.MemberDao;
//import com.shinho.tour.member.vo.Member;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.shinho.tour.login.vo.AuthInfo;
//import com.shinho.tour.login.vo.LoginCommand;
//
//@Service
//public class MemberServiceImpl implements MemberService {
//
//   @Autowired
//   private MemberDao dao;
//
//   @Override
//   public void register(Member vo) throws Exception {
//      System.out.println(vo.toString());
//      dao.register(vo);
//   }
//
//   @Override
//   public Member idCheck(String userid) throws Exception {
//      return dao.idCheck(userid);
//   }
//
//   @Override
//   public Member emailCheck(String email) throws Exception {
//	   return dao.emailCheck(email);
//   }
//
//   @Override
//   public int update(Member vo) throws Exception {
//	   int updatedRows = dao.update(vo);
//	   return updatedRows;
//   }
//
//   @Override
//   public Member viewMember(String userid) throws Exception {
//	   return dao.viewMember(userid);
//   }
//
//   @Override
//   public AuthInfo pwdCheck(LoginCommand dto) throws Exception {
//	   return dao.pwdCheck(dto);
//   }
//
//}