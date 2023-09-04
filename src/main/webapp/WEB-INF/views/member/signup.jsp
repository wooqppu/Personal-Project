<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/bootstrap/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/bootstrap/sb-admin-2.css" rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />



	<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block" style="width:600x800;
                    	background: url(/resources/images/welcome.JPG);
    					background-position: center; background-size: cover;">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            
                            <form class="user" role="form" method="post" autocomplete="off" action="/member/signup">                               

								<div class="form-group row">
                         			<div class="col-sm-6 mb-3 mb-sm-0">
                                 		<input type="text" class="form-control form-control-user"
                                 		id="userName" name="userName" placeholder="이름을 입력해주세요" required="required" />
                          			</div>
                          
	                          		<div class="col-sm-6">
	                                 	<input type="text" class="form-control form-control-user" 
	                                 	id="userPhon" name="userPhon" placeholder="연락처를 입력해주세요" required="required" />
	                           		</div>
                   				</div>

                                <div class="form-group">
                                    
                                    <input type="email" id="userId" name="userId" class="form-control form-control-user"
                                    placeholder="example@email.com" required="required" />                                   
 
                                    <input type="password" class="form-control form-control-user"
                                     id="userPass" name="userPass" required="required"
                                       placeholder="Password" />

                                </div>
                                
                                <button type="submit" id="signup_btn" name="signup_btn" 
                                class="btn btn-primary btn-user btn-block">Register Account</button>
                                
                                <script>
                                	
                                </script>

                            </form>
                            <hr>

                            <div class="text-center">
                                <a class="small" href="signin">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

	
	<!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/sb-admin-2.min.js"></script>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>