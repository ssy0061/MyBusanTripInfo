<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<!-- 필요시 주석 해제해서 사용. 모달로 쓸 예정이라 필요없는 영역은 다 잘랐음. -->
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
--%>
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
	
	.inner-content{
		min-height: 60vh;
	    width: 100%;
	    margin: 0 auto;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	
	.storeDetail-box {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		min-height: 10vh;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
	}
	
	.storeDetail-box-top, .storeDetail-box-middle, .storeDetail-box-bottom {
		max-width: 300px;
		margin: 10px auto;
		padding: 5px 0;
		border: 1px solid var(--bnk-lightgray);
	}
	
	.storeDetail-box-middle {
		padding: 0;
	}
	
	#storeName {
		font-weight: bold;
		font-size: 20px;
	}
	
	.storeDetail-box-top-inner, .storeDetail-box-bottom-inner {
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
		font-size: 14px;
		font-weight: bold;
		display: block;
		padding: 0 0 4px;
		border-bottom-color: var(--bnk-lightgray);
		border-bottom-width: 2px;
		border-bottom-style: solid;
	}
	
	.storeDetail-box-bottom-inner {
		margin: 6px 0;
	}
	
	.visitDate {
		width: 180px;
		text-align: left;
		margin: 0 0 0 10px;
		padding: 1px 0;
		font-size: 15px;
		color: var(--bnk-gray);
		border-bottom-color: var(--bnk-lightgray);
		border-bottom-width: 1px;
		border-bottom-style: solid;
	}
	
	.payAmount {
		width: 120px;
		text-align: right;
		margin: 0 10px 0 0;
		font-size: 15px;
		font-weight: bold;
		border-bottom-color: var(--bnk-lightgray);
		border-bottom-width: 1px;
		border-bottom-style: solid;
	}
	
	#map{
		margin:10px auto;
	}
	
	.storeDetail-box-title {
		display: flex;
		justify-content: space-around;
	}
	
	.blank {
		width: 50px;
		min-width: 22px;
	}
	
	#heartBox {
		position: relative;
		bottom: 35px;
		right: 35px;
		height: 0;
	}
	
	.heart {
		width: 100px;
		height: 100px;
		background: url("/img/heart.png") no-repeat;
		background-position: 0 0;
		cursor: pointer;
		transition: background-position 1s steps(28);
		transition-duration: 0s;

	}
	
	.is-active {
		transition-duration: 1s;
		background-position: -2800px 0;
	}
	
	#storeName {
		margin: 0 auto;
		max-width: 300px;
	}
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55cec7f8be9f2d2a780ad76e59683837"></script>
<script>
	var memberId = '<%= (String)session.getAttribute("memberId") %>';

	$(function() {
		// ================================== 지도 API 생성용 (모달) ┐
		var lati = 35.2740278, longi = 129.2358014;
			
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);  // 생성
		// ================================== 지도 API 생성용 (모달) ┘
		
		var infowindow, marker;
		$("#searchModal").on('shown.bs.modal', function() {
			// 기존 마커 삭제 & 인포윈도우 삭제. 기존 요소가 없으면 무시
			try {
				marker.setMap(null);
				infowindow.close();
			} catch(e) {}
			
			map.relayout();  // 모달에 따라서 보이는 위치 조정
			
			// 모달이 보여진 이후 다음 코드를 수행해야 정상적으로 임베딩 됨.
			lati = $(this).attr('latitude');
			longi = $(this).attr('longitude');
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lati, longi); 
			
			// 마커를 생성합니다
			marker = new kakao.maps.Marker({
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
			infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
			
			// center 이동
			map.setCenter(new kakao.maps.LatLng(lati, longi));
		});  // searchModal's modal show end
		
		$('#likeBtn').click(function() {
			
		});  // click end
		
		$(".heart").on("click", function() {
			let storeId = $(this).attr('store-id');
			
			if ($(this).attr('class').includes('is-active')) {
				// 즐겨찾기가 되어있는 경우
				$.ajax({
					type: 'post',
					url: '/store/deleteWishlist',
					data: {'storeId': storeId, 'memberId': memberId},
					success: function(result) {
						$(".heart").toggleClass("is-active");
						// DOM상에 명시적으로 불러진 elem을 변경해야 먹힌다
					},
					error: function(e){ console.log(e); }
				});  // deleteWishlist end
			} else {
				// 즐겨찾기가 안 되어있는 경우
				$.ajax({
					type: 'post',
					url: '/store/addWishlist',
					data: {'storeId': storeId, 'memberId': memberId},
					success: function(result) {
						$(".heart").toggleClass("is-active");
						// DOM상에 명시적으로 불러진 elem을 변경해야 먹힌다
					},
					error: function(e){ console.log(e); }
				});  // addWishlist end
			}

		});  // click end
	});  // JQuery end
	
	function searchModalChange(storeId) {
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
		
		$(function() { $('#detailStoreBox').html('<span class="title-box">최근 나의 방문 기록</span>'); });  // 기존에 출력된 거래내역 초기화
		
		$.ajax({
			type: 'post',
			url: '/store/findStoreTransaction',
			data: {'memberId': memberId, 'storeId': storeId},
			success: function(result) {
				for (let i=0; i<result.length; i++) {
					let date = result[i].transactionTime.split('T')[0];
					let money = result[i].transactionAmt.toString();
					
					money = money.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					
					// html tag 생성 form
					<%-- 
					<div class="storeDetail-box-bottom-inner">
						<span class="visitDate">2022-06-23</span>
						<span class="payAmount">9,000</span>
					</div>
					--%>
					
					let spanVisitDate = document.createElement('span');
					spanVisitDate.setAttribute('class', 'visitDate');
					spanVisitDate.append(date);
					
					let spanPayAmount = document.createElement('span');
					spanPayAmount.setAttribute('class', 'payAmount');
					spanPayAmount.append(money);
					
					let divDetailBoxBottomInner = document.createElement('div');
					divDetailBoxBottomInner.setAttribute('class', 'storeDetail-box-bottom-inner');
					divDetailBoxBottomInner.append(spanVisitDate);
					divDetailBoxBottomInner.append(spanPayAmount);
					
					$('#detailStoreBox').append(divDetailBoxBottomInner);
				} // for
			},
			error: function(e){ console.log(e); }
		});  // findStoreTransaction end
		
		$.ajax({
			type: 'post',
			url: '/store/findExistWishlist',
			data: {'storeId': storeId, 'memberId': memberId},
			success: function(result) {
				$('#likeBtn').attr('store-id', storeId);
				if (Boolean(result)) $(".heart").attr("class", "heart is-active");  // 즐찾된경우
				else $(".heart").attr("class", "heart"); // 안즐찾시
			},
			error: function(e){ console.log(e); }
		});  // findExistWishlist end
	}  // serachModalChange end
