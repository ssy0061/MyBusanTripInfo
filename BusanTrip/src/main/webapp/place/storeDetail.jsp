<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store detail page</title>
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
	
	.storeDetail-box {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		min-height: 10vh;
		padding: 10px;
	}
	
	.storeDetail-box-top, .storeDetail-box-middle, .storeDetail-box-bottom {
		max-width: 300px;
		margin: 10px auto;
		padding: 5px 0;
	}
	
	#storeName {
		font-weight: bold;
		font-size: 20px;
	}
	
	.storeDetail-box-top-inner {
		display: flex;
		justify-content: space-around;
	}

	
	.index-box {
		width: 100px;
		max-width: 70px;
		text-align: left;
		margin: 0 0 0 5px;
		font-size: 14px;
		font-weight: bold;
		border-right-color: var(--bnk-lightgray);
		border-right-width: 1px;
		border-right-style: solid;
		background-color: #FFFFD4;
		padding: 0 0 0 2px;
	}
	
	.contents-box {
		width: 200px;
		text-align: left;
		margin: 0 5px 0 0;
		font-size: 12px;
		padding: 0 0 0 2px;
	}
	
	.title-box {
		
	}
	
	
	
	
</style>
<body>
	<c:import url="../header/nav.jsp">
		<c:param name="navTitle" value="상세정보"/>
	</c:import>
	
	<div class="content container">
	
		<div class="rounded-lg border border-danger storeDetail-box">
		
			<span id="storeName">아삭토스트 범내골점</span>
			
			<div class="rounded-lg border border-danger storeDetail-box-top">
				<div class="storeDetail-box-top-inner">
					<span class="index-box">연락처</span>
					<span class="contents-box" id="contact">051) 0150-5484</span>
				</div>
				<div class="storeDetail-box-top-inner">
					<span class="index-box">주소</span>
					<span class="contents-box" id="address">부산광역시 어떤이름구 어떤골목로 777-77</span>
				</div>
				<div class="storeDetail-box-top-inner">
					<span class="index-box">영업시간</span>
					<span class="contents-box" id="openHour">00:00 ~ 00:00</span>
				</div>
				<div class="storeDetail-box-top-inner">
					<span class="index-box">휴일</span>
					<span class="contents-box" id="holiday">연중무휴</span>
				</div>
			</div>
			
			<div class="rounded-lg border border-danger storeDetail-box-middle">
				<img src="/img/map.png" width="100%">
			</div>
			
			<div class="rounded-lg border border-danger storeDetail-box-bottom">
				<span class="title-box">최근 나의 방문 기록</span>
				<div class="storeDetail-box-bottom-inner">
					<span class="visitDate">2022-01-23</span>
					<span class="payAmount">9,000</span>
				</div>
				<div class="storeDetail-box-bottom-inner">
					<span class="visitDate">2022-01-23</span>
					<span class="payAmount">9,000</span>
				</div>
			</div>
			
		</div>
		
	</div>
	
	<c:import url="/footer/footer.jsp" />
</body>
</html>