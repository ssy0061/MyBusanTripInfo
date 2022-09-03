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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<%-- jquery ui 전용 import --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%-- 구글 아이콘 --%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

	.material-symbols-outlined {
	  font-variation-settings:
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 40
	}
	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* 상단바 70*/
			padding-bottom: 80px;
			background-color: #fef0f0;
			min-height: calc(100vh - 80px);
			padding-left: 0;
			padding-right: 0;
		}
		#toTop{
			bottom: 100px;
			right: 10px;
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 180px);
			padding: 20px 0;
		}
		#toTop{
			bottom: 130px;
			right: 30px;
		}
		.box-1{
			border-radius: 10px;
			box-shadow: 1px 3px 5px 3px lightGray;
		}
	}
	/* 상하단 바를 위한 필수 css */
	
	
/* 	.content{
		min-height: 100vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	} */
	#toTop{
		position: fixed;
		width: 32px;
		border-radius: 10px;
		background-color: white;
	}
	#toTop:hover{
		cursor: pointer;
	}
	.box-1{
		max-width: 720px;
		min-height: calc(100vh - 150px);
		margin: 0 auto;
		text-align: center;
		background-color: #fef0f0;
	}
	.searchDetail-upper {
		width: 100%;
		max-width: 500px;
		margin: 15px auto;
		text-align: center;
		height: 140px;		
		
	}
	
	.searchDetail-lower {
		width: 100%;
		background-color: white;
		max-width: 720px;
		text-align: center;
		min-height: 5vh;
		border-radius: 5px;
		padding-bottom: 10px;
	}
	
	.ud-center {
		/* background-color: white;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%); */
	}
	
	.searchDetail-upper-top {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	/* */
	
	.accountNumber {
		max-width: 100px;
		width: 100%;
		font-size: 20px;
	}
	
	.amount {
		max-width: 160px;
		width: 100%;
		font-size: 24px;
		font-weight: bold;
	}
	
	.searchDetail-upper-bottom {
		text-align: center;
	}
	
	.searchDetail-upper-bottom-inner {
		text-align: center;
		display: flex;
		justify-content: space-around;
		margin: 2px 2px;
	}
	
	.periodBox {
		border-radius: 10px;
		border: 3px outset #53565A;
		font-weight: bold;
		width: 100px;
		margin: 0 1px 1px;
	}
	.searchBox {
		width: 40px;
		margin: 1px 0;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.searchBox>img {
		position: relative;
		bottom: 2px;
	}
	
	.periodBox-choiced {
		width: 100px;
		border-radius: 10px;
		border: 3px outset #53565A;
		background-color: lightGray;
		font-weight: bold;
		margin: 0 1px 1px;
	}
	
	.periodBox:hover, .searchBox:hover {
	    background-color: var(--button-hover);
	}
	
	.periodBox:active, .searchBox:active {
	    background-color: var(--button-active);
	}
	
	.searchDetail-lower-box {
		max-width: 720px;
		margin: 20px auto;
		min-height: 60px;
		height: auto;
		border-bottom-color:#DCDCDC;
		border-bottom-width: 2px;
		border-bottom-style: solid;
		padding: 5px 10px 3px;
	}
	
	.searchDetail-lower-box-inner {
		text-align: center;
		display: flex;
		justify-content: space-around;
		margin: 2px 0;
	}
	
	.payDate { 
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
		width: 20px;
	}
	
	.storeName {
		width: 180px;
		text-align: left;
		margin: 0 0 0 5px;
		font-weight: bold;
		font-size: 15px;
	}
	
	.payAmount {
		width: 120px;
		text-align: right;
		margin: 0 5px 0 0;
		font-weight: bold;
		font-size: 15px;
	}
	
	.memo {
		border: 1px solid burlywood;
		background-color: beige;
		width: 280px;
		margin: 3px 5px;
		font-size: 10px;
		text-align: left;
		padding: 1px 2px;
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
		// 날짜
		function dayToString(day){
			let year = day.getFullYear();
			let month = day.getMonth() + 1;
			let date = day.getDate();
			return year + '-' + ('00' + month).slice(-2)
					+ '-' + ('00' + date).slice(-2);
		}
		function getNowDay(){
			let nowDay = new Date();
			return dayToString(nowDay);
		}
		function getPastDay(m){
			let nowDay = new Date();
			let nowMonth = nowDay.getMonth()
			let nowDate = nowDay.getDate()
			let day = new Date();
			day.setMonth(nowMonth-m);
			day.setDate(nowDate+1);
			return dayToString(day);
		}
		
		const accountNumber = '${accountNumber}'

		
		// 잔액 조회
		$.ajax({
			type: 'post',
			url: '/member/getBalance',
			data: {'accountNumber': accountNumber},
			success: function(res){
				/* console.log(res) */
				$('.accountNumber').text(accountNumber)
				$('.amount').text(res+"원")
			},
			error: function(e) {
				console.log(e)
			}
		})
		
		// 거래내역 조회
		var list = [];
		// 보여줄 아이템 수 10개
		var nowPage = 1;
		var totalPage = 1;
		getTransaction(getPastDay(1),getNowDay())
		
		function getTransaction(startDay, finishDay) {
			$.ajax({
				type: 'post',
				url: '/member/findTransactionBySpecificPeriod',
				data: {'accountNumber': accountNumber,
					   'startDay': startDay,
					   'finishDay': finishDay},
				
				success: function(res){
					console.log(res)
					list = res;
					totalPage = Math.ceil(list.length/10);
					$('#startDate').val(startDay)
					$('#endDate').val(finishDay)
					loadData(1)
				},
				error: function(e) {
					console.log(e)
				}
			})
		}
		
		
		$( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
		
		
		
		// initial method
		
		
		$('.periodBox').click(function(){
			if ($(this).attr('class') != 'periodBox-choiced') {
				let period = $(this).attr('value');
				
				let start = getPastDay(period)
				let end = getNowDay()
				$('#startDate').val(start)
				$('#endDate').val(end)
				
				// period - 기간. befDay - 시작점. nowDay - 끝점(오늘).
				// 비동기 방식으로 정보 전달...
				//
				
				$('#detailBox').html("");
				getTransaction(start, end)
				$('.periodBox-choiced').attr('class', 'periodBox');
				$(this).attr('class', 'periodBox-choiced');
				
				// 이미지랑 버튼 연결용 코드
				$('.searchBtn').click(function(){
					alert('search!  ' + $(this).parent().parent().text());
				});  // img click
				$('.memoBtn').click(function(){
					// alert('memo!  ' + $(this).parent().parent().text());
					$('#memo-text').val('');  // 내용 초기화
				});  // img click
				
			}  // if
		});  // div click
		
		
		$('.searchBox').click(function(){
			let start = $('#startDate').val()
			let end = $('#endDate').val()
			
			let startDay = new Date(start);
			let endDay = new Date(end);
			
			if (startDay <= endDay) {
				// 비동기 방식으로 정보 전달...
				getTransaction(dayToString(startDay), dayToString(endDay))
				$('#detailBox').html("");
				$('.periodBox-choiced').attr('class', 'periodBox');
				
				// 이미지랑 버튼 연결용 코드 
				$('.searchBtn').click(function(){
					alert('search!  ' + $(this).parent().parent().text());
				});  // img click
				$('.memoBtn').click(function(){
					// alert('memo!  ' + $(this).parent().parent().text());
					$('#memo-text').val('');  // 내용 초기화
				});  // img click
				
			} else {
				// 날짜 관계가 역전된 경우.
				alert('날짜의 입력이 잘못되었습니다.');
			} // if-else
		});  // div click
		
		
		$('#memoSubmit').click( function() {
			let memoText = $('#memo-text').val();  // 내용 추출
			alert(memoText);
			// memoText의 정보를 해당 요소에 적절히 담는 과정 need
			// 별도의 파라미터 need.
			
			$('#memoModal').trigger({ type: "click" });  // modal 종료
			// .modal('hide'); 가 적용되지 않아서 코드 수정.
		});  // button click
		
		var chkPage = 1;
		// 무한 스크롤
		$(window).scroll(function(){
			/* console.log($(document).height(), $(window).scrollTop() + $(window).height()) */
			if($(document).height() <= $(window).scrollTop() + $(window).height()+15) {
				if(nowPage < totalPage && nowPage === chkPage){
					chkPage++;
					var loading = '<div id="scrollLoading" class="d-flex justify-content-center">'+
								  '<div class="spinner-border text-danger" role="status">'+
								  '<span class="sr-only">Loading...</span></div></div>'
					$('#detailBox').append(loading)
					setTimeout(function() {
						nowPage+=1;
						console.log(nowPage)
						$('#scrollLoading').remove();
						loadData(nowPage)
						
					}, 300);
				}
				
				
			}
		})
		
		$('#toTop').on('click', function(){
			window.scrollTo(0, 0);
		})
		function loadData(page) {
			var start = (totalPage*10)-10;
			var end = list.length;
			if(page < totalPage) {
				start = (page*10)-10
				end = page*10;
			}
			if(list.length===0) {
				$('#detailBox').append("<div><i class='bi bi-clipboard2-x' style='font-size: 3rem;'></i></div><b>불러올 내역이 없습니다.</b>")
				return
			}
			for (var i=start; i<end; i++) {
				var memo = list[i].transactionMemo !== null ?
						'<div class="searchDetail-lower-box-inner">'+
						'<span class="memo">'+list[i].transactionMemo+'</span></div>'
						: "";
				$('#detailBox').append(
						'<div class="searchDetail-lower-box" id="lowerBox-'+i+'">'+
						'<div class="searchDetail-lower-box-inner">'+
						'<span class="payDate">'+list[i].transactionTime.substring(0,10)+'</span>'+
						'<div class="image-box">'+
						'<img class="searchBtn" src="/img/search.png" width=20px>'+
						'<img class="memoBtn" src="/img/memo.png" width=20px data-toggle="modal" data-target="#memoModal">'+
						'</div></div>'+
						'<div class="searchDetail-lower-box-inner">'+	
						'<span class="storeName">'+list[i].transactionStore+'</span>'+
						'<span class="payAmount">'+list[i].transactionAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' 원</span>'+
						'</div>'+memo+'</div>'
				);
				
			}// for
			
			
		}  // loadData
		
		$('.periodBox:eq(0)').attr('class', 'periodBox-choiced');
	});  // JQuery
	
	
	
</script>

</head>
<body>
	<div>
		<c:import url="/header/nav.jsp">
			<c:param name="navSubTitle" value="소비내역"/>
		</c:import>

		<div class="content container">
			<div class="box-1">
				<div class="searchDetail-upper">
					<div class="ud-center">
						<div class="rounded-lg searchDetail-upper-top">
							<span class="accountNumber"></span> 
							<span class="amount"></span>
						</div>
						<div class="rounded-lg searchDetail-upper-bottom">
							<div class="searchDetail-upper-bottom-inner">
								<input type="text" class="datepicker" id="startDate"
									readonly="readonly"> <span width="15px"><b>~</b></span>
								<input type="text" class="datepicker" id="endDate"
									readonly="readonly">
								<span class="searchBox">
									<span class="material-symbols-outlined">
									search
									</span>
								</span>
							</div>

							<div class="searchDetail-upper-bottom-inner">
								<span class="periodBox" value="1">1개월</span> <span
									class="periodBox" value="3">3개월</span> <span class="periodBox"
									value="6">6개월</span> <span class="periodBox" value="12">1년</span>
							</div>
						</div>
					</div>
				</div>

				<div id="detailBox" class="searchDetail-lower">

				</div>
				<div id="toTop" class="d-flex justify-content-center shadow">
					<i class="bi bi-caret-up-fill" style="font-size: 1.2rem;"></i>
				</div>
			</div>
			
		</div>

		<c:import url="../footer/footer.jsp" />
		
		<%-- Modal --%>
		<div class="modal fade" id="memoModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">Memo</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form>
							<label for="memo-text" class="col-form-label">[💌] 메모를 기입해주세요</label>
							<textarea class="form-control" id="memo-text"></textarea>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="memoSubmit">수정</button>
						<button type="button" id="memoClose" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</body>
</html>