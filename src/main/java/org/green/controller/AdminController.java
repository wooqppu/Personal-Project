package org.green.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.green.domain.CategoryVO;
import org.green.domain.GoodsVO;
import org.green.domain.GoodsViewVO;
import org.green.domain.OrderListVO;
import org.green.domain.OrderVO;
import org.green.domain.ReplyListVO;
import org.green.domain.ReplyVO;
import org.green.service.AdminService;
import org.green.utils.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONArray;



@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.warn("get index");
	}
	
	// 상품 등록 get
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {

		logger.warn("get goods register");	
		
		List<CategoryVO> category = null;
		
		category = adminService.catregory();		
		model.addAttribute("category", JSONArray.fromObject(category));		
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
	   
	   String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
	   String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
	   String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
	     
	   if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	    // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
	    
	    fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

	    // gdsImg에 원본 파일 경로 + 파일명 저장
	    vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	    // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
	    vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	    
	   } else {  // 첨부된 파일이 없으면
	    fileName = File.separator + "images" + File.separator + "none.jpg";
	    // 미리 준비된 none.png파일을 대신 출력함
	    
	    vo.setGdsImg(fileName);
	    vo.setGdsThumbImg(fileName);
	   }
	        
	   adminService.register(vo);
	   
	   return "redirect:/admin/index";
	}
	
	// 상품 목록 
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		
		logger.warn("get goods list");
		
		List<GoodsViewVO> list = adminService.goodslist();	
		model.addAttribute("list", list);
	}
	
	// 상품 목록 조회 - 상품 링크 클릭 시 조회 화면으로 이동
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		
		logger.warn("get goods view");
		
		GoodsViewVO goods = adminService.goodsView(gdsNum);		
		model.addAttribute("goods", goods);
	}
	
	// 상품 수정 get
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
		
		logger.warn("get goods modify");
		
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
		List<CategoryVO> category = null;
		category = adminService.catregory();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 수정 post
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		
		logger.warn("post goods modify");
		
		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("gdsImg")).delete();
		  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setGdsImg(req.getParameter("gdsImg"));
		  vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }
		
		adminService.goodsModify(vo);
		
		return "redirect:/admin/index";
	}
	
	// 상품 삭제 
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		
		logger.warn("post goods delete");
		
		adminService.goodsDelete(gdsNum);
		
		return "redirect:/admin/index";
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
	            @RequestParam MultipartFile upload) throws Exception {
	   
		logger.warn("post CKEditor img upload");
	   
	   // 랜덤 문자 생성
	   UUID uid = UUID.randomUUID();
	   
	   OutputStream out = null;
	   PrintWriter printWriter = null;
	     
	   // 인코딩
	   res.setCharacterEncoding("utf-8");
	   res.setContentType("text/html;charset=utf-8");
	   
	   try {
	    
	    String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	    byte[] bytes = upload.getBytes();
	    
	    // 업로드 경로
	    String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	    logger.warn("업로드 경로 : " + ckUploadPath);
	    out = new FileOutputStream(new File(ckUploadPath));
	    out.write(bytes);
	    out.flush();  // out에 저장된 데이터를 전송하고 초기화
	   
	    String callback = req.getParameter("CKEditorFuncNum");
	    logger.warn("callback : " + callback);
	    
	    printWriter = res.getWriter();
	    
	    String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
	    
	    // 업로드시 메시지 출력
	    printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    printWriter.flush();
	    
	   } catch (IOException e) { e.printStackTrace(); 
	   } finally {
		try { 
			if(out != null) { out.close(); }
			if(printWriter != null) { printWriter.close(); }
	    } 
	    catch(IOException e) { e.printStackTrace(); }
	   }
	   
	   return;   
	}
	
	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		
	   logger.warn("get order list");
	     
	   List<OrderVO> orderList = adminService.orderList();
	   
	   model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록 
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId,
	        OrderVO order, Model model) throws Exception {
		
	   logger.warn("get order view");
	   
	   order.setOrderId(orderId);    
	   List<OrderListVO> orderView = adminService.orderView(order);
	   
	   model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		
		logger.warn("post order view");
	   
		adminService.delivery(order);

		// 상품 수량 조절 
		List<OrderListVO> orderView = adminService.orderView(order); 

		GoodsVO goods = new GoodsVO();
		  
		for(OrderListVO i : orderView) {
		 goods.setGdsNum(i.getGdsNum());
		 goods.setGdsStock(i.getCartStock());
		 adminService.changeStock(goods);
		}
		
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	// 모든 소감(댓글) get
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
		
	   logger.warn("get all reply");
	     
	   List<ReplyListVO> reply = adminService.allReply();
	   
	   model.addAttribute("reply", reply);
	}
	
	// 모든 소감(댓글) post
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String postAllReply(ReplyVO reply) throws Exception {
		
		logger.warn("post all reply");
					
		adminService.deleteReply(reply.getRepNum());
			
		return "redirect:/admin/shop/allReply";
	}
	
}
