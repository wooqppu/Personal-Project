
package org.green.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.green.domain.MemberVO;
import org.green.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.warn("get signup");
	}
	
	
	// 회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.warn("post signup");
		
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		service.signup(vo);
		logger.warn("==============================================");
		logger.warn("여기");
		logger.warn("vo" + vo);
		logger.warn("==============================================");
		return "redirect:/";	
	}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	   logger.warn("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	   logger.warn("post signin");
	   MemberVO login = service.signin(vo);
	   HttpSession session = req.getSession();
	   
	   boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
	   
	   if(login != null && passMatch) {
		    session.setAttribute("member", login);
		   } else {
		    session.setAttribute("member", null);
		    rttr.addFlashAttribute("msg", false);
		    return "redirect:/member/signin";
		   }  
	   return "redirect:/";
	}
	    
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
	   logger.warn("get logout");
	   
	   service.signout(session);
	     
	   return "redirect:/";
	}
}

