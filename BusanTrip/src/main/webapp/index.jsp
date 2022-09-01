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
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<style type="text/css">
	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	    padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 80px; /* 상단바 80*/
			padding-bottom: 80px;
			min-height: calc(100vh - 80px);
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 190px);
		}
	}
	/* 상하단 바를 위한 필수 css */
	
	p{
		margin-top: 100px;
	}
</style>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<%-- param 없으면 home log 출력--%>
		<%-- <c:param name="navTitle" value="주요기능"/> --%>
		<%-- <c:param name="navSubTitle" value="상세기능"/> --%>
		<c:param name="navSubTitle" value="상세기능"/>
	</c:import>
	<div class="content container">
		<img class="animate__animated animate__bounce" src="/img/char.png" id="nvaHomeMobileLogo">
		<h2 align="center">홈</h2>
		<p>contents</p>
		<p>contents</p>
		<p>contents</p>
		<p>contents</p>
		<p>contents</p>
	</div>
	<c:import url="/footer/footer.jsp" />
</body>
</body>
</html>