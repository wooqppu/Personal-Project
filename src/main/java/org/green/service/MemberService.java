package org.green.service;

import javax.servlet.http.HttpSession;

import org.green.domain.MemberVO;

public interface MemberService {
	// 회원가입 
	public void signup(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 로그아웃
	public void signout(HttpSession session) throws Exception;
}
