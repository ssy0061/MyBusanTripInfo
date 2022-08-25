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
		.nav{
			height: 80px;
		}
		.nav-web {
			display: none;
		}
		.nav-mobile{
			display:flex;
			justify-content: flex-start;
			padding-top: 6px;
			align-items: center;
		}
		#navHomeImgWrap{
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
			top: 15px;
		}
		
	}
	@media screen and (min-width: 576px) {
		.nav{
			height: 90px;
		}
		.nav-mobile{
			display: none;
		}
		.nav-web {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 0 10%;
		}
		.navMenus{
		}
		.navMenus div{
			display: inline;
			margin: auto 10px;
			font-size: 1.2rem;
			cursor: pointer;
		}
		.navMenus a{
			text-decoration: none;
			color: black;
		}
	}
	#nvaHomeMobileLogo{
		height: 60px;
	}
	#navHomeWebLogo{
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
		<a href="/"><img src="img/mbti.png" id="navHomeWebLogo"></a>
		<div class="navMenus">
			<div><a href="#">조회</a></div>
			<div><a href="#">여행스토리</a></div>
			<div><a href="#">핫플</a></div>
			<div><a href="#">MyPage</a></div>
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
				<div id="navHomeImgWrap">
					<img src="img/mbti.png" id="nvaHomeMobileLogo">
				</div>
			</c:otherwise>
		</c:choose>
		
	</nav>
</body>
</html>