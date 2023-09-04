<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">   
    
    	<div class="sidebar-brand-text mx-3">
    		<h3 style="padding: 20px 0; color: #fff; text-align: center;">Category</h3>
    	</div>
    	
    	<!-- Divider -->
        <hr class="sidebar-divider" >
    	
    	<li class="nav-item">
    		<a href="/shop/list?c=100&l=1" class="nav-link collapsed" data-toggle="collapse" 
    		data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">    		
    			<span style="padding-left: 50px; font-size: 20px;">국내도서</span>
    		</a>
    	
    		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
    			<div class="bg-white py-2 collapse-inner rounded">
	    			<a class="collapse-item" href="/shop/list?c=101&l=2">소설</a>
	    			<a class="collapse-item" href="/shop/list?c=102&l=2">시/에세이</a>
	    			<a class="collapse-item" href="/shop/list?c=103&l=2">인문</a>
	    		</div>	
    		</div>
    	</li>
    	
    	<!-- Divider -->
        <hr class="sidebar-divider" >
    	
    	<li class="nav-item">
	    	<a href="/shop/list?c=200&l=1" class="nav-link collapsed" data-toggle="collapse" 
	    	data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
	    		<span style="padding-left: 50px; font-size: 20px;">해외도서</span>
	    	</a>
    		
    		
    		<div id="collapseUtilities" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
    			<div class="bg-white py-2 collapse-inner rounded">
	    			<a class="collapse-item" href="/shop/list?c=201&l=2">문학</a>
	    			<a class="collapse-item" href="/shop/list?c=202&l=2">예술/건축</a>
	    			<a class="collapse-item" href="/shop/list?c=203&l=2">인문/사회</a>
	    		</div>	
    		</div>
    	</li>
    		
    </ul>
    

    