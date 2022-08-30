<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">

	:root {
	  --bnk-red: #E60000;
	  --bnk-dark-red: #BE0000;
	  --bnk-gray: #545443;
	  --bnk-grey: #545443;
	  --bnk-lightgray: #B3B38F;
	  --bnk-lightgrey: #B3B38F;
	}
	
	.index{
		border: 5px dotted red;
		height: 50vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	    position: relative;
	}
	
</style>

<script>
	$(function(){
		$('.searchBtn').click(function(){
			alert('search!');
		});  // img click
		$('.memoBtn').click(function(){
			alert('memo!');
		});  // img click
	});
	
	
</script>

</head>
<body> 
	<div>
		<c:import url="/header/nav.jsp">
			<c:param name="navSubTitle" value="상세기능"/>
		</c:import>
		
		<div class="index container">
			<h2 align="center">
			<img class="searchBtn" src="./img/search.png" width=40px>
			<img class="memoBtn" src="./img/memo.png" width=40px>
			</h2>
			
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Small Modal</button>
		</div>
		
		<c:import url="/footer/footer.jsp" />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Header</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <p>This is a small modal.</p>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary">Submit</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</body>
</html>