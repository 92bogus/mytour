package com.shinho.tour.board.dao;

import java.util.List;

import com.shinho.tour.board.vo.Criteria;
import com.shinho.tour.board.vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
	public int getBno(Integer rno) throws Exception;
}
