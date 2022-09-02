<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
	.nav{
		width: 100%;
		height: 70px;
		position: fixed;
		top: 0;
		left: 0;
  		right: 0;
  		background-color: white;
  		display: block;
  		border-bottom-style:solid;
        border-bottom-width:4px;
        border-color:#cb333b;
        z-index: 99;
	}
	#nvaHomeMobileLogo{
		height: 55px;
	}
	#navHomeWebLogo{
		height: 60px;
	}
	.navMenusButton{
		display: inline;
		cursor: pointer;
	}
	.navMenusButtonClose{
		display: none;
		cursor: pointer;
	}
	@media screen and (max-width: 575px) { /* moblie  */
		.nav{
			height: 70px;
		}
		.nav-web {
			display: none;
		}
		.nav-mobile{
			display:flex;
			justify-content: flex-start;
			align-items: center;
		}
		#navHomeImgWrap{
			width: 100%;
			display:flex;
			justify-content: center;
			padding-top: 5px;
		}
		#navTitle{
			padding-left: 20px;
			margin-top: 20px;
			font-family: 'Do Hyeon', sans-serif;
		}
		#navSubTitle{
			padding-left: 80px;
			margin-top: 20px;
			font-family: 'Do Hyeon', sans-serif;
		}
		#navSubTitle>h3{
			display: inline;
		}
		#navSubTitle>.back{
			position: fixed;
			left: 10px;
			top: 20px;
			cursor: pointer;
		}
		.arrow_back_ios_new {
			font-size: 1.75rem;
			font-variation-settings:
			'FILL' 1,
			'wght' 600,
			'GRAD' 0,
			'opsz' 24
		}
		#navUserImgWrap{
			position: fixed;
			top: 10px;
			right: 15px;
			border: 2px solid #CB333B;
			box-shadow:1px 2px 3px 0 #53565A;
		}
		#navUserImgWrap:hover{
			cursor: pointer;
		}
		#navUserImg{
			width: 45px;
		}
	}
	@media screen and (min-width: 575.1px) { /* mini web  */
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
			padding-left: 50px;
			padding-right: 50px;
			padding-top: 15px;
		}
		.navMenus{
			display: none;
		}
		.navMenusButton{
			display: inline;
			cursor: pointer;
		}
		.navMenusButtonClose{
			display: none;
			cursor: pointer;
		}
		#collpaseBtn{
			color: black;
		}
		#collpaseBtn:hover{
			color: black;
			background-color: white;
		}
		.collpaseWrap{
			position: fixed;
			width: 100%;
			background-color: white;
			top: 85px;
		}
		#navCollpase {
		  	border-bottom-style:solid;
	        border-bottom-width:4px;
	        border-color:#cb333b;
	        padding-bottom: 30px;
		}
		#navCollpase a{
			text-decoration: none;
			color: black;
		}
		#navCollpase div{
			padding-left: 100px;
			margin-top: 20px;
		}
		
	}
	@media screen and (min-width: 720px){
		.navMenus{
			display: inline;
			margin-top: 5px;
		}
		.navMenusButton{
			display: none;
		}
		.navMenusButtonClose{
			display: none;
		}
		.nav-web{
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding-left: 50px;
			padding-right: 50px;
			margin: 0 auto;
			max-width: 1200px;
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
</style>
<script type="text/javascript">
	$(function(){
		var memberId = '<%= session.getAttribute("memberId") %>';
		var loginUser = '<%= session.getAttribute("loginUser") %>';
		console.log(loginUser)
		var loginUrl = '/bnk/login'
		if(memberId==='null') {
			$('.needLogin').children('a').attr('href', loginUrl)
		}
		
		$('.back').click(function(){
			window.history.back();
		})
		$('.navMenusButton').click(function(){
			$('#navCollpase').attr("class","collapse show");
			$('.navMenusButton').hide()
			$('.navMenusButtonClose').show()
		})
		$('.navMenusButtonClose').click(function(){
			$('#navCollpase').attr("class","collapse");
			$('.navMenusButtonClose').hide()
			$('.navMenusButton').show()
		})
		$(window).resize(function() {
			$('#navCollpase').attr("class","collapse");
			if(matchMedia("screen and (min-width: 575.1px) and (max-width: 719.9px)").matches){
				$('.navMenusButtonClose').hide()
				$('.navMenusButton').show()
			}else{
				$('.navMenusButtonClose').hide()
				$('.navMenusButton').hide()
			}
		});
		$('#navUserImgWrap').click(function(){
			location.href="/bnk/myPage";
		})
	});
</script>
</head>
<body>
	<nav class="nav">
		<div class="nav-web">
			<a href="/bnk/home"><img src="/img/mbti.png" id="navHomeWebLogo"></a>
			<div class="navMenus">
				<div class="needLogin"><a href="/bnk/search">조회</a></div>
				<div class="needLogin"><a href="/bnk/trip">머니앨범</a></div>
				<div><a href="/bnk/place">핫플</a></div>
				<div class="needLogin"><a href="/bnk/myPage">MyPage</a></div>
			</div>
			<div class="navMenusButton">
			    <i class="bi bi-list" style="font-size: 2.5rem;"></i>
			</div>
			<div class="navMenusButtonClose">
			    <i class="bi bi-x" style="font-size: 2.5rem;"></i>
			</div>
		</div>
		
		<div class="collpaseWrap">
			<div class="collapse" id="navCollpase">
				<div class="needLogin"><a href="/bnk/search">조회</a></div>
				<div class="needLogin"><a href="/bnk/trip">머니앨범</a></div>
				<div><a href="/bnk/place">핫플</a></div>
				<div class="needLogin"><a href="/bnk/myPage">MyPage</a></div>
			</div>
		</div>
		
		<div class="nav-mobile">
			<c:choose>
				<c:when test="${param.navTitle!=null}">
					<div id="navTitle">
						<h2 align="center">${param.navTitle}</h2>
					</div>
				</c:when>
				<c:when test="${param.navSubTitle!=null}">
					<div id="navSubTitle">
						<div class="back">
							<span class="arrow_back_ios_new material-symbols-outlined">
							arrow_back_ios_new
							</span>
						</div>
						<h3 align="center">${param.navSubTitle}</h3>
					</div>
				</c:when>
				<c:otherwise>
					<div id="navHomeImgWrap">
						<a href="/bnk/home"><img src="/img/mbti.png" id="nvaHomeMobileLogo"></a>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${loginUser!=null}">
					<div id="navUserImgWrap">
						<img src="${loginUser.memberChar}" id=navUserImg>
					</div>
				</c:when>
			</c:choose>
		</div>
	</nav>
</body>
</html>