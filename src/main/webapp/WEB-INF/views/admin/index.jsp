<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/resources/jquery/jquery-3.3.1.min.js"></script>

     <!-- Favicon-->
     <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
     <!-- Core theme CSS (includes Bootstrap)-->
     <link href="/resources/css/styles.css" rel="stylesheet" />

	<link href="/resources/bootstrap/sb-admin-2.css" rel="stylesheet" /> 
    <link href="/resources/bootstrap/sb-admin-2.min.css" rel="stylesheet" /> 


<style>
	div#asideandcontent { display: flex; }
</style>
   
	
	<title>Wave_Books Admin</title>	

</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@include file="include/header.jsp" %>
			</div>				
		</header>
		
		<nav id="nav">
			<div id="nav_box">
				<%@include file="include/nav.jsp" %>
			</div>
		</nav>
		
		<div id="asideandcontent">
			<aside id="aside">
				<%@ include file="include/aside.jsp" %>
			</aside>
		
	        <!-- Content section-->
	        <section class="py-5">
	            <div class="container my-5">
	                <div class="row justify-content-center">
	                    <div class="col-lg-6">
	                    
	                    
	                    	<div><img src="/resources/images/admin--folder.jpg" style="width: 850px; height: 300px;"></div>
	                    
	                        <div class="container-fluid" style="width: 900px;">
		                        
		                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
			                        <h3 class="h3 mb-0 text-gray-800" style="padding: 10px;">Admin Mode</h3>
			                        
			                        <p class="lead" style="padding: 25px 10px 10px 10px;">
			                        	This is Admin Mode. This is Admin Mode. This is Admin Mode.
			                        	This is Admin Mode. This is Admin Mode. This is Admin Mode.
			                        	This is Admin Mode. This is Admin Mode. This is Admin Mode.
			                        	This is Admin Mode. This is Admin Mode. This is Admin Mode.
			                        </p>	                        
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
		
		<footer id="footer">
			<div id="footer_box">
				<%@include file="include/footer.jsp" %>
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