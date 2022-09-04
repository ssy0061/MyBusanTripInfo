<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/animations.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
<%-- scroll 고정. --%>
<script>history.scrollRestoration = "manual"</script>
<style type="text/css">
	*{
		box-sizing:border-box;
	}
	:root {
	  --bnk-red: #E60000;
	  --bnk-dark-red: #BE0000;
	  --bnk-gray: #545443;
	  --bnk-grey: #545443;
	  --bnk-lightgray: #B3B38F;
	  --bnk-lightgrey: #B3B38F;
	  --button-hover: #F5F5F5;
	  --button-active: #EEEEEE;
	}
	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	    padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* 상단바 70*/
			padding-bottom: 80px;
			min-height: calc(100vh - 70px);
		}
		
		.home-top, .home-middle, .home-bottom {
			width: 80%;
			max-width: 400px;
		}
		.web-right{
			margin-top: 15px;
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 260px);
		}
		
		.home-top, .home-middle, .home-bottom {
			width: 92%;
		}
		.web-container{
			display: flex;
			justify-content: space-around;
		}
		.web-left, .web-right{
			width: 100%;
		}
		.web-right{
			margin-top: 0px;
		}
	}
	/* 상하단 바를 위한 필수 css */
	.content{
		/* min-height: 100vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px; */
	}
	
	.home-top, .home-middle, .home-bottom {
		margin: 0 auto;
		text-align: center;
		position: relative;
		border-radius: 5px;
	}
	
	.home-top {
		background-color: #fef0f0;
		height: 180px;
	}
	
	.home-middle {
		max-height: 250px;
		overflow: hidden;
		border-radius: 10px;
		margin-top: 15px;
	}
	
	.home-bottom {
		min-height: 10px;
		padding: 10px 0;
		background-color: #fef0f0;
	}
	
	.home-top-upper {
		height: 100px;
		max-width: 400px;
		width: 80%;
		margin: 0 auto;
		position: relative;
		border-radius: 5px;
		box-shadow: 0px 5px 8px -3px #aaa;
		background-color: white;
	}
	
	.home-top-lower {
		max-width: 400px;
		width: 80%;
		margin: 10px auto 0;
		display: flex;
		justify-content: space-around;
		align-items: center; 
	}
	
	.home-top-inner-left {
		text-align: left;
		font-size: 18px;
		position: relative;
		top: 10px;
		display: flex;
		justify-content: space-around;
		width: 100%;
		padding: 0 10px;
	}
	
	#titleBox {
		width: 100%;
		text-align: left;
	}
	#bnkIcon{
		width:30px;
		height:30px;
		border-style:solid;
		border-radius:10px;
		border-color:#CB333B;
	}
	
	#logoutBox {
		width: 40px;
		text-align: center;
		font-weight: bold;
		position: relative;
		bottom: 14px;
		left: 8px;
		font-size: 24px;
		color: var(--bnk-dark-red);
	}
	
	.home-top-inner-right {
		text-align: right;
		font-size: 30px;
		position: relative;
		padding: 0 12px 0 0;
		bottom: 8px;
		font-weight: bold;
		width: 100%;
	}
	
	@media screen and (max-width: 330px) {  /* 작은폰 */
		.home-top-inner-left { font-size: 15px; }
		.home-top-inner-right { font-size: 25px; }
	}
	@media screen and (min-width: 330.1px) {  /* 그 이상 */
		.home-top-inner-left { font-size: 18px; }
		.home-top-inner-right { font-size: 30px; }
	}
	@media screen and (min-width: 992.1px) {  /* 매우 큰 경우 이상 */
		.home-top-inner-left { font-size: 20px; padding: 0 35px; }
		.home-top-inner-right { font-size: 35px; padding: 0 35px; }
	}
	
	.home-middle-inner {
		max-width: 300px;
		margin: 10px auto;
		overflow: hidden;
		height: auto;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
	}
	
	.button-style {
	    line-height: 2.0;
	    width: 100%;
	    background-color: white;
	    border: 0;
	    border-radius: 5px;
	    font-size: 1rem;
	    text-align: center;
	    box-shadow: 0px 5px 8px -3px #aaa;
	}
	
	.button-style:hover {
	    background-color: var(--bnk-dark-red);
	    color: #fff;
	}
	
	.button-style:active {
	    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
	                inset 2px 2px 3px rgba(0, 0, 0, .6);
	}
	
	.blank { width: 20px; }
	
	.ud-center {
		width: 100%;
		height:250px;
		position: absolute;
		left: 50%; top: 80%;
		transform: translate(-50%, -50%);
	}
	
	.notice {
		margin: 15px auto;
		max-width: 400px;
		width: 80%;
		padding: 5px 5px;
		font-size: 15px;
		border-radius: 5px;
		background-color: #fff;
		box-shadow: 0px 5px 8px -3px #aaa;
	}
	
	.login {
		height: 180px;
	}
	
	.login span{
		font-size: 2rem;
	}
	
	/* event slide 모양 처리 */
	.carousel-indicators {
	    bottom: -15px;
	}
	
	.carousel-indicators li {
		width: 10px;
		height: 10px;
		border-radius: 100%;
	}
	
	.carousel-control-prev { left: -7px; }
	.carousel-control-next { right: -7px; }

</style>

