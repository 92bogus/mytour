package kr.co.mytour.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mytour.board.dao.BoardDao;
import kr.co.mytour.board.vo.BoardVO;
import kr.co.mytour.board.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return dao.getTotalCount(cri);
	}
	
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null) {
			System.out.println("files: null");
			return;
		}
		
		for(String fullName : files) {
			dao.addAttach(fullName);
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		Integer bno = board.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			dao.replaceAttach(fileName, bno);
		}
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {

		dao.deleteAttach(bno);
		dao.delete(bno);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return dao.getAttach(bno);
	}

	@Override
	public int removeAll() throws Exception {
		return dao.deleteAll();
	}

}
