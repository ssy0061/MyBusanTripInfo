<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search detail page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
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
	
	.index{
		border: 5px dotted red;
		min-height: 100vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	
	.searchDetail-upper {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		height: 120px;
		position: relative;
	}
	
	.searchDetail-upper-top, .searchDetail-upper-bottom {
		max-width: 300px;
		margin: 10px auto;
		border: 1px solid var(--bnk-gray);
	}
	
	.searchDetail-upper-top {
		display: flex;
		justify-content: space-around;
		padding: 3px 0;
	}
	
	.accountNumber {
		max-width: 100px;
		width: 100%;
		font-size: 10px;
		text-align: left;
		position: relative;
		left: 5px;
		vertical-align: bottom;
		margin: 15px 0 0;
		color: gray;
	}
	
	.amount {
		max-width: 160px;
		width: 100%;
		font-size: 22px;
		text-align: right;
		position: relative;
		right: 5px;
		font-weight: bold;
	}
	
	.searchDetail-upper-bottom {
		text-align: left;
	}
	
	.upper-bottom-text {
		margin: 0 0 0 10px;
	}
	
	.searchDetail-upper-bottom-inner {
		text-align: center;
		display: flex;
		justify-content: space-around;
	}
	
	.periodBox {
		width: 100px;
		border-radius: 10px;
		border: 3px outset var(--bnk-gray);
		font-weight: bold;
		margin: 0 1px 1px;
	}
	
	.periodBox-choiced {
		width: 100px;
		border-radius: 10px;
		border: 3px outset var(--bnk-gray);
		background-color: var(--bnk-lightgray);
		font-weight: bold;
		margin: 0 1px 1px;
	}
	
	.periodBox:hover {
	    background-color: var(--button-hover);
	}
	
	.periodBox:active {
	    background-color: var(--button-active);
	}
	
	.searchDetail-lower {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		min-height: 5vh;
	}
	
	.searchDetail-lower-box {
		max-width: 300px;
		margin: 10px auto;
		height: 30px;
		position: relative;
		border-bottom-color: var(--bnk-gray);
		border-bottom-width: 2px;
		border-bottom-style: solid;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	

</style>
</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="index container">
			
			<div class="rounded-lg border border-danger searchDetail-upper">
				<div class="ud-center">
					<div class="rounded-lg searchDetail-upper-top">
						<span class="accountNumber">XXX-XXXXXX-XX-XXX</span>
						<span class="amount">0,000,000원</span>
					</div>
					<div class="rounded-lg searchDetail-upper-bottom">
						<span class="upper-bottom-text">기간별 조회하기</span>
						<div class="searchDetail-upper-bottom-inner">
							<span class="periodBox-choiced" value="1">1개월</span>
							<span class="periodBox" value="3">3개월</span>
							<span class="periodBox" value="6">6개월</span>
							<span class="periodBox" value="12">1년</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="rounded-lg border border-danger searchDetail-lower">
				
				<div class="searchDetail-lower-box">
					<div class="ud-center">
						<span class="border border-primary">결제일시</span>
						<span class="border border-primary">가게이름</span>
						<img class="border border-primary">
						<img class="border border-primary">
						<span class="border border-primary">결제금액</span>
					</div>
				</div>
				<div class="searchDetail-lower-box">
					<div class="ud-center">
						<span class="border border-primary">결제일시</span>
						<span class="border border-primary">가게이름</span>
						<img class="border border-primary">
						<img class="border border-primary">
						<span class="border border-primary">결제금액</span>
					</div>
				</div>
				
			</div>

		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>