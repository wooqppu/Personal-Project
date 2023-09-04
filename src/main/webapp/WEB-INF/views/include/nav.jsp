<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
            <a class="navbar-brand" href="/">Wave_Books</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    
                <c:if test="${member == null}">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="../member/signin">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="../member/signup">Sign Up</a></li>
                </c:if>
                    
                <c:if test="${member != null}">	
		            
		            	<li class="nav-item"><span class="nav-link" style="color: #fff; margin-right: 30px;">${member.userName} 님, 환영합니다.</span></li>
		            
		            <c:if test="${member.verify == 9}">
		                <li class="nav-item"><a class="nav-link" href="/admin/index">Admin 관리자 화면</a></li>
		            </c:if>
		                    
		                <li class="nav-item"><a class="nav-link" href="/shop/cartList">장바구니</a></li>
		                <li class="nav-item"><a class="nav-link" href="/shop/orderList">주문 목록</a></li>
		                    
		                <li class="nav-item"><a class="nav-link" href="/member/signout">Logout</a></li>
                    
                    
                </c:if>
                </ul>
                
           </div>
		</div>
	</nav>
