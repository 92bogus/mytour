package kr.co.mytour.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mytour.board.dao.BoardDao;
import kr.co.mytour.board.dao.ReplyDAO;
import kr.co.mytour.board.vo.Criteria;
import kr.co.mytour.board.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private BoardDao boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return replyDAO.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		int bno = replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO> listReplayPage(Integer bno, Criteria cri) throws Exception {
		return replyDAO.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return replyDAO.count(bno);
	}

}
