<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Wave_Books</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	div#asideandcontent { display: flex; }
</style>

<style>

	li { list-style: none; }
	
	div#container_box { width: 850px; margin: 10px auto; }

 	section#content { margin:20px 0; }
 	section#content ul li img { width:250px; height:250px; }
 	section#content ul li::after { content:""; display:block; clear:both; }

 	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }

</style>	
	
</head>
<body>

<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<div id="asideandcontent">
		
		<aside id="aside">
			<%@ include file="../include/aside.jsp" %>
		</aside>
		
		<div id="container_box">
			
			<section id="content">
				
				<ul class="orderList">
				  <c:forEach items="${orderList}" var="orderList">
				  <li>
				  <div>
					   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
					   <p><span>수령인</span>${orderList.orderRec}</p>
					   <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
					   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
					   <p><span>상태</span>${orderList.delivery}</p>
				  </div>
				  </li>
				  </c:forEach>
				</ul>

				
			</section>
			
		
		</div>
	</div>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>

</div>

</body>
</html>
