//package com.shinho.tour.board.controller;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.shinho.tour.board.service.BoardService;
//import com.shinho.tour.board.vo.BoardVO;
//import com.shinho.tour.board.vo.Criteria;
//import com.shinho.tour.board.vo.PageMaker;
//
//@Controller
//@RequestMapping("/board/*")
//public class BoardController {
//
//	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
//
//	@Autowired
//	private BoardService service;
//
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		logger.info(cri.toString());
//
//		model.addAttribute("list", service.list(cri));
//
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//
//		pageMaker.setTotalCount(service.getTotalCount(cri));
//
//		model.addAttribute("pageMaker", pageMaker);
//	}
//
//	@RequestMapping(value="/register", method=RequestMethod.GET)
//	public void registerGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//	}
//
//	@RequestMapping(value="/register", method=RequestMethod.POST)
//	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
//		logger.info(board.toString());
//
//		service.regist(board);
//		rttr.addFlashAttribute("msg", "SUCCESS");
//
//		return "redirect:/board/list";
//	}
//
//	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
//	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		model.addAttribute(service.read(bno));
//	}
//
//	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
//	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
//		System.out.println("remove post called...");
//
//		service.remove(bno);
//
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		rttr.addAttribute("searchType", cri.getSearchType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//
//		rttr.addFlashAttribute("msg", "SUCCESS");
//
//		return "redirect:/board/list";
//	}
//
//	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
//	public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		model.addAttribute(service.read(bno));
//	}
//
//	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
//	public String modifyPagingPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
//		service.modify(board);
//
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		rttr.addAttribute("searchType", cri.getSearchType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//
//		rttr.addFlashAttribute("msg", "SUCCESS");
//		return "redirect:/board/list";
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/getAttach/{bno}")
//	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
//		return service.getAttach(bno);
//	}
//
//}
