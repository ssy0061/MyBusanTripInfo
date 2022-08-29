<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	.icon-wrapper{
		padding-left: 10px;
		padding-right: 10px;
		justify-content: center;
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
			<div class="icon">
				<a href="/"><img src="img/icon_home.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="/search"><img src="img/icon_search.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="/trip"><img src="img/icon_trip.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="/place"><img src="img/icon_place.png" width="80px" height="80px"></a>
			</div>
		</div>
	</footer>
	<footer class="footer-web">
		<h2 align="center">web</h2>
	</footer>
</body>
</html>