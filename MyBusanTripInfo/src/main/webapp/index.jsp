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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.container{
		border: 5px dotted red;
		min-height: 100vh;
	    width: 100%;
	    margin: 100px auto;
	    padding-top: 30px;
	    padding-bottom: 30px;
	}
	p{
		margin-top: 100px;
	}
</style>
</head>
<body>
	<div>
		<c:import url="header/nav.jsp" />
		<div class="container">
			<h2 align="center">홈</h2>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
		</div>
		<c:import url="footer/footer.jsp" />
	</div>
</body>
</html>