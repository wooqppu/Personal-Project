package org.green.service;

import java.util.List;

import org.green.domain.CategoryVO;
import org.green.domain.GoodsVO;
import org.green.domain.GoodsViewVO;
import org.green.domain.OrderListVO;
import org.green.domain.OrderVO;
import org.green.domain.ReplyListVO;

public interface AdminService {
	
	// 카테고리 
	public List<CategoryVO> catregory() throws Exception;
	
	// 상품 등록 
	public void register(GoodsVO vo) throws Exception;
	
	// 상품 목록 
	public List<GoodsViewVO> goodslist() throws Exception;	
	
	// 상품 조회 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception; 
	
	// 상품 수정 
	public void goodsModify(GoodsVO vo) throws Exception;
	
	// 상품 삭제 
	public void goodsDelete(int gdsNum) throws Exception;
	
	// 주문목록
	public List<OrderVO> orderList() throws Exception;
	
	// 특정 주문목록 
	public List<OrderListVO> orderView(OrderVO order) throws Exception; 
	
	// 배송 상태 
	public void delivery(OrderVO order) throws Exception; 
	
	// 상품 수량 조절 
	public void changeStock(GoodsVO goods) throws Exception;
	
	// 모든 소감(댓글)
	public List<ReplyListVO> allReply() throws Exception;
	
	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;

}
