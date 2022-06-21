package com.shinho.tour.board.service;

import java.util.List;

import com.shinho.tour.board.vo.Criteria;
import com.shinho.tour.board.vo.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	public void modifyReply(ReplyVO vo) throws Exception;
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO> listReplayPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
}
