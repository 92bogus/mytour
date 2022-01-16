package kr.co.mytour.board.dao;

import java.util.List;

import kr.co.mytour.board.vo.BoardVO;
import kr.co.mytour.board.vo.Criteria;

public interface BoardDao {
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer bno) throws Exception;
	public List<BoardVO> list(Criteria cri) throws Exception;
	public int getTotalCount(Criteria cri) throws Exception;
	public void addAttach(String fullName) throws Exception;
	public List<String> getAttach(Integer bno) throws Exception;
	public void deleteAttach(Integer bno) throws Exception;
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	public void updateViewCnt(Integer bno) throws Exception;
	public int deleteAll() throws Exception;
}
