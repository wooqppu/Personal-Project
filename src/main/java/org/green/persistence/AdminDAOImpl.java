package org.green.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.green.domain.CategoryVO;
import org.green.domain.GoodsVO;
import org.green.domain.GoodsViewVO;
import org.green.domain.OrderListVO;
import org.green.domain.OrderVO;
import org.green.domain.ReplyListVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "org.green.mapper.adminMapper";

	// 카테고리 
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}

	// 상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
		
	}

	// 상품 목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}

	// 상품 조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);		
	}

	// 상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		sql.delete(namespace + ".goodsDelete", gdsNum);
		
	}

	// 주문목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}

	// 특정 주문목록 
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);		
	}

	// 상품 수량 조절 
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sql.update(namespace + ".changeStock", goods);
	}

	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return sql.selectList(namespace + ".allReply");
	}

	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		sql.delete(namespace + ".deleteReply", repNum);
		
	}	
	
			
}
