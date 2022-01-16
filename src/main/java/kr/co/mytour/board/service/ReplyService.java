package kr.co.mytour.board.service;

import java.util.List;

import kr.co.mytour.board.vo.Criteria;
import kr.co.mytour.board.vo.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	public void modifyReply(ReplyVO vo) throws Exception;
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO> listReplayPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
}
