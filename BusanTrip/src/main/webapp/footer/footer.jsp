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
		width: 100%;
		height: 140px;
		background-color: #545443;
	}
	.footer-wrapper {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		padding: 25px 50px;
		margin: 0 auto;
		max-width: 1200px;
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
	.footer-left, .footer-right{
		margin: 0 10px;
		height: 90px;
	}
	.footer-left{ width: 350px; }
	.footer-right{ width: 100%; }
	.footer-title{
		font-weight: bold;
		font-size: 25px;
		color: #F8F8F8;
	}
	.footer-inner {
		margin: 5px 0 0;
	}
	.footer-icon-wrapper{
		margin: 5px 0 0;
	}
	.footer-inner *{
		line-height: 20px;
		font-size: 13px;
		color: #D4D4D4;
	}
	.impact{
		color: #E60000;
	}
	.button{
		border: none;
		text-align: center;
		opacity: 0.6;
		transition: 0.3s;
		display: inline-block;
		text-decoration: none;
		cursor: pointer;
		background-color: #545443;
	}
	.button img{
		width: 40px;
		height: 40px;
		margin: 0;
	}
	.button:hover{ opacity: 1 }
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
		
		const path = window.location.pathname.split('/').pop(1);
		/* console.log(path); */
		
		$(window).resize(function() {
			if(matchMedia("screen and (max-width: 575px)").matches){
				if(path!=='login' && path!=='register'){
					console.log(path)
					$('.footer-mobile').css("display", "block");
				}
			}else{
				$('.footer-mobile').css("display", "none");
			}
		});
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
		}else if(path==='login' || path==='register'){
			$('.footer-mobile').css("display","none");
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
		
		$('#f-i').click(function() {
			if (! $(this).attr('class').includes('engines'))
				$(this).attr('class', 'bi bi-airplane-engines-fill');
			else {
				let a = parseInt(Math.random()*255);
				let b = parseInt(Math.random()*255);
				let c = parseInt(Math.random()*255);
				$(this).parent().css('color', 'rgb('+a+', '+b+', '+c+')')
			}
		})
		
		$(document).keydown(function(event) {
			let hop = 5;
			$('#f-i').css('position', 'relative');
			let nowx = parseInt((window.getComputedStyle(document.getElementById("f-i")).left).split('px')[0]);
			let nowy = parseInt((window.getComputedStyle(document.getElementById("f-i")).bottom).split('px')[0]);
			if (event.keyCode == '38') { nowy += hop; } else if (event.keyCode == '40') { nowy -= hop; }
			else if (event.keyCode == '37') { nowx -= hop; } else if (event.keyCode == '39') { nowx += hop; }
			$('#f-i').css('bottom', nowy + 'px'); $('#f-i').css('left', nowx + 'px'); 
		});
	});
</script>
</head>
<body>
	<footer class="footer-mobile">
		<div class="row icon-wrapper">
			<div class="row icon icon-home">
				<i class="bi bi-house-door" style="font-size: 2rem; color: #646464"></i>
				<i class="bi bi-house-door-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>???</b></div>
			</div>
			<div class="row icon icon-search">
				<i class="bi bi-piggy-bank" style="font-size: 2rem; color: #646464"></i>
				<i class="bi bi-piggy-bank-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>??????</b></div>
			</div>
			<div class="row icon icon-trip">
				<i class="bi bi-image" style="font-size: 2rem; color: #646464"></i>
				<i class="bi bi-image-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>????????????</b></div>
			</div>
			<div class="row icon icon-place">
				<i class="bi bi-geo-alt" style="font-size: 2rem; color: #646464"></i>
				<i class="bi bi-geo-alt-fill" style="font-size: 2rem; display: none;"></i>
				<div class="" align="center" style="color: #646464"><b>??????</b></div>
			</div>
		</div>
	</footer>
	<footer class="footer-web">
		<div class="footer-wrapper col">
			<div class="footer-left">
				<div class="footer-title">
					????????????<span class="impact">?????? <i class="bi bi-airplane-fill" id="f-i"></i></span>
				</div>
				<div class="footer-icon-wrapper">
					<button class="button"><img src="/img/foot_web_github.png" onclick="location.href='https://github.com/ssy0061/MyBusanTripInfo'"></button>
					<button class="button"><img src="/img/foot_web_notion.png" onclick="location.href='https://www.notion.so/Web-Project-5948018eede144498ed4a67968dfafef'"></button>
				</div>
			</div>
			<div class="footer-right">
				<div class="footer-inner">
					<div><b>??? ???:</b> MBTI (2???)</div>
					<div><b>Front-end:</b> ?????????, ?????????, ?????????</div>
					<div><b>Back-end:</b> ?????????, ?????????</div>
					<div><b>???????????? ?????? ??????:</b> 2022. 08. 10. ~ 2022. 09. 08.</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>