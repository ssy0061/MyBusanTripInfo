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
			min-height: calc(100vh - 80px);
			padding-left: 0;
			padding-right: 0;
		}
		#toTop{
			bottom: 100px;
			right: 10px;
		}
		.searchDetail-lower{
			min-height: calc(100vh - 290px);
		}
	}
	@media screen and (max-width: 768px) {
		.collapseInnerWrap{
			display: flex;
			justify-content: space-around;
			align-items: center;
			width: 100%;
		}
		.collapseLeft{
			display: flex;
			flex-direction: column;
		}
		.periodBoxWrap{
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.searchDetail-upper-bottom-inner{
			padding-top: 8px;
			width: 100%;
		}
	}
	@media screen and (min-width: 768px) {
		.collapseInnerWrap{
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		.searchDetail-upper-bottom-inner{
			padding-left: 12px;
		}
		.backImg{ /* web backgorund */
/* 			background-image: url("/img/back3.jpg");
			background-size: 1500px 4000px;
			background-repeat: no-repeat; */
		}
	}
	
	@media screen and (min-width: 575.1px) { /* Web box */
		.content{
			min-height: calc(100vh - 190px); /*상하단바 190px */
			padding: 20px 0;
		}
		#toTop{
			bottom: 130px;
			right: 30px;
		}
		.box-1{
			border-radius: 10px;
			box-shadow: 1px 3px 5px 3px lightGray;
			min-height: calc(100vh - 230px);
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
		z-index: 98;
	}
	#toTop:hover{
		cursor: pointer;
	}
	.box-1{
		max-width: 720px;
		margin: 0 auto;
		text-align: center;
		background-color: white;
	}
	.searchDetail-upper {
		width: 100%;
		max-width: 720px;
		text-align: center;
		padding-top: 20px;
		position: relative;
		bottom: 0;
		background-color: #fef0f0;
	}
	
	.searchDetail-lower {
		width: 100%;
		max-width: 720px;
		text-align: center;
		border-radius: 0 0 5px 5px;
		padding-bottom: 10px;
		padding-top: 10px;
	}
	
	.searchDetail-upper-top {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
	}
	.condition-collapseWrap{
		background-color: #F6F6F6;
		/* border-bottom-style:solid;
        border-bottom-width:4px;
        border-color:#DCDCDC; */
        border-radius: 0 0 10px 10px;
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
		background-color: #DCDCDC;
		text-align: center;
	}
	.conditon-btn{
		font-variation-settings:
		'FILL' 0,
		'wght' 400,
		'GRAD' 0,
		'opsz' 48
	}
	.searchDetail-upper-bottom-inner {
		display: flex;
		justify-content: space-between;
	}
	.periodBox {
		background-color: white;
		border-radius: 10px;
		border: 3px solid lightGray;
		font-weight: bold;
		width: 100px;
		margin: 0 1px 1px;
		padding-left: 5px;
		padding-right: 5px;
	}
	.searchBox {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 40px;
		height: 40px;
	}
	
	.searchBox>img {
		position: relative;
		bottom: 2px;
	}
	
	.periodBox-choiced {
		background-color: white;
		width: 100px;
		border-radius: 10px;
		border: 3px solid #ff6666;
		font-weight: bold;
		margin: 0 1px 1px;
		padding-left: 5px;
		padding-right: 5px;
	}
	
	.periodBox:hover, .searchBox:hover {
	    background-color: var(--button-hover);
	}
	
	.periodBox:active, .searchBox:active {
	    background-color: var(--button-active);
	}
	
	.searchDetail-lower-box {
		max-width: 720px;
		margin: 0 auto;
		min-height: 60px;
		height: auto;
		padding: 10px 10px 10px;
	}
	
	.searchDetail-lower-box-inner {
		text-align: center;
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin: 2px 0;
		padding: 0 10px;
	}
	
	.payDate { 
		width: 220px;
		text-align: left;
		margin: 0 0 0 5px;
		color: gray;
		font-size: 14px;
	}
	
	.image-box {
		width: 32px;
	}
	
	.searchBtn, .memoBtn {
		position: relative;
		bottom: 4px;
		margin: 0 2px;
		width: 20px;
		z-index: 96;
	}
	
	.storeName {
		text-align: left;
		margin: 0 0 0 5px;
		font-weight: bold;
		font-size: 15px;
	}
	
	.paySearchAmount {
		text-align: right;
		margin: 0 5px 0 0;
		font-weight: bold;
		font-size: 15px;
	}
	
	.memo {
		width: 280px;
		margin: 0px 5px;
		font-size: 10px;
		text-align: left;
		padding: 1px 2px;
	}
	.datepicker-icon {
	  font-variation-settings:
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 40
	}
	.datepicker {
		margin: 1px 0 0;
		width: 100px;
		height: 30px;
		text-align: center;
		font-size: 13px;
	}
	.totalAmount{
		display: flex;
		justify-content: space-between;
	}
	/* memo modal */
	.material-symbols-outlined{
		color:#53565A;
	}
	.modal-title h5{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	.col-form-label{
		width:100%;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	.memoLen{
		display:flex;
		justify-content: flex-end;
		color:gray;
	}
	#memoSubmit, #memoClose{
		display:inline-block;
		padding:4px 10px;
		margin:0 5px;
		cursor:pointer;
		font-size:inherit;
		color:white;
		text-align:center;
		vertical-align:middle;
		border-radius:10px;
		border-color:transparent;
		box-shadow: 0 3px 3px 0 #53565A;
	}
	#memoSubmit {
		background-color:#6c9dc6;
	}
	#memoClose {
		background-color:#53565A;
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
				$('.accountNumber').text(accountNumber)
				$('.amount').text(res.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' 원')
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
		var chkPage = 1;
		
		// 1개월 조회(기본값)
		getTransaction(getPastDay(1),getNowDay())
		
		var total = 0;
		function getTransaction(startDay, finishDay) {
			let finishDayDate = new Date(finishDay);
			finishDayDate.setDate(finishDayDate.getDate()+1);
			let finishDayPlus1 = dayToString(finishDayDate);
			// 하루 더 더해야 올바른 조회가 가능.
			
			$.ajax({
				type: 'post',
				url: '/member/findTransactionBySpecificPeriod',
				data: {'accountNumber': accountNumber,
					   'startDay': startDay,
					   'finishDay': finishDayPlus1},
				
				success: function(res){
					list = res;
					totalPage = Math.ceil(list.length/10);
					nowPage = 1;
					chkPage = 1;  // 페이지 스크롤을 위해서 값 초기화
					$('#startDate').val(startDay)
					$('#endDate').val(finishDay)
					/* total */
					for (var i=0; i<list.length; i++) {
						total += list[i].transactionAmt
					}
					loadData(1)
				},
				error: function(e) {
					console.log(e)
				}
			})
		}
		
		
		$( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd',
			beforeShow: function() { setTimeout(function(){ $('.ui-datepicker').css('z-index', 97); }, 0); }
		});
		
		
		$('.periodBox').click(function(){
			if ($(this).attr('class') != 'periodBox-choiced') {
				let period = $(this).attr('value');
				
				let start = getPastDay(period)
				let end = getNowDay()
				$('#startDate').val(start)
				$('#endDate').val(end)
				
				$('.periodBox-choiced').attr('class', 'periodBox');
				$(this).attr('class', 'periodBox-choiced');
				
			}  // if
		});  // div click
		
		$('#startDate').change(function(){
			$('.periodBox-choiced').attr('class', 'periodBox');
		})
		
		$('#endDate').change(function(){
			$('.periodBox-choiced').attr('class', 'periodBox');
		})
		
		var total = 0;  // total 변수의 위치
		$('.searchBox').click(function(){
			let state = $('.periodBox-choiced').text()
			if(state !== "") $('#state').text(state)
			else $('#state').text("직접입력")
			let start = $('#startDate').val()
			let end = $('#endDate').val()
			
			let startDay = new Date(start);
			let endDay = new Date(end);
			
			if (startDay <= endDay) {
				total = 0;  // total 초기화
				getTransaction(dayToString(startDay), dayToString(endDay))
				$('#detailBox').html("");	
			} else {
				// 날짜 관계가 역전된 경우.
				alert('날짜의 입력이 잘못되었습니다.');
			} // if-else
		});  // div click
		
		$('#memo-text').keyup(function(e){
			let content = $(this).val();
			// 글자 수 세기
			if(content.length == 0 || content == ''){
				$('#nowMemoLen').text('0자');
			} else if(content.length >= 1 && content.length <= 40){
				$('#nowMemoLen').text(content.length+'자');
			}
			// 글자 수 제한
			if(content.length>40){
				$(this).val($(this).val().substring(0,40)); // 41자부터는 타이핑되지 않도록
			}
		})
		
		$('#memoSubmit').click( function() {
			let transactionMemo = $('#memo-text').val();
			let transactionId = $(this).attr('transaction-id');

			$.ajax({
				type: 'post',
				url: '/member/updateTransactionMemo',
				data: {'transactionId': transactionId, 'transactionMemo': transactionMemo},
				success: function(res){
					document.getElementsByClassName('searchBox')[0].click();
				},
				error: function(e) {
					console.log(e)
				}
			})
			
			$('#memoModal').trigger({ type: "click" });  // modal 종료
		});  // button click
		
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
		
		// 이미지랑 버튼 연결용 코드 
		$('#detailBox').on('click', '.searchBtn, .storeName', function(){
			searchModalChange($(this).parent().attr('store-id'));
		})  // img click
		
		// 이미지랑 버튼 연결용 코드 
		$('#detailBox').on('click', '.memoBtn', function(){
			$('#memoSubmit').attr('transaction-id', $(this).attr('transaction-id'));
			$('#memo-text').val('');  // 내용 초기화
		})  // img click
		
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
				var line = (i < list.length-1) ?
						   '<div style="max-width: 720px; '+
						   'border-bottom-color:#DCDCDC; '+
						   'border-bottom-width: 2px; '+
						   'border-bottom-style: solid;"></div> ' : ""
				$('#detailBox').append(
						'<div class="searchDetail-lower-box" id="lowerBox-'+i+'">'+
						'<div class="searchDetail-lower-box-inner">'+
						'<span class="payDate">'+list[i].transactionTime.substring(0,10)+'</span>'+
						'<div class="image-box d-flex justify-content-center align-items-center">'+
						'<span class="memoBtn material-symbols-outlined mt-1"'+
									 'data-toggle="modal" data-target="#memoModal"'+
									 'transaction-id='+list[i].transactionId+'>edit_square</span>'+
						'</div></div>'+
						'<div class="searchDetail-lower-box-inner">'+	
						'<div class="d-flex align-items-center" style="width: 60%;" store-id='+list[i].storeId+'>'+
						'<span class="storeName" data-toggle="modal" data-target="#searchModal">'+list[i].transactionStore+'</span>'+
						'<span class="searchBtn material-symbols-outlined pt-2" style="width: 20px;" data-toggle="modal" data-target="#searchModal">chevron_right</span></div>'+
						'<span class="paySearchAmount" style="width: 40%; color: #cb333b;">'+list[i].transactionAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' 원</span>'+
						'</div>'+memo+'</div>'+line
				);
			}  // for
			
			$('.totalAmount').html('<span><b>기간 합계</b></span><span><b>'+
					               total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'</b></span>');
			$('.totalAmount').css({
				"padding": "10px 10px",
				"border-bottom-style": "solid",
		        "border-bottom-width": "3px",
		        "border-color": "black"
			})
		}  // loadData
		
		$("#memoModal").on('show.bs.modal', function () {
			
		});
		
		$('.periodBox:eq(0)').attr('class', 'periodBox-choiced');
	});  // JQuery
	
	
	
