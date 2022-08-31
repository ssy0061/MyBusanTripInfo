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
		margin: 5px auto;
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
	    background-color: rgba(200, 0, 0, 1);
	    /*background-image: linear-gradient(to top left,
	                                      rgba(0, 0, 0, .2),
	                                      rgba(0, 0, 0, .2) 30%,
	                                      rgba(0, 0, 0, 0));
	    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
	                inset -2px -2px 3px rgba(0, 0, 0, .6);*/
	}
	
	.button-style:hover {
	    background-color: rgba(255, 0, 0, 1);*/
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

</style>


<script>

	$(function() {
		var loginUser = sessionStorage.getItem("loginUser");  // 나중에 값 받아오는 코드 작성.
		//alert(loginUser);
		//alert(loginUser != null);
		
		if (loginUser != null) {
			<%-- loginUser로 일단 객체 값 받기. 
			<%--
			var name = "염미정";
			var money = "123456";--%>
			
			var name = loginUser.memberId;
			var money = 300000;
			
			
			//money = money.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			//console.log(money);
			
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
						<span>${!empty loginUser}test</span>
						<c:choose>
							<c:when test="${!empty loginUser}">
							<%-- loginUser로 일단 객체 값 받기. --%>
								<div>
									<div class="rounded-lg border border-danger home-top-upper">
										<div class="ud-center">
											<div class="home-top-inner-left"><span id="userName">${memberId}</span> 님의 잔액</div>
											<div class="home-top-inner-right"><span id="userMoney"></span>원</div>
										</div>
									</div>
								</div>
								<div>
									<div class="rounded-lg border border-danger home-top-lower">
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
					<span style="font-size:25px;">= 이벤트 =</span>
					<div class="home-middle-inner">
						<img src="/img/event1.png" style="width: 100%; height: auto;">
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