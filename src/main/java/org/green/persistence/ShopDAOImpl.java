package org.green.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.green.domain.CartListVO;
import org.green.domain.CartVO;
import org.green.domain.GoodsViewVO;
import org.green.domain.OrderDetailVO;
import org.green.domain.OrderListVO;
import org.green.domain.OrderVO;
import org.green.domain.ReplyListVO;
import org.green.domain.ReplyVO;
import org.springframework.stereotype.Service;

@Service
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "org.green.mapper.shopMapper";

	// 카테고리별 상품 리스트 : 1차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cateCode", cateCode);
		 map.put("cateCodeRef", cateCodeRef);
		 
		 return sql.selectList(namespace + ".list_1", map);
	}

	// 카테고리별 상품 리스트 : 2차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		 
		return sql.selectList(namespace + ".list_2", cateCode);
	}
	
	//검색어별 상품 리스트 
	
	
	// 상품 조회 
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("org.green.mapper.adminMapper" + ".goodsView", gdsNum);
	}

	@Override
	public List<GoodsViewVO> searchlist(String type, String keyword) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("type", type);
		 map.put("keyword", keyword);
		 
		return sql.selectList(namespace + ".searchlist", map);
	}

	// 상품 소감(댓글) 작성 
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registReply", reply);
		
	}
	
	// 상품 소감(댓글) 리스트	
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", gdsNum);
	}

	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
		
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}

	// 상품 소감(댓글) 수정 
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
		
	}

	// 카트 담기 
	@Override
	public void addCart(CartListVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}


	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	// 카트 삭제 
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
		
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
		
	}

	// 주문 상세정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
		
	}

	// 카트 비우기 
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
		
	}

	// 주문목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	// 특정 주문목록 
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}
	
	
	
}
