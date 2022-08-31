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
<%-- scroll 고정. --%>
<script>history.scrollRestoration = "manual"</script>
<style type="text/css">
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

	.content{
		min-height: 100vh;
	    width: 100%;
	    margin: 100px auto;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	
	.home-top, .home-middle, .home-bottom {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		position: relative;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
	}
	
	.home-middle, .home-bottom{
		margin-top: 15px;
	}
	
	.home-top {
		height: 180px;
	}
	
	.home-middle {
		overflow: auto;
		max-height: 270px;
		padding: 5px 0;
	}
	
	.home-bottom {
		min-height: 10px;
	}
	
	.home-top-upper {
		height: 100px;
		max-width: 300px;
		margin: 0 auto;
		position: relative;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
	}
	
	.home-top-lower {
		max-width: 300px;
		margin: 10px auto 0;
		display: flex;
		justify-content: space-around;
		align-items: center; 
	}
	
	.home-top-inner-left {
		text-align: left;
		font-size: 20px;
		position: relative;
		left: 20px;
		top: 5px;
	}
	
	.home-top-inner-right {
		text-align: right;
		font-size: 40px;
		position: relative;
		right: 20px;
		bottom: 5px;
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
	    border: 0;
	    line-height: 2.5;
	    width: 100%;
	    font-size: 1rem;
	    text-align: center;
	    color: #fff;
	    text-shadow: 1px 1px 1px #000;
	    border-radius: 5px;
	    background-color: var(--bnk-lightgray);
	    /*background-image: linear-gradient(to top left,
	                                      rgba(0, 0, 0, .2),
	                                      rgba(0, 0, 0, .2) 30%,
	                                      rgba(0, 0, 0, 0));
	    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
	                inset -2px -2px 3px rgba(0, 0, 0, .6);*/
	}
	
	.button-style:hover {
	    background-color: var(--bnk-red);
	}
	
	.button-style:active {
	    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
	                inset 2px 2px 3px rgba(0, 0, 0, .6);
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.notice {
		margin: 10px auto;
		max-width: 300px;
		height: 40px;
		position: relative;
		border-radius: 5px;
		border: 2px solid var(--bnk-gray);
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
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		
		if (memberId != null) {
			
			<%--
			$.ajax({
				type: 'post',
				url: '/member/getBalance',
				data: {'memberId': memberId},
				
				success:function(result) {
					console.log(result)
				},
				error: function(e){
					console.log(e);
				}
			})--%>
			
			var name = memberId;
			var money = "300000";  // 문자열로 받으면 동작.
			money = money.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$('#userName').text(name);
			$('#userMoney').text(money);
		} else {
			console.log("login User NULL");
		}
		
		
		$('.login').click(function(){
			location.href = "./login";
			// 로그인 페이지로 이동
		});
	});

</script>


</head>

<body>

	<div>
		<c:import url="../header/nav.jsp">
			<%-- <c:param name="navSubTitle" value="조회222"/> --%>
		</c:import>
		
			<div class="content container">
			
				<div class="home-top slideUp1">
        
					<div class="ud-center">
						<c:choose>
							<c:when test="${!empty loginUser}">
							<%-- loginUser로 일단 객체 값 받기. --%>
								<div>
									<div class="home-top-upper">
										<div class="ud-center">
											<div class="home-top-inner-left"><span id="userName"></span> 님의 잔액</div>
											<div class="home-top-inner-right"><span id="userMoney"></span>원</div>
										</div>
									</div>
								</div>
								<div>
									<div class="home-top-lower">
										<button class="button-style" type="button">충전</button>
										<button class="button-style" type="button">결제</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="login">
									<div class="ud-center">
										<span>로그인 하기</span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<div class="home-middle slideUp2">
					<span style="font-size: 25px; font-weight: bold;">[ 이벤트 ]</span>
					<div class="home-middle-inner">
						
						<%-- <img src="/img/event1.png" style="width: 100%; height: auto;">  --%>
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
								<div class="carousel-item active"><img src="/img/event1.png" width="100%"></div>
								<div class="carousel-item"><img src="/img/event2.png" width="100%"></div>
								<div class="carousel-item"><img src="/img/event3.png" width="100%"></div>
								<div class="carousel-item"><img src="/img/event4.png" width="100%"></div>
							</div>
	
							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#eventSlide" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a>
							<a class="carousel-control-next" href="#eventSlide" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>
						</div>
						
					</div>
				</div>
				
				<div class="home-bottom slideUp3">
					<div class="notice">
						<div class="ud-center">
							※ 공지사항 ※
						</div>
					</div>
					
					<div class="notice">
						<div class="ud-center">
							※ 공지사항 ※
						</div>
					</div>
					
					<div class="notice">
						<div class="ud-center">
							※ 공지사항 ※
						</div>
					</div>
					
					<div class="notice">
						<div class="ud-center">
							※ 공지사항 ※
						</div>
					</div>
					
					<div class="notice">
						<div class="ud-center">
							※ 공지사항 ※
						</div>
					</div>
				</div>
				
			</div>
			
		<c:import url="../footer/footer.jsp" />
	</div>
	
</body>
</html>