</script>

<body>
	<%--
	<!-- 필요시 주석 해제해서 사용. 모달로 쓸 예정이라 필요없는 영역은 다 잘랐음. -->
	<c:import url="../header/nav.jsp">
		<c:param name="navTitle" value="상세정보"/>
	</c:import>
	--%>
	
	<div class="inner-content container">

		<div class="storeDetail-box">
			<div id="heartBox"><div id="likeBtn" class="heart" store-id=""></div></div>
			<div class="storeDetail-box-title">
				<!-- <i id="likeBtn" class="bi bi-star" store-id=""></i> -->
				<div class="blank"></div>
				<div id="storeName">아삭토스트 범내골점</div>
				<div class="blank"></div>
			</div>
			
			<div class="rounded-lg storeDetail-box-top">
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
			
			<div id="map" class="storeDetail-box-middle" style="height:280px;">
			</div>
			
			<%-- 로그인되어 있는 경우에만 최근 방문 기록 정보를 출력 --%>
			<c:if test="${!empty loginUser}">
				<div id="detailStoreBox" class="rounded-lg storeDetail-box-bottom">
					<span class="title-box">최근 나의 방문 기록</span>
					<%-- 
					<div class="storeDetail-box-bottom-inner">
						<span class="visitDate">2022-06-23</span>
						<span class="payAmount">9,000</span>
					</div>
					--%>
				</div>
			</c:if>
			
		</div>
		
	</div>
	
	<%--
	<!-- 필요시 주석 해제해서 사용. 모달로 쓸 예정이라 필요없는 영역은 다 잘랐음. -->
	<c:import url="/footer/footer.jsp" />
	--%>
</body>
</html>