<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hot place page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<style>
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
		border: 5px dotted red;
		min-height: 60vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	
	.place-upper, .place-lower {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		min-height: 10vh;
		padding: 10px;
	}
	
	.place-upper-inner {
		min-height: 150px;
		max-width: 300px;
		margin: 0 auto;
		position: relative;
		border: 1px solid var(--bnk-gray);
		border-radius: 5px;
	}
	
	.place-upper-inner-title {
		font-weight: bold;
		font-size: 20px;
		text-align: left;
		padding: 0 0 0 10px;
		margin: 5px 0 0;
	}
	
	#nowMonth {
		color: var(--bnk-red);
	}
	
	.place-upper-inner-contents {
		position: relative;
		min-height: 100px;
	}
	
	.ranking {
		border: 2px solid var(--bnk-gray);
		border-radius: 5px;
		margin: 8px 10px;
		display: flex;
		justify-content: space-around;
		padding: 1px 0;
	}
	
	.medal {
		height: 25px;
		margin: 0 0 0 5px;
		padding: 0 2px;
	}
	
	.storeName {
		width: 200px;
		text-align: left;
		padding: 0 0 0 5px;
		font-size: 15px;
		
	}
	
	.visitCount {
		width: 80px;
		margin: 0 5px 0 0;
		text-align: right;
		padding: 0 5px 0 0;
		font-size: 15px;
		font-weight: bold;
	}
	
	.place-lower-region, .place-lower-period, .place-lower-type {
		min-height: 50px;
		max-width: 300px;
		margin: 10px auto;
		border: 1px solid var(--bnk-gray);
		border-radius: 5px;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
</style>

<body>
	<c:import url="../header/nav.jsp">
		<c:param name="navTitle" value="핫플"/>
	</c:import>
	
	<div class="content container">
		
		<div class="rounded-lg border border-danger place-upper">
			<div class="place-upper-inner">
				<div class="place-upper-inner-title">
					<span id="nowMonth">8월</span>의 My핫플
				</div>
				<div class="place-upper-inner-contents">

					<div id="first" class="ranking">
						<img class="medal" src="/img/medal.png">
						<span class="storeName">든킨드나쓰 든킨드나쓰점</span>
						<span class="visitCount">7회</span>
					</div>
					
					<div id="second" class="ranking">
						<img class="medal" src="/img/medal.png">
						<span class="storeName">든킨드나쓰</span>
						<span class="visitCount">7회</span>
					</div>
					
					<div id="third" class="ranking">
						<img class="medal" src="/img/medal.png">
						<span class="storeName">-</span>
						<span class="visitCount"></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="rounded-lg border border-danger place-lower">
			<div class="place-lower-region">
				지역 추천 A
			</div>
			
			<div class="place-lower-region">
				지역 추천 B
			</div>
			
			<div class="place-lower-period">
				기간 추천 A
			</div>
			
			<div class="place-lower-period">
				기간 추천 B
			</div>
			
			<div class="place-lower-type">
				범주 추천 A
			</div>
			
			<div class="place-lower-type">
				범주 추천 B
			</div>
		</div>
		
	</div>
	
	<c:import url="/footer/footer.jsp" />
</body>
</html>