<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    
    <link href="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    

	<!-- Header - set the background image for the header in the line below-->
	<header class="py-5 bg-image-full" style="background-image: url('/resources/images/img5.jpg'); width:2000px, 1000px;">
		<div class="text-center my-5">
            <img class="img-fluid rounded-circle mb-4" src="/resources/images/logo5.JPG" style="width:270px;" alt="..." />
            <h1 class="text-white fs-3 fw-bolder title"><a href="/">Wave-Books</a></h1>
            <p class="text-white-50 mb-0">Landing Page Template</p>
            
				<!-- 검색창 -->  				
				          
            	<div id="search_box" class="container-fluid">
					<form name="search-form" autocomplete="off" 
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						
						<div class="input-group">
							<select name=type class=" form-control bg-light border-0 small" style="width: 60px!important;">
								<option selected value="gdsName">제목</option>
							</select>
							
							<input type="text" name="keyword" value="" 
							class="form-control bg-light border-0 small" placeholder="Search for..."
					              aria-label="Search" aria-describedby="basic-addon2" style="width: 190px!important;"/>
				         
				             
					        <div class="input-group-append">      
							<input type="button" onClick="getSearchList()" class="btn btn-primary" value="검색" />
							
							
							</div>
						</div>	
						
						<script>
							function getSearchList(){
								
								$('#searchResult').css({
									"display": "block"
								}); 
								
								$.ajax({
									type: 'GET',
									url : "/shop/getSearchList",
									data : $("form[name=search-form]").serialize(),
									success : function(result){
										console.log(result);
										//테이블 초기화
										$('#boardtable > tbody').empty();
										if(result.length>=1){
											result.forEach(function(item){
												str='<tr>'
												str += "<td>" + item.gdsNum + "</td>";
												str+="<td>" + item.gdsName + "</td>";
												str+="<td>" + item.gdsPrice + "원" + "</td>";
												str+="<td>" + item.gdsStock + "개" + "</td>";
												str+="</tr>"
												$('#boardtable').append(str);
							        		})				 
										}
									}
								})
							}
						</script>
						
					</form>
					
					<div id="searchResult" class="card shadow mb-4" style="margin: 20px auto; 
							max-width: 600px; display: none;">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"> 검색 내역</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
					
								<table id="boardtable" class="table table-bordered" style="width:100%; cellspacing: 0;">
								
								</table>
							</div>
						</div>
					</div>
				</div>	                      
        </div>
    </header>
    
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/js/demo/chart-area-demo.js"></script>
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/js/demo/chart-pie-demo.js"></script>
    
        <!-- Page level plugins -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/js/demo/datatables-demo.js"></script>

