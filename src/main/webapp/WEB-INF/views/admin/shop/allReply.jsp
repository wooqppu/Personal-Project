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
	
	div#container_box { width: 850px; margin: 40px auto; }

 	section#content { margin:20px 0; }
 	section#content ul li img { width:250px; height:250px; }
 	section#content ul li::after { content:""; display:block; clear:both; }

 	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 	
 	#container_box ul li { margin-bottom:30px; border:10px solid #eee; }
	.replyInfo { background:#eee; padding:10px; font-size:18px; }
	.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
	.replyContent { padding:10px; }	
	
	 div.replyControll button { margin: 10px 0 0 10px; background:#fff; border: 1px solid #4e73df; color: #4e73df; }
	 div.replyControll button:hover { background: #4e73df; border:1px solid #4e73df; color: #fff; }
	
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
	   
		   <ul>
		    	<c:forEach items="${reply}" var="reply">
		    	<li>
		     		<div class="replyInfo">
		      			<p>
		       				<span>작성자</span>${reply.userName} (${reply.userId})
		      			</p>
		      			
				      	<p>
				       		<span>작성된 상품</span> <a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
				      	</p>
		     		</div>
		    
			     	<div class="replyContent">
			      		${reply.repCon}
			     	</div>
			     	
			     	<div class="replyControll">
					   <form role="form" method="post">
						    <input type="hidden" name="repNum" value="${reply.repNum}" />
						    <button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
					   </form>
					</div>
		   
		    	</li>       
		    	</c:forEach>
		   </ul>
		   
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