<script>

	$(function() {
		var loginUser = '<%= session.getAttribute("loginUser") %>';
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		if (memberId != 'null') {
			$.ajax({
				type: 'post',
				url: '/member/findMemberInfo',
				data: {'memberId': memberId},
				success: function(result) {
					$('#userName').text(result.memberName);
				},
				error: function(e){ console.log(e); }
			});  // getMemberName end
			
			$.ajax({
				type: 'post',
				url: '/member/getPointBalance',
				data: {'memberId': memberId},
				success: function(result) {
					result = result.toString();
					result = result.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#userMoney').text(result);
				},
				error: function(e){ console.log(e); }
			});  // getBalance end
			
		} else {
			console.log("login User NULL");
		}
		
		$('#logoutBox').click(function() {
			$.ajax({
				type: 'post',
				url: '/member/logout',
				success: function(result) {
					location.href = result;
				},
				error: function(e){ console.log(e); }
			});
			// 로그아웃 기능 수행.
		})
		
		$('.login').click(function() {
			location.href = "./login";
			// 로그인 페이지로 이동
		});
		
		// 공지사항 생성
		var noticeArr = [
			"8월의 여행가실부은 이벤트 당첨자 안내",
			"9월 신규 등록 업체 안내",
			"🌺 동백전과 함께하는 동백 이벤트 🌺",
			"여행가실부은 신규 가입 이벤트!",
			"2030 부산월드엑스포 부산에 유치해~"
		];
		
		for (var i=0; i<5; i++) {
			let notice = noticeArr[i];
			
			// html tag 생성 form
			<%-- <div class="notice">※ 공지사항 ※</div> --%>
			
			let divNotice = document.createElement('div');
			divNotice.setAttribute('class', 'notice');
			divNotice.append(notice);
			
			$('.home-bottom').append(divNotice);
		}
		
		
		$('#chargemodal').on('click', chargepoint)
		$('#paymodal').on('click', paypoint)
	});

	
	function chargepoint(){
		var chargepoint = $('#chargepoint').val();
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		console.log("chargepoint:: " + chargepoint + ", memberId:: " + memberId);
		
		$.ajax({
			type: 'post',
			url: '/member/charge',
			data: {'memberId':memberId, 'amt': chargepoint},
			
			success:function(result) {
				location.href = '/bnk/home';
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
	function paypoint(){
		var paypoint = $('#paypoint').val();
		var paystore = $('#paystore').val();
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		console.log("paypoint:: " + paypoint + ", paystore" + paystore + ", memberId:: " + memberId);
		
		$.ajax({
			type: 'post',
			url: '/member/pay',
			data: {'memberId':memberId, 'amt': paypoint, 'storeName':paystore},
			
			success:function(result) {
				location.href = '/bnk/home';
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
</script>

</head>
<body>

	<div>
		<c:import url="../header/nav.jsp">
			<%-- <c:param name="navSubTitle" value="조회222"/> --%>
		</c:import>
		
		<div class="content container">
			<div class="web-container">
			
				<div class="web-left">
					<div class="home-top slideUp1">
						<div class="ud-center">
							<c:choose>
								<c:when test="${!empty loginUser}">
									<%-- loginUser로 일단 객체 값 받기. --%>
									<div>
										<div class="home-top-upper">
											<div class="ud-center">
												<div class="home-top-inner-left">
													<div id="titleBox">
														<span id="userName"></span>님의 잔액
													</div>
													<div id="logoutBox">&#215;</div>
												</div>
												<div class="home-top-inner-right">
													<span id="userMoney"></span>원
												</div>
											</div>
										</div>
									</div>
									<div>
										<div class="home-top-lower">
											<button class="button-style" type="button"
												data-toggle="modal" data-target="#chargeModal">충전</button>
											<div class="blank"></div>
											<button class="button-style" type="button"
												data-toggle="modal" data-target="#payModal">결제</button>
										</div>
									</div>
								</c:when>
								<c:when test="${empty loginUser}">
									<div class="login">
										<div class="ud-center">
											<span>로그인 하기</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>


					<div class="home-middle slideUp2">
						<div id="eventSlide" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#eventSlide" data-slide-to="0" class="active"></li>
								<li data-target="#eventSlide" data-slide-to="1"></li>
								<li data-target="#eventSlide" data-slide-to="2"></li>
								<li data-target="#eventSlide" data-slide-to="3"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="/img/event1.png" width="100%">
								</div>
								<div class="carousel-item">
									<img src="/img/event2.png" width="100%">
								</div>
								<div class="carousel-item">
									<img src="/img/event3.png" width="100%">
								</div>
								<div class="carousel-item">
									<img src="/img/event4.png" width="100%">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#eventSlide"
								data-slide="prev"> <span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#eventSlide"
								data-slide="next"> <span class="carousel-control-next-icon"></span>
							</a>
						</div>
					</div>
				</div>

				<div class="web-right">
					<div class="home-bottom slideUp3">
						<div style="font-size: 18px; font-weight: bold; margin: 10px 0;">[ 공지사항 ]</div>
						<%-- <div class="notice">※ 공지사항 ※</div> --%>
					</div>
				</div>
				
			</div>

		</div>
			
		<c:import url="../footer/footer.jsp" />
	</div>

	<div class="modal fade" id="chargeModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">포인트 충전</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" align="center">
					<p>
						충전 할 포인트 : <input type="text" id="chargepoint" size="18"> 원
					</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="충전" id="chargemodal" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="payModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">포인트 결제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" align="center">
					<p>결제 할 포인트 : <input type="text" id="paypoint" size="18"> 원</p>
					<p>결제 할 가게명 : <input type="text" id="paystore" size="18"></p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="결제" id="paymodal" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>