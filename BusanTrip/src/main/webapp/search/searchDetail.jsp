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
	
	.content{
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
		height: 140px;
		position: relative;
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
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
		margin: 2px 2px;
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
		border-radius: 5px;
		border: 1px solid var(--bnk-gray);
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
		margin: 3px 5px;
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
		
		let nowDay = new Date();
		let nowYear = nowDay.getFullYear();
		let nowMonth = nowDay.getMonth() + 1;
		let nowDate = nowDay.getDate();
		let now = nowYear + '-' + ('00' + nowMonth).slice(-2)
					+ '-' + ('00' + nowDate).slice(-2);
		
		// initial method
		
		
		$('.periodBox').click(function(){
			if ($(this).attr('class') != 'periodBox-choiced') {
				let period = $(this).attr('value');
				
				let befDay = new Date();
				befDay.setMonth(nowMonth-1-period);
				befDay.setDate(nowDate+1);
				
				let befYear = befDay.getFullYear();
				let befMonth = befDay.getMonth() + 1;
				let befDate = befDay.getDate();
				let bef = befYear + '-' + ('00' + befMonth).slice(-2)
							+ '-' + ('00' + befDate).slice(-2);
				
				$('#startDate').val(bef)
				$('#endDate').val(now)
				
				// period - 기간. befDay - 시작점. nowDay - 끝점(오늘).
				// 비동기 방식으로 정보 전달...
				//
				
				$('#detailBox').html("");
				loadData(parseInt(period/3)+1);  // 임시코드
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
				//
				
				$('#detailBox').html("");
				loadData(4);  // 임시코드
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
		
		
		// 맨 처음 페이지 들어왔을 시 1개월을 기본으로 조회하도록 자동 호출.
		$('.periodBox:eq(0)').click();
		
	});  // JQuery
	
	function loadData(tmp) {
		var dateArr = ["2022-08-30", "2022-08-30", "2022-08-14", "2022-07-15", "2022-06-08"];
		var nameArr = ["해달별다방 기장점", "BNK치킨 부산본점", "온점반점 일광점", "JAVA카페 서면점", "충전"];
		var moneyArr = ["-9000", "-23700", "-21000", "-4000", "500000"];
		var idArr = ["A", "B", "", "D", ""];
		var memoArr = ["", "메모가 다음과 같이 기재되어 있는 경우 이처럼 결과가 나오게 될 예정", "", "", "메모가 기재되어 있는 경우"];
		
		for (var i=0; i<tmp; i++) {
			let date = dateArr[i];
			let name = nameArr[i];
			let money = moneyArr[i];
			let id = idArr[i];
			let memo = memoArr[i];
			
			money = money.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			// html tag 생성 form
			<%-- 
			<div class="searchDetail-lower-box">
				<div class="searchDetail-lower-box-inner">
					<span class="payDate">2022-02-22</span>
					<div class="image-box">
						<img class="searchBtn" src="./img/search.png" width=20px>
						<img class="memoBtn" src="./img/memo.png" width=20px
									data-toggle="modal" data-target="#memoModal">
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
			--%>
			
			let hasId = (id != "");
			let hasMemo = (memo != "");
			
			let spanPayDate = document.createElement('span');
			spanPayDate.setAttribute('class', 'payDate');
			spanPayDate.append(date);
			
			if (hasId) {  // hasId
				var imgSearchBtn = document.createElement('img');
				imgSearchBtn.setAttribute('class', 'searchBtn');
				imgSearchBtn.setAttribute('src', '/img/search.png');
			}
			
			let imgMemoBtn = document.createElement('img');
			imgMemoBtn.setAttribute('class', 'memoBtn');
			imgMemoBtn.setAttribute('src', '/img/memo.png');
			imgMemoBtn.setAttribute('data-toggle', "modal");
			imgMemoBtn.setAttribute('data-target', "#memoModal");
			
			let divImageBox = document.createElement('div');
			divImageBox.setAttribute('class', 'image-box');
			if (hasId) divImageBox.append(imgSearchBtn);  // hasId
			divImageBox.append(imgMemoBtn);
			
			let divSearchDetailLowerBoxInner1 = document.createElement('div');
			divSearchDetailLowerBoxInner1.setAttribute('class', 'searchDetail-lower-box-inner');
			divSearchDetailLowerBoxInner1.append(spanPayDate);
			divSearchDetailLowerBoxInner1.append(divImageBox);
			
			
			let spanStoreName = document.createElement('span');
			spanStoreName.setAttribute('class', 'storeName');
			spanStoreName.append(name);
			
			let spanPayAmount = document.createElement('span');
			spanPayAmount.setAttribute('class', 'payAmount');
			spanPayAmount.append(money);
			
			let divSearchDetailLowerBoxInner2 = document.createElement('div');
			divSearchDetailLowerBoxInner2.setAttribute('class', 'searchDetail-lower-box-inner');
			divSearchDetailLowerBoxInner2.append(spanStoreName);
			divSearchDetailLowerBoxInner2.append(spanPayAmount);
			
		
			if (hasMemo) {  // hasMemo
				let spanMemo = document.createElement('span');
				spanMemo.setAttribute('class', 'memo');
				spanMemo.append(memo);
			
				var divSearchDetailLowerBoxInner3 = document.createElement('div');
				divSearchDetailLowerBoxInner3.setAttribute('class', 'searchDetail-lower-box-inner');
				divSearchDetailLowerBoxInner3.append(spanMemo);
			}
			
			
			let divSearchDetailLowerBox = document.createElement('div');
			divSearchDetailLowerBox.setAttribute('class', 'searchDetail-lower-box');
			divSearchDetailLowerBox.append(divSearchDetailLowerBoxInner1);
			divSearchDetailLowerBox.append(divSearchDetailLowerBoxInner2);
			if (hasMemo) divSearchDetailLowerBox.append(divSearchDetailLowerBoxInner3);  // hasMemo
			
			
			$('#detailBox').append(divSearchDetailLowerBox);
			
		}  // for
	}  // loadData
	
</script>

</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="content container">
			
			<div class="searchDetail-upper">
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
			
			<div id="detailBox" class="searchDetail-lower">
				
				<%-- 
				<div class="searchDetail-lower-box">
					<div class="searchDetail-lower-box-inner">
						<span class="payDate">2022-02-22</span>
						<div class="image-box">
							<img class="searchBtn" src="./img/search.png" width=20px>
							<img class="memoBtn" src="./img/memo.png" width=20px
										data-toggle="modal" data-target="#memoModal">
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
				--%>
				
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