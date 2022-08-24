<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<style type="text/css">
	.nav{
		width: 100%;
		height: 80px;
		position: fixed;
		top: 0;
		left: 0;
  		right: 0;
  		background-color: white;
  		display: block;
  		border-bottom-style:solid;
        border-bottom-width:6px;
        border-color:#cb333b;
	}
	@media screen and (max-width: 575px) {
		.nav-web {
			display: none;
		}
		.nav-mobile{
			display:flex;
			justify-content: center;
			align-items: center;
		}
		#navSubTitle{
			display: flex;
			justify-content: space-between;
		}
		#navSubTitle>h2{
			display: inline;
			margin: 0;
		}
		#navSubTitle>i{
			position: fixed;
			left: 10px;
			top: 10px;
		}
	}
	@media screen and (min-width: 576px) {
		.nav-mobile{
			display: none;
		}
	}
	#homelogo{
		height: 60px;
	}
</style>
</head>
<body>
	<nav class="nav nav-web">
		<div>
			<h2 align="center">web</h2>
		</div>
	</nav>
	<nav class="nav nav-mobile">
		<c:choose>
			<c:when test="${param.navTitle!=null}">
				<h2 align="center">${param.navTitle}</h2>
			</c:when>
			<c:when test="${param.navSubTitle!=null}">
				<div id="navSubTitle">
					<i class="bi bi-chevron-left" style="font-size: 2rem;"></i>
					<h2 align="center">${param.navSubTitle}</h2>
					<span></span>
				</div>
			</c:when>
			<c:otherwise>
				<img src="img/mbti.png" id="homelogo">
			</c:otherwise>
		</c:choose>
		
	</nav>
</body>
</html>