package org.green.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.green.domain.MemberVO;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String namespace = "org.green.mapper.MemberMapper";
	
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);		
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace+ ".signin", vo);
		
	}

}
