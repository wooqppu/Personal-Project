package org.green.persistence;

import java.util.List;

import org.green.domain.CartListVO;
import org.green.domain.CartVO;
import org.green.domain.GoodsViewVO;
import org.green.domain.OrderDetailVO;
import org.green.domain.OrderListVO;
import org.green.domain.OrderVO;
import org.green.domain.ReplyListVO;
import org.green.domain.ReplyVO;

public interface ShopDAO {
	// 카테고리별 상품 리스트 : 1차 분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	// 카테고리별 상품 리스트 : 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	// 검색어별 상품 리스트 
	public List<GoodsViewVO> searchlist(String type, String keyword) throws Exception;
	
	// 상품조회 
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	// 상품 소감(댓글) 작성 
	public void registReply(ReplyVO reply) throws Exception;
	
	// 상품 소감(댓글) 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	// 상품 소감(댓글) 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	// 아이디 체크 
	public String idCheck(int repNum) throws Exception;
	
	// 상품 소감(댓글) 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	// 카트 담기 
	public void addCart(CartListVO cart) throws Exception;
	
	// 카트 리스트 
	public List<CartListVO> cartList(String userId) throws Exception;
	
	// 카트 삭제 
	public void deleteCart(CartVO cart) throws Exception;
	
	// 주문 정보 
	public void orderInfo(OrderVO order) throws Exception;
	
	// 주문 상세정보 
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	// 카트 비우기 
	public void cartAllDelete(String userId) throws Exception;
	
	// 주문 목록 
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	// 특정 주문 목록 
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

}
