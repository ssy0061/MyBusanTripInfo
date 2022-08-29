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
<%-- jquery ui 전용 import --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
		height: 130px;
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
		text-align: center;
	}
	
	.searchDetail-upper-bottom-inner {
		text-align: center;
		display: flex;
		justify-content: space-around;
	}
	
	.periodBox, .searchBox {
		border-radius: 10px;
		border: 3px outset var(--bnk-gray);
		font-weight: bold;
	}
	
	.periodBox {
		width: 100px;
		margin: 0 1px 1px;
	
	}
	.searchBox {
		width: 40px;
		margin: 1px 0;
	}
	
	.searchBox>img {
		position: relative;
		bottom: 2px;
	}
	
	.periodBox-choiced {
		width: 100px;
		border-radius: 10px;
		border: 3px outset var(--bnk-gray);
		background-color: var(--bnk-lightgray);
		font-weight: bold;
		margin: 0 1px 1px;
	}
	
	.periodBox:hover, .searchBox:hover {
	    background-color: var(--button-hover);
	}
	
	.periodBox:active, .searchBox:active {
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
		min-height: 60px;
		height: auto;
		border-bottom-color: var(--bnk-lightgray);
		border-bottom-width: 2px;
		border-bottom-style: solid;
		padding: 5px 0 3px;
	}
	
	.searchDetail-lower-box-inner {
		text-align: center;
		display: flex;
		justify-content: space-around;
		margin: 2px 0;
	}
	
	.payTime { 
		width: 220px;
		text-align: left;
		margin: 0 0 0 5px;
		color: gray;
		font-size: 14px;
	}
	
	.image-box {
		width: 80px;
		text-align: right;
		margin: 0 5px 0 0;
	}
	
	.searchBtn, .memoBtn {
		position: relative;
		bottom: 4px;
		margin: 0 2px;
	}
	
	.storeName {
		width: 200px;
		text-align: left;
		margin: 0 0 0 5px;
		font-weight: bold;
		font-size: 15px;
	}
	
	.payAmount {
		width: 100px;
		text-align: right;
		margin: 0 5px 0 0;
		font-weight: bold;
		font-size: 15px;
	}
	
	.memo {
		border: 1px solid burlywood;
		background-color: beige;
		width: 280px;
		margin: 0 5px;
		font-size: 10px;
		text-align: left;
		padding: 1px 2px;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.datepicker {
		margin: 1px 0 0;
		width: 100px;
		height: 30px;
		text-align: center;
		font-size: 13px;
	}
	

</style>

<script>

	$(function() {
		$( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
		// initial method
		
		$('.periodBox').click(function(){
			if ($(this).attr('class') != 'periodBox-choiced') {
				let period = $(this).attr('value');
				
				alert(period);
				// 비동기 방식으로 정보 전달...
				//
				
				$('.periodBox-choiced').attr('class', 'periodBox');
				$(this).attr('class', 'periodBox-choiced');
			}  // if
		});  // div click
		
		$('.searchBox').click(function(){
			let start = $('#startDate').val()
			let end = $('#endDate').val()
			
			alert(start + ' ~ ' + end);
			
			if ($(this).attr('class') != 'periodBox-choiced') {
				// 비동기 방식으로 정보 전달...
				//
				
				$('.periodBox-choiced').attr('class', 'periodBox');
			}  // if
		});  // div click
		
		// 맨 처음 페이지 들어왔을 시 1개월을 기본으로 조회하도록 자동 호출.
		$('.searchDetail-upper-bottom-inner span:eq(0)').click();
		
	});  // JQuery
	
</script>

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
						<div class="searchDetail-upper-bottom-inner">
							<input type="text" class="datepicker" id="startDate" readonly="readonly">
							<span width="15px"><b>~</b></span>
							<input type="text" class="datepicker" id="endDate" readonly="readonly">
							<span class="searchBox"><img src="./img/search.png" width=20px></span>
						</div>
						
						<div class="searchDetail-upper-bottom-inner">
							<span class="periodBox" value="1">1개월</span>
							<span class="periodBox" value="3">3개월</span>
							<span class="periodBox" value="6">6개월</span>
							<span class="periodBox" value="12">1년</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="rounded-lg border border-danger searchDetail-lower">
				
				<div class="searchDetail-lower-box">
					<div class="searchDetail-lower-box-inner">
						<span class="payTime">2022-02-22</span>
						<div class="image-box">
							<img class="searchBtn" src="./img/search.png" width=20px>
							<img class="memoBtn" src="./img/memo.png" width=20px>
						</div>
					</div>
					
					<div class="searchDetail-lower-box-inner">
						<span class="storeName">부산은행 기장연수원</span>
						<span class="payAmount">2,000,000</span>
					</div>
					
					<div class="searchDetail-lower-box-inner">
						<span class="memo">메모용 내용</span>
					</div>
				</div>
				
				<div class="searchDetail-lower-box">
					<div class="searchDetail-lower-box-inner">
						<span class="payTime">2022-02-22</span>
						<div class="image-box">
							<img class="searchBtn" src="./img/search.png" width=20px>
							<img class="memoBtn" src="./img/memo.png" width=20px>
						</div>
					</div>
					
					<div class="searchDetail-lower-box-inner">
						<span class="storeName">부산은행 기장연수원</span>
						<span class="payAmount">2,000,000</span>
					</div>
					
					<div class="searchDetail-lower-box-inner">
						<span class="memo">메모용 내용</span>
					</div>
				</div>
				
			</div>

		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>