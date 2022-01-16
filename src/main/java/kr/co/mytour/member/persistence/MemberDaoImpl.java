package kr.co.mytour.member.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.login.vo.LoginCommand;
import kr.co.mytour.member.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
   
   @Autowired
   private SqlSession session;
   
   private static String namespace = "kr.co.mytour.mapper.MemberMapper";
   
   @Override
   public void register(Member vo) throws Exception {
      System.out.println(vo.toString());
      session.insert(namespace + ".create", vo);
   }

   @Override
   public Member idCheck(String userid) throws Exception {
      return session.selectOne(namespace + ".idCheck", userid);
   }

   @Override
   public Member emailCheck(String email) throws Exception {
         return session.selectOne(namespace + ".emailCheck", email);
   }

	@Override
	public int update(Member vo) throws Exception {
		int updatedRows = session.update(namespace + ".modify", vo);
		return updatedRows;
	}

	@Override
	public Member viewMember(String userid) throws Exception {
		return session.selectOne(namespace + ".read", userid);
	}

	@Override
	public AuthInfo pwdCheck(LoginCommand dto) throws Exception {
		return session.selectOne(namespace + ".pwdCheck", dto);
	}

	@Override
	public Member selectByIdAndPassword(LoginCommand loginCommand) {
		return session.selectOne(namespace + ".selectByIdAndPassword");
	}

}
