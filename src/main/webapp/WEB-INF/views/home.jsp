<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

     <!-- Favicon-->
     <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        

     

	<link href="/resources/bootstrap/sb-admin-2.css" rel="stylesheet" /> 
    <link href="/resources/bootstrap/sb-admin-2.min.css" rel="stylesheet" />
          
	<link href="/resources/css/styles.css" rel="stylesheet" />

	<link href="/resources/css/home.css" rel="stylesheet" />

<style>
	div#asideandcontent { display: flex; }
</style>


	<title>Wave_Books</title>
	
</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp" %>
			</div>
		</header>
		
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="include/nav.jsp" %>
			</div>
		</nav>
		
		<div id="asideandcontent">
			<aside id="aside">
				<%@ include file="include/aside.jsp" %>
			</aside>	
	
	        <!-- Content section-->
	        <section class="py-5 content">
	            <div class="container my-5">
	                <div class="row justify-content-center">
	                    <div class="col-lg-6">
	                        
	                        <div class="container-fluid" style="width: 900px;">
		                        
		                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
			                        <h2 class="h3 mb-0 text-gray-800">Book List</h2>
			                        <p class="lead" style="padding: 22px 10px 10px 15px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			                        	Quisque facilisis orci sed erat rhoncus, eu laoreet risus dictum. 
			                        	Proin dignissim erat euismod, efficitur nisi ac, malesuada felis.</p>	                        
		                        </div>
		                        
		                        
		                        <div class="row">
									<c:forEach items="${list}" var="list">

										<div class="col-xl-3 col-md-6 mb-4">
											<div class="card border-left-primary shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
										
															<div class="goodsThumb text-xs font-weight-bold text-primary text-uppercase mb-1">
																<img src="${list.gdsThumbImg}" style="width:150px;">
															</div>
															<div class="goodName h5 mb-0 font-weight-bold text-gray-800">
																<a href="../shop/view?n=${list.gdsNum}">${list.gdsName}</a>
															</div>
										
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								
								
							</div>
	                        
	                    </div>
	                </div>
	            </div>
	        </section>
        </div>
        
        <!-- Image element - set the background image for the header in the line below-->
        <div class="py-5 bg-image-full" style="background-image: url(/resources/images/img6.webp);">
            <!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->
            <div class="bookmark"> 
            	<div class="b-container">
            		<div class="text-center">
            			<img src="/resources/images/book-80.png" class="book-icon">
            			<div class="h-black">BOOKMARK TYPING</div>
            			<div class="h4 bookmark">책 속의 문장을 공유해보세요</div>
            		</div>
            		
            		<div class="bookmark-card">
            			<div class="div-block">
            				<div class="w-embed">
            					<p class="bookmark-text p151">구체적인 목표를 수립한다면 
            					고통은 성장을 촉발하는 강력한 자극제가 된다.</p>
            				</div>
            				<div class="html-embed"></div>
            			</div>
            			<div class="info-share-wrap">
            				<div class="info-title inline">유연함의 힘</div>
            				<div class="info-title inline">, p</div>
            				<div class="info-title inline">81</div>
            				<div class="info-sub">수잔 애쉬포드 지음</div>
            			</div>
            		</div>
            	</div> 
            </div>
        </div>
       
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6" id="banner">
                        <a href="http://localhost:8060/shop/view?n=82"><img src="/resources/images/banner1.png"></a>
                        <a href="http://localhost:8060/shop/view?n=81"><img src="/resources/images/banner2.jpg"></a>                        
                    </div>
                </div>
            </div>
        </section>

		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp" %>
			</div>
		</footer>
	
	</div>
 
	<!-- Bootstrap core JavaScript -->
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript -->
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages -->
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/js/demo/chart-area-demo.js"></script>
    <script src="resources/startbootstrap-sb-admin-2-gh-pages/js/demo/chart-pie-demo.js"></script>   
    
</body>
</html>
