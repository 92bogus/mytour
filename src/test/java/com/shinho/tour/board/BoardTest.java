//package com.shinho.tour.board;
//import static org.hamcrest.CoreMatchers.is;
//import static org.hamcrest.MatcherAssert.assertThat;
//
//import java.util.List;
//
//import com.shinho.tour.board.service.BoardService;
//import com.shinho.tour.board.vo.BoardVO;
//import com.shinho.tour.board.vo.Criteria;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class BoardTest {
//
//	BoardVO vo1;
//
//	@Before
//	public void setUp() {
//		vo1 = new BoardVO();
//		vo1.setTitle("제목1");
//		vo1.setContent("내용1");
//		vo1.setWriter("작성자1");
//	}
//
//	@Autowired
//    BoardService boardService;
//
//	@Test
//	public void insertBoardTest() throws Exception {
//		boardService.removeAll();
//
//		boardService.regist(vo1);
//
//		List<BoardVO> list = boardService.list(new Criteria());
//		isEquals(this.vo1, list.get(0));
//
//	}
//
//	public void isEquals(BoardVO vo1, BoardVO vo2) {
//		assertThat(vo1.getBno(), is(vo2.getBno()));
//		assertThat(vo1.getContent(), is(vo2.getContent()));
//		assertThat(vo1.getWriter(), is(vo2.getWriter()));
//	}
//}