</script>

</head>
<body>
	<div class="backImg">
		<c:import url="/header/nav.jsp">
			<c:param name="navSubTitle" value="소비내역"/>
		</c:import>

		<div class="content container">
			<div class="box-1">
				<div class="searchDetail-upper pb-3">
					<div class="searchDetail-upper-top">
						<span class="accountNumber"></span> 
						<span class="amount"></span>
					</div>
					
				</div>
				<div class="searchDetail-upper-bottom d-flex justify-content-end align-items-center px-3">
					<div>
						<a data-toggle="collapse" href="#conditionCollpase" 
						   style="text-decoration: none; color: black;"
						   class="d-flex justify-content-end  align-items-center">
							<span>최신순</span><span class="mx-2 mb-1">|</span>
							<span id="state">1개월</span>
							<span class="conditon-btn material-symbols-outlined">
								arrow_drop_down
							</span>
						</a>
					</div>
				</div>
				<div class="condition-collapseWrap">
					<div class="collapse" id="conditionCollpase">
						<div class="collapseInnerWrap px-2">
							<div class="collapseLeft py-2 d-flex justify-content-between align-items-center">
								<div class="periodBoxWrap">
									<span class="periodBox" value="1">1개월</span>
									<span class="periodBox" value="3">3개월</span>
									<span class="periodBox" value="6">6개월</span>
								</div>
								<div class="searchDetail-upper-bottom-inner d-flex justify-content-between align-items-center">
									<div class="d-flex justify-content-center align-items-center">
										<span class="datepicker-icon material-symbols-outlined">
											calendar_month
										</span>
										<input type="text" class="datepicker" id="startDate" readonly="readonly"> 
									</div>
									<span width="15px"><b>~</b></span>
									<div class="d-flex justify-content-center align-items-center">
										<span class="datepicker-icon material-symbols-outlined">
											calendar_month
										</span>
										<input type="text" class="datepicker" id="endDate" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="searchBox d-flex align-items-center">
								<a data-toggle="collapse" href="#conditionCollpase"
								   style="text-decoration: none; color: black;"
						   		   class="d-flex justify-content-end  align-items-center">
								<b>조회</b></a>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div style="max-width: 550px; width: 95%;">
						<div class="totalAmount"></div>
						<div id="detailBox" class="searchDetail-lower">
						</div>
					</div>
				</div>
				<div id="toTop" class="d-flex justify-content-center shadow">
					<i class="bi bi-caret-up-fill" style="font-size: 1.2rem;"></i>
				</div>
			</div>
			
		</div>

		<c:import url="../footer/footer.jsp" />
	</div>
	
	<%-- Memo Modal --%>
	<div class="modal fade" id="memoModal">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Memo</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form>
						<label for="memo-text" class="col-form-label">
							<span class="memostatement">메모를 기입해주세요.</span>
							<p class="memoLen mb-0"><span id="nowMemoLen">0자</span>
							<span id="totalMemoLen">/40자</span></p>
						</label>
						<textarea class="form-control" id="memo-text" maxlength="40"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="memoSubmit" transaction-id=0>수정</button>
					<button type="button" id="memoClose" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<%-- Store Modal --%>
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