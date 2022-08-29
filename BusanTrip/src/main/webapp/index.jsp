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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">
	.index{
		min-height: 100vh;
	    width: 100%;
	    margin-top:100px;
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
		<c:import url="/header/nav.jsp">
			<%-- param 없으면 home log 출력--%>
			<%-- <c:param name="navTitle" value="주요기능"/> --%>
			<%-- <c:param name="navSubTitle" value="상세기능"/> --%>
			<c:param name="navSubTitle" value="상세기능"/>
		</c:import>
		<div class="index container p-5">
			<h2 align="center">홈</h2>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
			<p>contents</p>
		</div>
		<c:import url="/footer/footer.jsp" />
	</div>
</body>
</body>
</html>