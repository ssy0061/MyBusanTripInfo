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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55cec7f8be9f2d2a780ad76e59683837"></script>
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
	
</style>

<script>
	$(function() {
		// ================================== 지도 API 생성용
		var lati = 35.2740278, longi = 129.2358014;
			
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);  // 생성
		// ================================== 지도 API 생성용
		
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		
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
		
		
		// html tag 생성 form
		<%--
		<div class="place-lower-box">
			<div class="place-lower-box-title">
				<div class="title-left">
					* <span class="regionName">부산</span>의 인기 장소
				</div>
				<div class="title-right">
					<button type="button" class="moreBtn" data-target="#랜덤시드값">▼</button>
				</div>
			</div>
			<div class="place-lower-box-lower" id="랜덤시드값">
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
		--%>
		
		<%-- 지역별 컨텐츠 --%>
		var regionArr = ["기장"];
		
		for (var j=0; j<regionArr.length; j++) {
			let region = regionArr[j];
			
			$.ajax({
				type: 'post',
				url: '/store/findStorePopularByRegion',
				data: {'region': region},
				success: function(result) {
					let spanRegionName = document.createElement('span');
					spanRegionName.setAttribute('class', 'regionName');
					spanRegionName.append(region);
					
					let divTitleLeft = document.createElement('div');
					divTitleLeft.setAttribute('class', 'title-left');
					divTitleLeft.append("* ");
					divTitleLeft.append(spanRegionName);
					divTitleLeft.append("의 인기 장소");
					
					addContents(divTitleLeft, result);  // 함수 호출
					
					<%-- .off()를 써서 기존 중복 설정을 제거. --%>
					// collapse 버튼 연결용 코드
					$('.moreBtn').off('click').click(function(){
						let targetId = $(this).attr('data-target');
						$(targetId).collapse('toggle');
					});  // button click
					
					// img 버튼 연결용 코드
					$('.searchBtn').off('click').click(function(){
						serachModalChange($(this).attr('store-id'));
					});  // img click
					
				},  // ajax success end
				error: function(e){ console.log(e); }
			});  // findStorePopularByRegion end
		}  // for - 지역별 컨텐츠
		
		
		<%-- 기간별 컨텐츠 --%>
		let period = "일년";
		
		$.ajax({
			type: 'post',
			url: '/store/findStorePopularByPeriod',
			success: function(result) {
				// * 최근 <span class="periodName">일주일</span> 인기 장소
				let spanPeriodName = document.createElement('span');
				spanPeriodName.setAttribute('class', 'periodName');
				spanPeriodName.append(period);
				
				let divTitleLeft = document.createElement('div');
				divTitleLeft.setAttribute('class', 'title-left');
				divTitleLeft.append("* 최근 ");
				divTitleLeft.append(spanPeriodName);
				divTitleLeft.append(" 인기 장소");
				
				addContents(divTitleLeft, result);  // 함수 호출
				
				<%-- .off()를 써서 기존 중복 설정을 제거. --%>
				// collapse 버튼 연결용 코드
				$('.moreBtn').off('click').click(function(){
					let targetId = $(this).attr('data-target');
					$(targetId).collapse('toggle');
				});  // button click
				
				// img 버튼 연결용 코드
				$('.searchBtn').off('click').click(function(){
					serachModalChange($(this).attr('store-id'));
				});  // img click
		
			},  // ajax success end
			error: function(e){ console.log(e); }
		});  // findStorePopularByRegion end - period
		
		
		<%-- 범주별 컨텐츠 --%>
		var categoryArr = ["카페", "음식점", "관광지"];
		
		for (var j=0; j<categoryArr.length; j++) {
			let category = categoryArr[j];
			
			$.ajax({
				type: 'post',
				url: '/store/findStorePopularByCategory',
				data: {'category': category},
				success: function(result) {
					// * 인기 <span class="categoryName">카페</span>
					let spanCategoryName = document.createElement('span');
					spanCategoryName.setAttribute('class', 'categoryName');
					spanCategoryName.append(category);
					
					let divTitleLeft = document.createElement('div');
					divTitleLeft.setAttribute('class', 'title-left');
					divTitleLeft.append("* 인기 ");
					divTitleLeft.append(spanCategoryName);
					
					addContents(divTitleLeft, result);  // 함수 호출
					
					<%-- .off()를 써서 기존 중복 설정을 제거. --%>
					// collapse 버튼 연결용 코드
					$('.moreBtn').off('click').click(function(){
						let targetId = $(this).attr('data-target');
						$(targetId).collapse('toggle');
					});  // button click
					
					// img 버튼 연결용 코드
					$('.searchBtn').off('click').click(function(){
						serachModalChange($(this).attr('store-id'));
					});  // img click
					
				},  // ajax success end
				error: function(e){ console.log(e); }
			});  // findStorePopularByCategory end
		}  // for - 범주별 컨텐츠
		
		// initial method
		
		function serachModalChange(storeId) {
			$.ajax({
				type: 'post',
				url: '/store/findStoreInfo',
				data: {'storeId': storeId},
				success: function(result) {
					result = result[0];
					$('#storeName').text(result.storeName);
					$('#contact').text(result.storeTele);
					$('#address').text(result.storeAddr);
					$('#openHour').text(result.storeWorkhour);
					$('#holiday').text(result.storeHoliday);
					$('#searchModal').attr('latitude', result.storeLatitude);
					$('#searchModal').attr('longitude', result.storeLongitude);
				},
				error: function(e){ console.log(e); }
			});  // getMemberName end
		}  // serachModalChange end
		
		$("#searchModal").on('shown.bs.modal', function() {
			map.relayout();  // 모달에 따라서 보이는 위치 조정
			
			// 모달이 보여진 이후 다음 코드를 수행해야 정상적으로 임베딩 됨.
			lati = $(this).attr('latitude');
			longi = $(this).attr('longitude');
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lati, longi); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var iwContent =
				// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				'<div style="width:150px; padding:5px; text-align:center;">' + $('#storeName').text() +
				'<br><small><a href="https://map.kakao.com/link/map/' + $('#storeName').text() +',' + lati +
				', ' + longi + '" style="color:blue" target="_blank">큰지도보기</a>  <a href="https://map.kakao.com/link/to/' +
				$('#storeName').text() + ',' + lati + ', ' + longi + '" style="color:blue" target="_blank">길찾기</a></small></div>',
			    iwPosition = new kakao.maps.LatLng(lati, longi); //인포윈도우 표시 위치입니다
			
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
			
			// center 이동
			map.setCenter(new kakao.maps.LatLng(lati, longi));
			
			
		});  // searchModal's modal show end
		
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
	
	function addContents(divTitleLeft, result) {
		let contentsId = generateId();
		
		let moreBtn = document.createElement('button');
		moreBtn.setAttribute('type', 'button');
		moreBtn.setAttribute('class', 'moreBtn');
		moreBtn.setAttribute('data-target', '#' + contentsId);
		moreBtn.append("▼");
		
		let divTitleRight = document.createElement('div');
		divTitleRight.setAttribute('class', 'title-right');
		divTitleRight.append(moreBtn);
		
		
		let divPlaceLowerBoxTitle = document.createElement('div');
		divPlaceLowerBoxTitle.setAttribute('class', 'place-lower-box-title');
		divPlaceLowerBoxTitle.append(divTitleLeft);
		divPlaceLowerBoxTitle.append(divTitleRight);
		
		
		let divPlaceLowerBoxLower = document.createElement('div');
		divPlaceLowerBoxLower.setAttribute('class', 'place-lower-box-lower collapse');
		divPlaceLowerBoxLower.setAttribute('id', contentsId);
		
		for (var i=0; i<result.length; i++) {
			let store = result[i];
			let id = store.storeId;
			let category = store.storeCategory;
			let placeName = store.storeName;
			let location = store.storeAddr;
			let hasId = (id != null);
			
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
			
			let divSearchBtnDiv;
			if (hasId) {  // hasId
				var imgSearchBtn = document.createElement('img');
				imgSearchBtn.setAttribute('class', 'searchBtn');
				imgSearchBtn.setAttribute('src', '/img/search.png');
				imgSearchBtn.setAttribute('store-id', id);
				imgSearchBtn.setAttribute('data-toggle', "modal");
				imgSearchBtn.setAttribute('data-target', "#searchModal");
				
				divSearchBtnDiv = document.createElement('div');
				divSearchBtnDiv.setAttribute('class', 'searchBtnDiv');
				divSearchBtnDiv.append(imgSearchBtn);
			}
			
			let divInfoRightLower = document.createElement('div');
			divInfoRightLower.setAttribute('class', 'info-right-lower');
			divInfoRightLower.append(spanLocation);
			if (hasId) divInfoRightLower.append(divSearchBtnDiv);
			
			
			let divInfoRight = document.createElement('div');
			divInfoRight.setAttribute('class', 'info-right');
			divInfoRight.append(divInfoRightUpper);
			divInfoRight.append(divInfoRightLower);
	
			let divPlaceLowerBoxInfo = document.createElement('div');
			divPlaceLowerBoxInfo.setAttribute('class', 'place-lower-box-info');
			divPlaceLowerBoxInfo.append(divInfoLeft);
			divPlaceLowerBoxInfo.append(divInfoRight);
			
			divPlaceLowerBoxLower.append(divPlaceLowerBoxInfo);
			
		}  // for
		
		let divPlaceLowerBox = document.createElement('div');
		divPlaceLowerBox.setAttribute('class', 'place-lower-box');
		divPlaceLowerBox.append(divPlaceLowerBoxTitle);
		divPlaceLowerBox.append(divPlaceLowerBoxLower);
		
		let divPlaceLower = $('.place-lower');
		divPlaceLower.append(divPlaceLowerBox);
	}
	
</script>

<body>
	<c:import url="../header/nav.jsp">
		<c:param name="navTitle" value="핫플"/>
	</c:import>
	
	<div class="content container">
		
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
			<%-- 여기에 상단 주석에 넣어놓은 코드가 (유사 구조로) 들어감 --%>
		</div>
		
	</div>
	
	<c:import url="/footer/footer.jsp" />
	
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