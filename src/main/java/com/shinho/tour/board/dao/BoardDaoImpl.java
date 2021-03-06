//package com.shinho.tour.board.dao;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.shinho.tour.board.vo.BoardVO;
//import com.shinho.tour.board.vo.Criteria;
//
//@Repository
//public class BoardDaoImpl implements BoardDao {
//
//	private static String namespace = "kr.co.mytour.mapper.BoardMapper";
//
//	@Autowired
//	private SqlSession session;
//
//	@Override
//	public List<BoardVO> list(Criteria cri) throws Exception {
//		return session.selectList(namespace + ".list", cri);
//	}
//
//	@Override
//	public int getTotalCount(Criteria cri) throws Exception {
//		return session.selectOne(namespace + ".getTotalCount", cri);
//	}
//
//	@Override
//	public void create(BoardVO vo) throws Exception {
//		session.insert(namespace + ".create", vo);
//	}
//
//	@Override
//	public BoardVO read(Integer bno) throws Exception {
//		return session.selectOne(namespace + ".read", bno);
//	}
//
//	@Override
//	public void update(BoardVO vo) throws Exception {
//		session.update(namespace + ".update", vo);
//	}
//
//	@Override
//	public void delete(Integer bno) throws Exception {
//		session.delete(namespace + ".delete", bno);
//	}
//
//	@Override
//	public void addAttach(String fullName) throws Exception {
//		session.insert(namespace + ".addAttach", fullName);
//	}
//
//	@Override
//	public List<String> getAttach(Integer bno) throws Exception {
//
//		return session.selectList(namespace + ".getAttach", bno);
//	}
//
//	@Override
//	public void deleteAttach(Integer bno) throws Exception {
//		session.delete(namespace + ".deleteAttach", bno);
//	}
//
//	@Override
//	public void replaceAttach(String fullName, Integer bno) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//
//		paramMap.put("bno", bno);
//		paramMap.put("fullName", fullName);
//
//		session.insert(namespace + ".replaceAttach", paramMap);
//	}
//
//	@Override
//	public void updateReplyCnt(Integer bno, int amount) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//
//		paramMap.put("bno", bno);
//		paramMap.put("amount", amount);
//
//		session.update(namespace + ".updateReplyCnt", paramMap);
//	}
//
//	@Override
//	public void updateViewCnt(Integer bno) throws Exception {
//		session.update(namespace + ".updateViewCnt", bno);
//	}
//
//	@Override
//	public int deleteAll() throws Exception {
//		return session.update(namespace + ".deleteAll");
//	}
//
//}
