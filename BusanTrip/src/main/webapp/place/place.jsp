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
		
		.place-upper, .place-lower {
			background-color: #fef0f0;
			width: 90%;
			margin: 0 auto 20px;
		}
		
		.suggestBox, .suggestBox-choiced { font-size: 15px; }
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			padding-top: 10vh;
			min-height: calc(100vh - 90px); /* 창 크기 - 상단바 90px*/
		}
		
		.web-container {
			display: flex;
			justify-content: space-around;
		}
		
		.place-upper, .place-lower {
			background-color: rgba( 255, 255, 255, 0.6 );
			width: 90%;
			margin: 0 15px;
			height: 380px;
			overflow: scroll;
		}
		
		.suggestBox, .suggestBox-choiced { font-size: 13px; }
		
		.backImg{ /* web backgorund */
			background-image: url("/img/back4.jpg");
			background-size: 100% auto;
			background-repeat: no-repeat;
		}
	}
	@media screen and (min-width: 768.1px) { /* Bigger Web */
		.suggestBox, .suggestBox-choiced { font-size: 15px; }
	}
	
	.place-upper, .place-lower {
		max-width: 720px;
		text-align: center;
		min-height: 10vh;
		padding: 15px 0;
		border-radius: 5px;
	}
	
	.place-upper {
		display: flex;
    	align-items: center;
	}
	
	.place-upper-inner {
		max-width: 400px;
		width: 80%;
		min-height: 150px;
		margin: 15px auto;
		padding: 3px 0;
		position: relative;
		border-radius: 5px;
		background-color: white;
		box-shadow: 0px 5px 8px -3px #aaa;
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
		border-radius: 5px;
		margin: 12px 10px;
		display: flex;
		justify-content: space-around;
		padding: 3px 0;
		box-shadow: 0px 5px 8px -3px #aaa;
		background-color: #fefbd8;
		font-weight: bold;
	}
	
	.medal {
		height: 25px;
		margin: 0 0 0 5px;
		padding: 0 2px;
	}
	
	.storeName {
		width: 100%;
		text-align: left;
		padding: 0 0 0 10px;
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
	
	.place-lower-box {
		max-width: 400px;
		width: 80%;
		min-height: 50px;
		margin: 15px auto;
		padding: 3px 0;
		border-radius: 5px;
		background-color: white;
		box-shadow: 0px 5px 8px -3px #aaa;
	}
	
	.place-lower-box-title {
		text-align: left;
		margin: 5px 0 0 10px;
		font-size: 16px;
		font-weight: bold;
		display: flex;
		justify-content: space-around;
	}
	
	.title-left { width: 100%; }
	.title-right { width: 40px; }
	
	.moreBtn {
		border: 0;
	    background-color: white;
		color: var(--bnk-dark-red);
	}
	
	.regionName, .periodName, .categoryName {
		color: var(--bnk-red);
	}
	
	.place-lower-box-info {
		margin: 5px 10px 10px;
		display: flex;
		justify-content: space-around;
		border-radius: 15px;
		overflow: hidden;
		box-shadow: 0px 5px 8px -3px #aaa;
	}
	
	.info-left {
		width: 80%;
		font-weight: bold;
		position: relative;
		font-size: 15px;
		border-right: 4px solid var(--bnk-gray);
	}
	.ilcafe { background-color: #e6ccff; }
	.ilfood { background-color: #ffd480; }
	.iltour { background-color: #c1f0cd; }
	
	.info-right {
		width: 220%;
	}
	
	.info-right-upper {
		text-align: left;
		margin: 0 0 0 5px;
		font-size: 15px;
		font-weight: bold;
		position: relative;
		top: 1px;
	}
	
	.info-right-lower {
		display: flex;
		justify-content: space-around;
	}
	
	.location, .searchBtnDiv {
		position: relative;
		bottom: 1px;
	}
	
	.location {
		width: 100%;
		text-align: left;
		margin: 4px 0 0 5px;
		font-size: 13px;
		line-height: 130%
	}
	
	.searchBtnDiv {
		margin: 0 3px 0 0;
		width: 25px;
	}
	
	.searchBtn {
		width: 20px;
		height: 20px;
		position: absolute;
		bottom: 2px;
		right: 0;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.suggestBoxWrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.suggestBox {
		background-color: white;
		border-radius: 10px;
		border: 3px solid lightGray;
		font-weight: bold;
		width: 100px;
		margin: 0 1px 1px;
	}
	
	.suggestBox-choiced {
		background-color: white;
		width: 100px;
		border-radius: 10px;
		border: 3px solid #ff6666;
		font-weight: bold;
		margin: 0 1px 1px;
	}
	
	.suggestBox:hover{
	    background-color: var(--button-hover);
	}
	
	.suggestBox:active{
	    background-color: var(--button-active);
	}
	
	
	
</style>

<script>
	$(function() {
		if (memberId != 'null') {
			$.ajax({
				type: 'post',
				url: '/store/findStorePopularByPersonal',
				data: {'memberId': memberId},
				success: function(result) {
					let storeNameList = $('.ranking .storeName');
					let visitCountList = $('.ranking .visitCount');
					
					let i;
					for (i=0; i<result.length; i++) {
						storeNameList[i].append(result[i].TRANSACTION_STORE);
						visitCountList[i].append(result[i].CNT + '회');
					}  // 3곳 이상 방문한 경우 여기서 종료
					if (i<2) {
						for (; i<2; i++) {
							storeNameList[i].append('-');
						}
					}  // 두 곳 이하 방문한 경우 여기를 돌아서 빈 값을 채운다
					
					let nowDay = new Date();
					let nowMonth = nowDay.getMonth() + 1;
					$('#nowMonth').append(nowMonth+'월');
				},
				error: function(e){ console.log(e); }
			});  // findStorePopularByPersonal end
		};  // if
		
		$('.suggestBox').click(function(){
			if ($(this).attr('class') != 'suggestBox-choiced') {
				let period = $(this).attr('value');
				
				$('.suggestBox-choiced').attr('class', 'suggestBox');
				$(this).attr('class', 'suggestBox-choiced');
			}  // if
		});  // div click
		
	});  // JQuery
	
	function generateId() {
		let id = '', randInt;
		for (let i = 0; i < 32; i++) {
			randInt = parseInt(Math.random()*36)
			if (randInt < 10) id += randInt;
			else id +=String.fromCharCode(randInt+87);
		}
		return id;
	}
	
</script>

<body>
	<div class="backImg">
		<c:import url="../header/nav.jsp">
			<c:param name="navTitle" value="핫플"/>
		</c:import>
		
		<div class="content container">
			<div class="web-container">
				<%-- 로그인되어 있는 경우에만 My핫플 정보를 출력 --%>
				<c:if test="${!empty loginUser}">
					<div class="place-upper">
						<div class="place-upper-inner">
							<div class="place-upper-inner-title">
								<span id="nowMonth"></span>의 My핫플
							</div>
							<div class="place-upper-inner-contents">
								<div class="ranking">
									<img class="medal" src="/img/medal1.png">
									<span class="storeName"></span>
									<span class="visitCount"></span>
								</div>
								
								<div class="ranking">
									<img class="medal" src="/img/medal2.png">
									<span class="storeName"></span>
									<span class="visitCount"></span>
								</div>
								
								<div class="ranking">
									<img class="medal" src="/img/medal3.png">
									<span class="storeName"></span>
									<span class="visitCount"></span>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="place-lower">
					<div class="place-lower-box">
						<div class="suggestBoxWrap">
							<span class="suggestBox" method="findStorePopularByRegion" value="기장">기장</span>
							<span class="suggestBox" method="findStorePopularByPeriod" value="">일년</span>
							<span class="suggestBox" method="findStorePopularByCategory" value="카페">카페</span>
							<span class="suggestBox" method="findStorePopularByCategory" value="음식점">음식</span>
							<span class="suggestBox" method="findStorePopularByCategory" value="관광지">관광</span>
						</div>
						<div class="place-lower-box-title">
							<div class="title-left">
								* <span class="regionName">부산</span>의 인기 장소
							</div>
							<div class="title-right"></div>
						</div>
						<div class="place-lower-box-lower">
							<%-- 여기에 각 contents들이 생성 --%>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
							<div class="place-lower-box-info">  <!-- 이게 여러개 생성 -->
								<div class="info-left">
									<div class="ud-center">
										<span class="category">관광지</span>
									</div>
								</div>
								<div class="info-right">
									<div class="info-right-upper">
										<div class="placeName">오륙도 스카이워크</div>
									</div>
									<div class="info-right-lower">
										<span class="location">부산 남구</span>
										<div class="searchBtnDiv">
											<img class="searchBtn" src="/img/search.png" store-id="가게id기입"
												data-toggle="modal" data-target="#searchModal">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<c:import url="/footer/footer.jsp" />
	</div>
	
	<%-- Modal --%>
	<div class="modal fade" id="searchModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title">가게 상세 정보</h6>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<c:import url="/place/storeDetail.jsp" />
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>