package org.green.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.green.controller.MemberController;
import org.green.domain.MemberVO;
import org.green.persistence.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao; 
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		logger.warn("=================================================");
		logger.warn("여기여기");		
		logger.warn("vo" + vo);
		logger.warn("=================================================");
		
		dao.signup(vo);			
		
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();		
	}	
}
