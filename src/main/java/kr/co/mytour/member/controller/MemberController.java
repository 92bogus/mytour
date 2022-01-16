package kr.co.mytour.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mytour.login.vo.AuthInfo;
import kr.co.mytour.login.vo.LoginCommand;
import kr.co.mytour.member.service.MemberService;
import kr.co.mytour.member.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
   
   @Autowired
   private MemberService service;
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   

   
   @ResponseBody
   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
   public String idCheck(String userid) throws Exception {
      Member vo = service.idCheck(userid);
      
      if(vo == null) {
         return "ID_OK";
      } else {
         return "ID_FALSE";
      }
   }
   
   @ResponseBody
   @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
   public String emailCheck(String email) throws Exception {
      Member vo = service.emailCheck(email);
      
      if(vo == null) {
         return "EMAIL_OK";
      } else {
         return "EMAIL_FALSE";
      }
   }
   
   
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void member_writeGET() {
      logger.info("member_writeGET() called...");
   }
   
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String member_writePOST(HttpServletRequest request, Member member, RedirectAttributes rttr) throws Exception {
      logger.info("registerPOST() called...");
      service.register(member);
      rttr.addFlashAttribute("msg", "JOIN_SUCCESS");
      return "redirect:/tour/";
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modify(@RequestParam("userid") String userid, Model model) throws Exception {
	   Member memberVO = service.viewMember(userid);
	   model.addAttribute("memberVO", memberVO);
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public void modify(Member vo) throws Exception {
	  service.update(vo);
   }
   
   @ResponseBody
   @RequestMapping(value = "pwdCheck", method = RequestMethod.POST)
   public String pwdCheck(LoginCommand dto) throws Exception {
	   AuthInfo vo = service.pwdCheck(dto);
	   
	   if(vo == null) {
		   return "PWD_FAIL";
	   }
	   
	   return "PWD_OK";
   }
}