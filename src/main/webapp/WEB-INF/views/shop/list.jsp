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
    body { margin: 0; padding: 0; }
	li { list-style: none; }
	
	div#container_box { margin: 10px auto; }
	
	section#content { width: 900px; margin: 70px auto; background-color: #eee; padding: 20px; }
	
	 /*section#content ul { padding: 0; margin: 0; }
	 section#content ul li { display:inline-block; margin:20px 10px; }
	 section#content div.goodsThumb img { width:150px; height:200px; }*/
	 
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	 
	 section#content ul { padding: 0; margin: 0; display: flex; justify-content: space-between; }
	 section#content ul li { width: 23%; }
	 section#content ul li img { width: 100%; }

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
				
				<ul>
					<c:forEach items="${list}" var="list">
					<li>
						<div class="goodsThumb">
							<img src="${list.gdsThumbImg}">
						</div>
						<div class="goodName">
							<a href="/shop/view?n=${list.gdsNum}">${list.gdsName}</a>
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
