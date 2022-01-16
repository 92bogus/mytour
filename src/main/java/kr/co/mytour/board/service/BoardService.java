package kr.co.mytour.board.service;

import java.util.List;

import kr.co.mytour.board.vo.BoardVO;
import kr.co.mytour.board.vo.Criteria;

public interface BoardService {
	public void regist(BoardVO board) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void remove(Integer bno) throws Exception;
	public List<BoardVO> list(Criteria cri) throws Exception;
	public int getTotalCount(Criteria cri) throws Exception;
	public List<String> getAttach(Integer bno) throws Exception;
	
	public int removeAll() throws Exception;
}
