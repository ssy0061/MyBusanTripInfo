<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
	.footer-web{
		border: 2px dotted green;
		width: 100%;
		height: 100px;
		background-color: white;
	}
	@media screen and (max-width: 575px) {
		.footer-web {
		  display: none;
		}
	}
	.footer-mobile{
		border-radius: 20px 20px 0 0;
		width: 100%;
		position: fixed;
		bottom: 0;
		background-color: white;
		transition: 0.3s;
		padding: 0 10px 10px 10px;
		align-items: center;
		box-shadow: 0 -3px 10px 2px lightgray;
		z-index: 99;
	}
	@media screen and (min-width: 576px) {
		.footer-mobile{
			display: none;
		}
	}
	.icon{
		margin:0 auto;
		width: 70px;
		height: 70px;
		/*
		border: 3px solid lightGray;
		border-radius: 15px;
		*/
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
		cursor: pointer;
		font-family: 'Dongle', sans-serif;
	}
	.icon-wrapper{
		padding-left: 5px;
		padding-right: 5px;
	}
	.bi{
		height: 32px;
	}
</style>
<script type="text/javascript">
	$(function() {
		function isLogin() {
			if(<%= (String)session.getAttribute("memberId") != null%>
				&& <%= session.getAttribute("loginUser") != null%>) return true
			else return false
		}
		
		
		
		let scrollNum = 0;
		window.addEventListener('scroll', function(){
			if(matchMedia("screen and (max-width: 575px)").matches){
				if(scrollNum<window.scrollY){
					$('.footer-mobile').css("opacity", "0")
					$('.footer-mobile').css("display", "none")
					setTimeout(function() {
						$('.footer-mobile').css("display", "block")
						$('.footer-mobile').css("opacity", "1")
					}, 700);
				}else{
					$('.footer-mobile').css("display", "block")
					$('.footer-mobile').css("opacity", "1")
				}
				scrollNum = window.scrollY
			}
		})
		$(window).resize(function() {
			if(matchMedia("screen and (max-width: 575px)").matches){
				$('.footer-mobile').css("display", "block");
			}else{
				$('.footer-mobile').css("display", "none");
			}
		});
		const path = window.location.pathname.split('/').pop(1);
		/* console.log(path); */
		if(path==='home'){
			$('.bi-house-door').css({"display":"none"});
			$('.bi-house-door-fill').css("display","block");
			$('.icon-home div').css("color", "black");
		}else if(path==='search'){
			$('.bi-piggy-bank').css("display","none");
			$('.bi-piggy-bank-fill').css("display","block");
			$('.icon-search div').css("color", "black");
		}else if(path==='trip'){
			$('.bi-image').css("display","none");
			$('.bi-image-fill').css("display","block");
			$('.icon-trip div').css("color", "black");
		}else if(path==='place'){
			$('.bi-geo-alt').css("display","none");
			$('.bi-geo-alt-fill').css("display","block");
			$('.icon-place div').css("color", "black");
		}
		
		$('.icon-home').click(function(){
			location.href='/bnk/home';
		})
		$('.icon-search').click(function(){
			if(!isLogin()) location.href='/bnk/login'
			else location.href='/bnk/search';
		})
		$('.icon-trip').click(function(){
			if(!isLogin()) location.href='/bnk/login'
			else location.href='/bnk/trip';
		})
		$('.icon-place').click(function(){
			location.href='/bnk/place';
		})	
	});
</script>
</head>
<body>
	<footer class="footer-mobile">
		<div class="row icon-wrapper">
			<div class="row icon icon-home">
				<i class="bi bi-house-door" style="font-size: 2rem; color: #646464"></i>
				<i class="bi bi-house-door-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>홈</b></div>
			</div>
			<div class="row icon icon-search">
				<i class="bi bi-piggy-bank" style="font-size: 2rem; color: #646464""></i>
				<i class="bi bi-piggy-bank-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>조회</b></div>
			</div>
			<div class="row icon icon-trip">
				<i class="bi bi-image" style="font-size: 2rem; color: #646464""></i>
				<i class="bi bi-image-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>머니앨범</b></div>
			</div>
			<div class="row icon icon-place">
				<i class="bi bi-geo-alt" style="font-size: 2rem; color: #646464""></i>
				<i class="bi bi-geo-alt-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>핫플</b></div>
			</div>
		</div>
	</footer>
	<footer class="footer-web">
		<h2 align="center">web</h2>
	</footer>
</body>
</html>