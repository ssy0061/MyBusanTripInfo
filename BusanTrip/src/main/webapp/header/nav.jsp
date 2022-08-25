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
        border-bottom-width:4px;
        border-color:#cb333b;
	}
	@media screen and (max-width: 575px) {
		.nav-web {
			display: none;
		}
		.nav-mobile{
			display:flex;
			justify-content: flex-start;
			padding-top: 6px;
			align-items: center;
		}
		#navHome{
			width: 100%;
			display:flex;
			justify-content: center;
			padding-bottom: 5px;
		}
		#navTitle{
			padding-left: 20px;
		}
		#navSubTitle{
			padding-left: 80px;
		}
		#navSubTitle>h3{
			display: inline;
			margin: 0;
		}
		#navSubTitle>.back{
			position: fixed;
			left: 10px;
			top: 12px;
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
<script type="text/javascript">
	$(function(){
		$('.back').click(function(){
			window.history.back();
		})
	});
</script>
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
				<div id="navTitle">
					<h2 align="center">${param.navTitle}</h2>
				</div>
			</c:when>
			<c:when test="${param.navSubTitle!=null}">
				<div id="navSubTitle">
					<div class="back"><i class="bi bi-chevron-left" style="font-size: 2.2rem;"></i></div>
					<h3 align="center">${param.navSubTitle}</h3>
				</div>
			</c:when>
			<c:otherwise>
				<div id="navHome">
					<img src="img/mbti.png" id="homelogo">
				</div>
			</c:otherwise>
		</c:choose>
		
	</nav>
</body>
</html>