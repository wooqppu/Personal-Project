<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/bootstrap/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/bootstrap/sb-admin-2.css" rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />


 <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block" style="width:600x800; 
                            	background: url(/resources/images/welcome.JPG); background-position: center; 
                            	background-size: cover;">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome to Wave_Books!</h1>
                                    </div>
                                    
                                    
                                    <form class="user" role="form" method="post" autocomplete="off" action="/member/signin">
                                        
                                        <div class="form-group input_area">
                                            <input type="email" id="userId" name="userId" 
                                            	class="form-control form-control-user" aria-describedby="emailHelp" required="required"
                                                placeholder="Enter Email Address..." />
                                        </div>
                                        
                                        <div class="form-group input_area">
                                            <input type="password" id="userPass" name="userPass" 
                                            	class="form-control form-control-user" required="required"
                                                placeholder="Password">
                                        </div>

										<button type="submit" id="signin_btn" name="signin_btn" 
												class="btn btn-primary btn-user btn-block">Login</button>
												
									  <c:if test="${msg == false}">
									  	<p style="color:#f00;">로그인에 실패했습니다.</p>
									  </c:if>		
                                    
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
	
	</div>
    

    <!-- Bootstrap core JavaScript 
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript 
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/sb-admin-2.min.js"></script>    
        	
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>