<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
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
		padding: 7px 10px 5px 10px;
		align-items: center;
		box-shadow: 0 -3px 10px 2px lightgray;
	}
	@media screen and (min-width: 576px) {
		.footer-mobile{
			display: none;
		}
	}
	.icon{
		margin:0 auto;
		width: 80px;
		height: 80px;
		border: 3px solid lightGray;
		border-radius: 15px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.icon-wrapper{
		padding-left: 10px;
		padding-right: 10px;
	}
</style>
<script type="text/javascript">
	$(function() {
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
	})
</script>
</head>
<body>
	<footer class="footer-mobile">
		<div class="row icon-wrapper">
			<div class="row icon icon-home">
				<i class="bi bi-house-door" style="font-size: 2rem;"></i>
				<div class="col-12" align="center">홈</div>
			</div>
			<div class="row icon icon-search">
				<i class="bi bi-piggy-bank" style="font-size: 2rem;"></i>
				<div class="col-12" align="center">조회</div>
			</div>
			<div class="row icon icon-trip">
				<i class="bi bi-image" style="font-size: 2rem;"></i>
				<div class="col-12" align="center">여행</div>
			</div>
			<div class="row icon icon-place">
				<i class="bi bi-geo-alt" style="font-size: 2rem;"></i>
				<div class="col-12" align="center">핫플</div>
			</div>
		</div>
	</footer>
	<footer class="footer-web">
		<h2 align="center">web</h2>
	</footer>
</body>
</html>