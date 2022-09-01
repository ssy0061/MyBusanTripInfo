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
		min-height: 60vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	
	.place-upper, .place-lower {
		max-width: 400px;
		margin: 0 auto 20px;
		text-align: center;
		min-height: 10vh;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
	}
	
	.place-upper-inner {
		min-height: 150px;
		max-width: 300px;
		margin: 15px auto;
		padding: 3px 0;
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
	
	.place-lower-box {
		min-height: 50px;
		max-width: 300px;
		margin: 15px auto;
		padding: 3px 0;
		border: 1px solid var(--bnk-gray);
		border-radius: 5px;
	}
	
	.place-lower-box-title {
		text-align: left;
		margin: 5px 0 0 10px;
		font-size: 16px;
		font-weight: bold;
	}
	
	.regionName, .periodName, .typeName {
		color: var(--bnk-red);
	}
	
	.place-lower-box-info {
		margin: 5px 10px 10px;
		display: flex;
		justify-content: space-around;
		border: 2px solid var(--bnk-gray);
		border-radius: 5px;
	}

	.info-left {
		width: 80px;
		font-weight: bold;
		position: relative;
		border-right: 1px solid var(--bnk-gray);
		font-size: 15px;
		background-color: #FFFFD4;
	}
	
	.info-right {
		width: 220px;
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
	
	.location {
		width: 100%;
		text-align: left;
		margin: 0 0 0 5px;
		font-size: 13px;
		position: relative;
		bottom: 1px;
	}
	
	.searchBtn {
		margin: 0 3px;
		width: 20px;
		position: relative;
		bottom: 2px;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
</style>

<script>
	
	$(function() {
		
		var idArr = ["A", "", "C"];
		var categoryArr = ["관광지", "음식점", "카페"];
		var placeNameArr = ["오륙도 스카이워크", "강서반점", "서귀포 제주 감귤 카페"];
		var locationArr = ["부산 남구", "부산 강서구", "제주 서귀포시"];
		
		for (var i=0; i<3; i++) {
			let id = idArr[i];
			let category = categoryArr[i];
			let placeName = placeNameArr[i];
			let location = locationArr[i];
			
			// html tag 생성 form
			<%--
			<div class="place-lower-box-info">
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
						<img class="searchBtn" src="/img/search.png">
					</div>
				</div>
			</div>
			--%>
			
			let hasId = (id != "");
			
			let spanCategory = document.createElement('span');
			spanCategory.setAttribute('class', 'category');
			spanCategory.append(category);
			
			let divUdCenter = document.createElement('div');
			divUdCenter.setAttribute('class', 'ud-center');
			divUdCenter.append(spanCategory);
			
			let divInfoLeft = document.createElement('div');
			divInfoLeft.setAttribute('class', 'info-left');
			divInfoLeft.append(divUdCenter);
			
			
			let divPlaceName = document.createElement('div');
			divPlaceName.setAttribute('class', 'placeName');
			divPlaceName.append(placeName);
			
			let divInfoRightUpper = document.createElement('div');
			divInfoRightUpper.setAttribute('class', 'info-right-upper');
			divInfoRightUpper.append(divPlaceName);
			
			
			let spanLocation = document.createElement('span');
			spanLocation.setAttribute('class', 'location');
			spanLocation.append(location);
			
			if (hasId) {  // hasId
				var imgSearchBtn = document.createElement('img');
				imgSearchBtn.setAttribute('class', 'searchBtn');
				imgSearchBtn.setAttribute('src', '/img/search.png');
			}
			
			let divInfoRightLower = document.createElement('div');
			divInfoRightLower.setAttribute('class', 'info-right-lower');
			divInfoRightLower.append(spanLocation);
			if (hasId) divInfoRightLower.append(imgSearchBtn);
			
			
			let divInfoRight = document.createElement('div');
			divInfoRight.setAttribute('class', 'info-right');
			divInfoRight.append(divInfoRightUpper);
			divInfoRight.append(divInfoRightLower);

			let divPlaceLowerBoxInfo = document.createElement('div');
			divPlaceLowerBoxInfo.setAttribute('class', 'place-lower-box-info');
			divPlaceLowerBoxInfo.append(divInfoLeft);
			divPlaceLowerBoxInfo.append(divInfoRight);
			
			
			// 일단 전체 요소에 동일하게 적용. 타이틀까지 다르게 하는 건 차후 코딩 예정.
			let divPlaceLowerBoxLower = $('.place-lower-box-lower');
			divPlaceLowerBoxLower.append(divPlaceLowerBoxInfo);
			
			
		}  // for
		
		// initial method
		
		// 이미지랑 버튼 연결용 코드
		$('.searchBtn').click(function(){
			alert('search!');
		});  // img click
		
	});  // JQuery
	
</script>

<body>
	<c:import url="../header/nav.jsp">
		<c:param name="navTitle" value="핫플"/>
	</c:import>
	
	<div class="content container">
		
		<div class="place-upper">
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
		
		<div class="place-lower">
			<div class="place-lower-box">
				<div class="place-lower-box-title">
					* <span class="regionName">부산</span>의 인기 장소
				</div>
				<div class="place-lower-box-lower">
				
					<%--
					<div class="place-lower-box-info">
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
								<img class="searchBtn" src="/img/search.png">
							</div>
						</div>
					</div>
					--%>
					
				</div>
			</div>
			
			<div class="place-lower-box">
				<div class="place-lower-box-title">
					* 최근 <span class="periodName">일주일</span> 인기 장소
				</div>
				<div class="place-lower-box-lower">
					
					<%--
					<div class="place-lower-box-info">
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
								<img class="searchBtn" src="/img/search.png">
							</div>
						</div>
					</div>
					--%>
					
				</div>
			</div>

			<div class="place-lower-box">
				<div class="place-lower-box-title">
					* 인기 <span class="typeName">카페</span>
				</div>
				<div class="place-lower-box-lower">
				
					<%--
					<div class="place-lower-box-info">
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
								<img class="searchBtn" src="/img/search.png">
							</div>
						</div>
					</div>
					--%>
					
				</div>
			</div>
		</div>
		
	</div>
	
	<c:import url="/footer/footer.jsp" />
</body>
</html>