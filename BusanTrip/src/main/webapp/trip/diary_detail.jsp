<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	
	.albumTitle{
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.albumTitle h3{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 700;
	}
	.albumTitle h5{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		line-height:1;
		color:#53565A;
	}
	.pay-store{
		width:100%;
		float:left;
	}
	.pay-price{
		width:40%;
		float:right;
	}
	.card-body{
		padding: 0.5rem;
	}
	.card-body>h6{
		width:100%;
		float:left;
	}
	/* customizebutton */
	.custom-button{
		background-color:transparent;
		border-style:solid;
		border-width:2px;
		border-color:#53565A;
		border-radius:5px;
	}
	.material-symbols-outlined{
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 24;
	  color:#53565A;
	}
	.material-btn{
		margin:3px 0;
	}
	.addFeed{
		display:flex;
		justify-content: center;
		align-items:center;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	.buttonWithText{
		display:flex;
		align-items:center;
	}
	/* modal - member */
	.mem-id, .mem-name{
		float:left;
		text-align:justify;
	}
	.modal-footer>input{
		box-shadow: 0 3px 3px 0 #53565A;
	}
	.modal-header h4{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	#transactionStr, #payListStr {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		font-size:18px;
		color:#6c9dc6;
	}
	#memberModal p{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
	}
	.modal-content-ta {
	  min-height: 80vh;
	}
	/* modal - pic */
	.modal-header, .modal-footer{
		width:100%;
	}
 	.image-area>div{
	    display:flex;
	    flex-direction:column;
	    flex-wrap:nowrap;
	} 
	.imgDiv{
		display: flex;
		justify-content: center;
	}
	.imgDiv img{
		object-fit: cover;
	}
	.image-area::before {
	    color: #fff;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    z-index: 1;
	}
	.each-image {
	    width:50%;
	    max-height: 200px;
	    height:auto;
	    padding:2px 5px;
	    margin:5px 2px;
	    z-index: 2;
	    position: relative;
	}
	.picture-btn-re>input[type="file"]{
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	.picture-btn-re>label, .deleteBtn{
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
		background-color:#F08080;
		box-shadow: 0 3px 3px 0 #53565A;
	}
	.deleteBtn{
		height:36px;
	}
	#input-label{
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
		background-color:#6c9dc6;
		box-shadow: 0 3px 3px 0 #53565A;
	}
	#resetUpload, .addPhotoYes, .memberSearchOk, .playListOk{
		display:inline-block;
		padding:4px 10px;
		cursor:pointer;
		font-size:inherit;
		color:white;
		text-align:center;
		vertical-align:middle;
		border-radius:10px;
		border-color:transparent;
		background-color:#53565A;
		box-shadow: 0 3px 3px 0 #53565A;
	}
	.addPhotoYes:hover, .memberSearchOk:hover, .playListOk:hover{
		color:white;
	}
	/* modal - payList */
	.modal-body.payListModalBody>.row, .payListAlert, #transactionStr{
		display:flex;
		justify-content: center;
	}
	.one-pay{
		display:flex;
		justify-content: center;
		margin-bottom:2px;
		border-radius:20px;
		box-shadow:2px 3px 5px 2px lightgray;
	}
	.one-pay-noneClick{
		display:flex;
		justify-content: center;
		margin-bottom:2px;
		border-radius:20px;
		box-shadow:2px 3px 5px 2px lightgray;
	}
	.payListInfo{
		display:flex;
		flex-direction: column;
		padding:2px;
	}
	.payListInfo1, .payListInfo2{
		display:flex;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.payListInfo1{
		justify-content: space-between;
		font-weight: 400;
		color:gray;
		padding-left: 8px;
		padding-right: 8px;
	}
	.payListInfo2{
		justify-content: space-between;
		font-weight: 500;
		padding-left: 8px;
		padding-right: 8px;
	}
	.payListCheckbox{
		display:flex;
		justify-content: center;
		align-content: center;
	}
	/* responsive web */
	@media screen and (max-width: 575px) {
		.large {
		  display: none;
		}
	}
	@media screen and (min-width: 576px) {
		.small {
		  display: none;
		}
	}
	/* swiper */
	.swiper {
        width: 100%;
        height: 100%;
      }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    .swiperContent>*{
    	/* display: flex;
		flex-wrap: wrap;
		align-content: space-between; */
    }
    #transactionModal .one-pay:hover{
    	cursor: pointer;
    }
    .imageWrap{
    	display: inline-flex;
    	justify-content: center;
    	align-items: flex-start;
    }
    .imgBtn{
    	display: inline-flex;
    	flex-direction: column;
    	justify-content: flex-start;
    	align-items: flex-start;
    	width: 40%;
    	height: 100%;
    }
    .uploadImg {
    	display: flex;
    	flex-direction: column;
    	align-items: center;
    	overflow: auto;
    }
    /* card */
    .card-header{
    	overflow: hidden;
    	height: 80%; 
    	padding: 0;
    	display: flex;
    	justify-content: center;
    }
    
    .card_img_row{
	  width: 100%;
	  display: flex;
	  justify-content: center;
    }
    
	.card{
    	height: 20rem;
    	width: 25rem;
    }
    .card-img-box {
		height:100%;
	  	object-fit: cover;
	}
	.card-col-6{
		width: 49.5%;
	}
	.card-col-6-bar{
		width: 1%;
	}
	.card-col-12>img{
		width: 100%;
	}
	.card-row-6{
		height: 49.5%;
	}
	.card-row-6>img{
	}
	.card-row-6-bar{
		height: 1%;
	}
	.card-text{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		color:#53565A;
	}
	.card-text.pay-store{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	.card-body>h6{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		color:#53565A;
	}
	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	    width:90%;
		max-width:800px;
		padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* 상단바 70*/
			padding-bottom: 80px;/* 하단바 80 */
			min-height: calc(100vh - 70px);
		}
		
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 90px); /* 상단바 90px */
	    	padding: 20px 0;
		}
		.card{
	    	height: 25rem;
	    } 
	}
	/* 상하단 바를 위한 필수 css */
</style>
<script>
$(document).ready(function () {
    var memberId = '<%= (String)session.getAttribute("memberId") %>';
	var storyId = location.pathname.split("/")[3];
	var diaryId = location.pathname.split("/")[4];
	var memberList = [];
	var transactionList = [];
	var photoList = [];
	var checkTransactionList = [];
	var testVal=0;
	console.log("storyId::"+storyId+"  diaryId::"+diaryId);
	
	refreshContent();
	findDiaryName();
	
	function findDiaryName() {
		$.ajax({
			type: 'post',
			url: '/story/findDiaryName',
			data: {'diaryId' : diaryId},
			
			success: function(result) {
				/* console.log(result); */
				$('.albumTitle h3').append( result )
			},
			error: function(e) {
				console.log(e);
			}
		})
		
	}
	
	function findStoryMember() { // 현재 스토리 멤버 리스트 조회
		$('.member_val').text("");
		$.ajax({
			type: 'post',
			url: '/story/findStoryMember',
			data: {'storyId' : storyId},
			
			success:function(result) {
				/* console.log("findStoryMember result:: " + result); */
				memberList = result;
				for(var i=0; i<memberList.length; i++) {
					$('.mem-id').append(
						"<p class='member_val' align=center>"+memberList[i].memberId+"</p>"		
					);
					$('.mem-name').append(
						"<p class='member_val' align=center>"+memberList[i].storymemberName+"</p>"	
					);
				}
			},
			error:function(e) {
				console.log(e);
			}
		})
	}
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
	var findTransactionList = [];
    var startDay = getPastDay(3);
    var finishDay = getNowDay();
	function findAllTransaction() { // 회원이 가지고 있는 전체 계좌의 전체 거래내역 조회
		$.ajax({
			type:'post',
			url:'/member/findAllAccount',
			data:{"memberId":memberId},
			success:function(result){
				var accountList = result;
				$('.payListRow').html("<p id=payListStr><small>최근 3개월의 결제내역을 추가할 수 있습니다.</small></p>");
				for(var i=0; i<accountList.length; i++){ // 계좌 개수만큼 계좌번호 불러오기
					//console.log("findAllAccountNumber :: "+accountNumberList);
					findTransactionBySpecificPeriod(accountList[i].accountNumber)
				}
				/* console.log(findTransactionList) */
				findTransactionList.sort(function(a, b){
					var a_val = a.transactionTime.substring(0,10)+" "+a.transactionTime.substring(11,19);
					var b_val = b.transactionTime.substring(0,10)+" "+b.transactionTime.substring(11,19);
					if(a_val < b_val) return 1;
					else if(a_val > b_val) return -1;
					else return 0;
				})
				/* console.log(findTransactionList) */
				for(var j=0; j<findTransactionList.length; j++){
					var transactionAccountNumber = findTransactionList[j].accountNumber;
					var transactionId = findTransactionList[j].transactionId;
					var transactionStore = findTransactionList[j].transactionStore;
					var transactionAmt = findTransactionList[j].transactionAmt;
					var transactionTime = findTransactionList[j].transactionTime.substring(0,10)+" "+findTransactionList[j].transactionTime.substring(11,19);
					$('.payListRow').append("<div class='col-11 one-pay mb-2' id='outer'><div class='col-10 payListInfo mx-0 mt-1 mb-0'><p class='payListInfo1 my-0'><small><span id='payListAccount'>"
							+transactionAccountNumber+"</span></small><small><span id='payListDate'>"+transactionTime
							+"</span></small></p><p class='payListInfo2 my-1'><span id='payListName'>"
							+transactionStore+"</span><span id='payListPrice'>"+transactionAmt+"</span></p></div>"
							+"<div class='col-2 payListCheckbox my-0'><input type='checkbox' name='addCheckBox' id='checked' data-num="+transactionId+"></div></div>")
				}
			}, error: function(e) { console.log(e) }
		})
	}
	
	function findTransactionBySpecificPeriod(accountNumber) {
		$.ajax({
			type:'post',
			url:'/member/findTransactionBySpecificPeriod',
			data:{"accountNumber":accountNumber, "startDay":startDay, "finishDay":finishDay},
			async: false,
			success:function(result){
				findTransactionList = [];
				for(var i=0;i<result.length;i++) {
					result[i].accountNumber = accountNumber;
					findTransactionList.push(result[i]);
				}
				//console.log("findTransactionStore :: "+findTransactionStoreList);
				//console.log("findTransactionAmt :: "+findTransactionAmtList);
				//console.log("findTransactionTime :: "+findTransactionTimeList);
			}, error:function(e) { console.log(e) }
		})	
	}
	
	
	var memberInfo;
	var memberName;
	function findMemberInfo(memberId) {
		$.ajax({
			type: 'post',
			url: '/member/findMemberInfo',
			data: {"memberId": memberId},
			async: false,
			success: function(result) { // member VO
				console.log(result);
				memberInfo = result;
				memberName = memberInfo.memberName;
			},
			error: function(e) {
				
			}
		})
	}
	console.log(memberName)
	
	/* function findTransaction(transactionId) { // transaction 찾기
		console.log("::::: " + transactionId);
		
		$.ajax({
			type: 'post',
			url: '/member/findTransactionByTransactionId',
			data: {"transactionId": transactionId},
			
			success: function(result) {
				var transaction = result;
				console.log(transaction);
				addDiaryTransaction(transaction);
				// transactionId로 transaction vo 찾기
				// addDiary에 저장
				
			},
			error: function(e) {
				
			}
		})
	} */
	
	function addDiaryTransaction(transactionId) { // addDiaryTransaction
		findMemberInfo(memberId);
	
		console.log("transactionId:: " +transactionId + "diaryId:: "+ diaryId + " " + "memberName :: " + memberName);
		
		/* var param = {
				"transaction": transaction,
				"diaryId": diaryId,
				"memberName": memberName
		} */
		
		$.ajax({
			type: 'post',
			url: '/story/addDiaryTransactionMap',
			dataType: 'json',
			data: {"transactionId": transactionId,
					"diaryId": diaryId,
					"memberName": memberName},
			async: false,
			success: function(result) {
	
			},
			error: function(e) {
				
			}
		})
	}

	function addPhotoToDiaryTransaction() {
		$.ajax({
			type: 'post',
			url: '/story/addPhotoToDiaryTransaction',
			data: {},
			
			success:function(result) {
				console.log(result);
			},
			error: function(e) {
				console.log(e);
			}
		})
	}

	function findDiaryTransaction(appendTo) { // 다이어리 내 거래내역 조회
		$.ajax({
			type: 'post',
			url: '/story/findAllDiaryTransaction',
			data: {"diaryId": diaryId},
			
			success: function(result) { // DiaryTransaction List
				console.log("findDiaryTransaction result:: " + result)
				transactionList = result;
				console.log(result)
				
				// 초기화
				$(appendTo).html("");
				// 데이터 출력
				for(var i=0; i<transactionList.length; i++) {
					appendTransactionTo(transactionList[i], appendTo);
				}
			},
			error: function(e) {
				console.log(e)
			}
		})	
	}
	function appendTransactionTo(transaction, appendTo){
		var diarytransactionId = transaction.diarytransactionId;
		var memberId = transaction.memberId;
		var transactionStore = transaction.transactionStore;
		var transactionAmt = transaction.transactionAmt;
		var transactionTime = transaction.transactionTime.substring(0,10)+" "+transaction.transactionTime.substring(11,19);
		
		$(appendTo).append(
				"<div id='diarytransactionId-"+diarytransactionId+"' class='col-12 one-pay mb-2'>"+
				"<div class='col-10 payListInfo mx-0 my-0'>"+
				
				"<p class='payListInfo1 mt-1 mb-0'><small><span id='payListMember'>"+memberId+"</span></small>"+
				"<small><span id='payListDate'>"+transactionTime+"</span></small></p>"+
				
				"<p class='payListInfo2 my-1'><span id='payListName'>"+transactionStore+"</span>"+
				"<span id='payListPrice'>"+transactionAmt+"</span></p></div></div>");
	}
	
	function findTransactionPhoto(transactionId) { // 거래내역 당 사진 목록 가져오기
		$.ajax({
			type: 'post',
			url: '/story/findDiaryPhoto',
			data: {"transactionId": transactionId},
			async: false,		// 이거 없으면 refreshContent가 실행된 후 findTransactionPhoto 실행돼서 photoList에 값 안들어감
			
			success: function(result) {	// Photo List
				photoList = result;
				testVal = 1;
				console.log("findTransactionPhoto result:: " + JSON.stringify(photoList));
			},
			error: function(e) {
				console.log(e)
			}
		})	
	}
	
    //this function define the size of the items
    function refreshContent() { // diary_detail 화면 띄우기
    	$.ajax({
			type: 'post',
			url: '/story/findAllDiaryTransaction',
			data: {"diaryId": diaryId},
			
			success: function(result) { // DiaryTransaction List
				/* console.log("refreshContent result:: " + result) */
				transactionList = result;
				$('.swiperContent').html("")
				for(var i=0; i<transactionList.length; i++) { // for..transactionList
					var memberId = transactionList[i].memberId;
					var element = document.getElementById("user-"+memberId);
		
					findTransactionPhoto(transactionList[i].diarytransactionId); // 사진 목록 가져오기
					var transactionStore = transactionList[i].transactionStore;
		    		var transactionAmt = transactionList[i].transactionAmt;
		    		var transactionMemo = transactionList[i].transactionMemo;
		    		
		    		var transactionDate = transactionList[i].transactionTime.substring(0,10);
					var transactionTime = transactionList[i].transactionTime.substring(11,19);
					
		    		var photoUrl1 = '/img/cat.jpg';
		    		var photoUrl2 = '/img/icecream.jpg';
		    		var photoUrl3 = '/img/drink.jpg';
		    		var photoUrl4 = '/img/building.jpg';
		    		
		    		var len = photoList.length;
					if(element == null) { // 공간 생성 안된 사용자인 경우
						// 사용자 별 스위퍼 공간 생성
			    		$('.swiperContent').append(
			    			"<div id='user-"+memberId+"'>"+
			    			"<h5 class='mt-3'>"+memberId+"</h5>"+
			    			"<div class='swiper' id='swiper-"+memberId+"'>"+
			    			"<div class='swiper-wrapper'>"+
			    			"</div><div class='swiper-pagination'></div>"+
			    			"<div class='swiper-scrollbar'></div></div></div>"
			    		);
					}	 
		    		var swiper = new Swiper("#swiper-"+memberId, {
		    			slidesPerView: 2.2,
		    	        spaceBetween: 10,
		    	        grabCursor: true,
		    	        navigation: {
		    	          nextEl: ".swiper-button-next",
		    	          prevEl: ".swiper-button-prev",
		    	        },
		    	        breakpoints: {
		    	            // when window width is >= 0px
		    	            0: {
		    	            	slidesPerView: 1.2,
		    	            	spaceBetween: 10
		    	            },
		    	            720: {
		    	            	slidesPerView: 1.8,
		    	            },
		    	            1024: {
		    	            	slidesPerView: 2.2,
		    	            }
		    	        },
		    	        scrollbar: {
		    	            el: ".swiper-scrollbar",
		    	            draggable: true,
		    	        }
		    		});
		    		
		    		var imgList = "";
		    		if(len==0){
		    			imgList = "<div class='card-col-12'>"+
		    					  "<img class='card-img-top card-img-box' src='"+photoUrl1+"'></div>"
		    		}else if(len==1){
		    			imgList = "<div class='card-col-12'>"+
		    					  "<img class='card-img-top card-img-box' src='"+photoList[0].photoUrl+"'></div>"
		    		}else if(len==2){
		    			imgList = "<div class='card-col-6'>"+
		    				      "<img class='card-img-top card-img-box' src='"+photoList[0].photoUrl+"'></div>"+
		    				      "<div class='card-col-6-bar'></div>"+
		    				      "<div class='card-col-6'>"+
		    				      "<img class='card-img-top card-img-box' src='"+photoList[1].photoUrl+"'></div>"
		    		}else if(len==3){
		    			imgList = "<div class='card-col-6'>"+
		    					  "<img class='card-img-top card-img-box' src='"+photoList[0].photoUrl+"'></div>"+
		    					  
		    					  "<div class='card-col-6-bar'></div>"+
		    					  
		    					  "<div class='card-col-6'>"+
		    					  "<div class='card-row-6'>"+
		    					  "<img class='card-img-top card-img-box' src='"+photoList[1].photoUrl+"'></div>"+
		    					  "<div class='card-row-6-bar'></div>"+
		    					  "<div class='card-row-6'>"+
  				      			  "<img class='card-img-top card-img-box' src='"+photoList[2].photoUrl+"'></div></div>"
		    		}else if(len==4){
		    			imgList = "<div class='card-col-6'>"+
		    			          "<div class='card-row-6'>"+
			  					  "<img class='card-img-top card-img-box' src='"+photoList[0].photoUrl+"'></div>"+
			  					  "<div class='card-row-6-bar'></div>"+
			  					  "<div class='card-row-6'>"+
					      		  "<img class='card-img-top card-img-box' src='"+photoList[1].photoUrl+"'></div></div>"+
					      		  
					      		  "<div class='card-col-6-bar'></div>"+
					      		  
					      		  "<div class='card-col-6'>"+
					      		  "<div class='card-row-6'>"+
			  					  "<img class='card-img-top card-img-box' src='"+photoList[2].photoUrl+"'></div>"+
			  					  "<div class='card-row-6-bar'></div>"+
			  					  "<div class='card-row-6'>"+
					      		  "<img class='card-img-top card-img-box' src='"+photoList[3].photoUrl+"'></div></div>"
		    		}
		    		if(len>0){
		    			// 스위퍼 내부 사진, 정보 등 채우기
		    			$('#swiper-'+memberId).children('.swiper-wrapper').append(
		    				"<div class='swiper-slide'>"
		    					+"<div class='card'>"
			    					+ "<div class='card-header'>"
			    						+ "<div class='card_img_row'>"
			    						+ imgList
				    					+ "</div>" 
			    					+ "</div>"
			    					+ "<div class='card-body'>"
			    						+ "<div class='card-text' style='font-size:1rem;'>"+ transactionDate+' '+transactionTime+ "</div>"
			    						+ "<div class='card-text pay-store' style='font-size:1.2rem;'>"+transactionStore+"</div>"
			    						+ "<h6>"+transactionMemo+"</h6>"
			    					+"</div>"
		    				+"</div></div>"
		    			);
		    		}
				}// for..transactionList
				$('.albumTitle h5').html("")
				let listLen = transactionList.length;
				if(listLen){
					var diaryDate = transactionList[listLen-1].transactionTime.substring(0,10);
					if(diaryDate !== transactionList[0].transactionTime.substring(0,10) ){
						diaryDate += ' ~ ' + transactionList[0].transactionTime.substring(0,10)
					}
					$('.albumTitle h5').append(diaryDate)
				}
				
			}, // success
			error: function(e) {
				console.log("refreshContent error :: "+e)
			}
		})	
    } //refreshContent
    
    var fileArr = "";
    /* multi file upload */
	function readMultiImage(input) {
		const multiContainer = document.getElementById('multiContainer');
		
		if(input.files) { // 인풋 태그에 파일들이 있는 경우
			// 이미지 파일 검사 생략
			console.log(input.files)
			var file_cnt = input.files.length;
			/* console.log(file_cnt); */
			fileArr = Array.from(input.files) // forEach문으로 처리하기 위해 유사배열을 배열로 변환
			const $colDiv = document.createElement('div')
			fileArr.forEach((file, index) => {
				const reader = new FileReader()
				
	            const $imgDiv = document.createElement('div')
	            $imgDiv.classList.add('imageWrap')
	            const $img = document.createElement('img')
	            $img.classList.add('each-image')
	            
	            const $btnDiv = document.createElement('div')
	            $btnDiv.classList.add('imgBtn')
	            const $label = document.createElement('label')
	            $label.classList.add('image-label')
	            $label.textContent = file.name
	            //var str="<button type='button' id='delete_"+(index)+"'>삭제</button>"
	            
	            var $str = document.createElement('button');
	            $str.setAttribute('type', 'button');
	            $str.setAttribute('id', 'delete_'+index);
	            $str.setAttribute('class', 'deleteBtn');
	            $str.append('삭제');
	            
	            $imgDiv.appendChild($img);
	            $btnDiv.appendChild($label);
	            
	            reader.onload = e => {
	            	$img.src = e.target.result;
	            };
	            console.log(file.name);
	            $btnDiv.append($str);
	            $imgDiv.appendChild($btnDiv);
				$colDiv.appendChild($imgDiv);

				reader.readAsDataURL(file)			
			})
			multiContainer.appendChild($colDiv)
		}
	} //readMultiImage(input)
	const inputMultiImage = document.getElementById("upload")
		inputMultiImage.addEventListener('change', (e) => {
			readMultiImage(e.target)
	});
		
	function deleteFile(obj){
		obj.parent().remove();
	}
	$('#resetUpload').hide();
	$('#resetUpload').click(function(){
		$('#multiContainer').children().remove();
		$('#input-label').show();
		$('#resetUpload').hide();
	})
	$('#upload').change(function(){
		$(this).hide();
		$('#input-label').hide();
		$(this).val("");
		$('#resetUpload').show();
	})
	$('#multiContainer').on("click", ".deleteBtn", function(e) {
		console.log($(this).attr("id").substring(7));
		fileArr.splice($(this).attr("id").substring(7),1);
		console.log(fileArr)
		$(this).parent().parent().remove();
	});
	
	$('.custom-button').hover(function(){
		$(this).children().css("color","white");
		$(this).css("background-color","#53565A");
	}, function(){
		$(this).children().css("color", "#53565A")
		$(this).css("background-color","white");
	})
	
	$('#btn_findStoryMember').on("click", function(e) {
		findStoryMember();
	})
	
	$('#btn_findPayList').on("click", function(e) {
		findDiaryTransaction('#findPayListModal .modal-body');
	})
	
	$('#btn_addPayList').on("click", function(e) {
		findAllTransaction();
	})
	$('#btn_addFeed').on("click", function(e) {
		$('#transactionStr').show();
		$('#transactionModal .modal-body').show();
		$('.uploadImg').hide();
		$('#transactionModal .modal-footer').hide();
		findDiaryTransaction('#transactionModal .modal-body');
	})
	$('#transactionModal .modal-body').on("click", ".one-pay", function(){
		$('#transactionStr').hide();
		$(this).addClass("one-pay-noneClick");
		$(this).removeClass("one-pay");
		var diarytransactionId = $(this).attr("id").substring(19);
		$('#transactionModal .one-pay').each(function(){
			if($(this).attr("id").substring(19)!==diarytransactionId) {
				$(this).remove()
			}
		})
		
		$('.uploadImg').show();
		$('#transactionModal .modal-footer').show();
	})
	$("#transactionModal").on('hide.bs.modal', function () {
		$('#multiContainer').html("")
		$('#resetUpload').trigger("click");
		refreshContent();
	});
	var diarytransactionId = "";
	$('.addPhotoYes').on("click", function(e) {
		// 같은 거래내역에 여러번에 걸쳐서 넣으면 4장 이상 들어갈듯.. 일단 구현
		console.log(fileArr)
		if(fileArr.length < 1) return alert("사진을 추가해주세요");
		if(fileArr.length <= 4){
			// 해당 거래내역에 photo 추가 코드 추가해야 함			
			$('#transactionModal').modal('hide');
			diarytransactionId = $(".one-pay-noneClick").attr("id").substring(19);
			console.log(diarytransactionId);
			console.log(fileArr);
			for(var i=0;i<fileArr.length;i++){
				var data = new FormData();
				data.append("photo", fileArr[i]);
				data.append("diaryTransactionId", diarytransactionId);
				console.log(data)
				$.ajax({
					type: 'post',
					url: '/story/addPhotoToDiaryTransaction',
					enctype: 'multipart/form-data',
					async: false,
					processData: false,
					contentType: false,
					data: data,
					success:function(result){
						console.log(result);
					},
					error:function(e){
						console.log(e);
					}
				})
			}
		} else {
			alert("사진은 최대 4장까지 등록 가능합니다.");
		}
	})
	
	$('#payListModalOK').on("click", function(){
		$("input:checkbox[name=addCheckBox]:checked").each(function(index, item){
			let flag = 0;
			
			/* for(let i=0; i<transactionList.length; i++) {
				if(transactionList[i] == $(item).attr("data-num")) {
					console.log("exist!");
					flag = 1;
					break;
				}
			} */
			
			if(flag == 0) {
				checkTransactionList.push($(item).attr("data-num"));
				console.log($(item).attr("data-num"));
			}
		});
		
		for(let i=0; i<checkTransactionList.length; i++) {
			console.log("item:: " + checkTransactionList[i]);
			addDiaryTransaction(checkTransactionList[i]);
		}
		checkTransactionList = [];
	})
	
});
</script>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navSubTitle" value="다이어리"/>
	</c:import>
	<div class="content container">
		<div class="row mb-4 ">
			<div class="albumTitle col-6 pr-0 ">
				<h3></h3>
				<h5></h5>
			</div>
			<div class="col-6 row p-0" id="customizeButton" align="right">
				<div class="col-12 p-0">
					<a data-toggle="tooltip" data-placement="left" title="결제내역  불러오기">
					<button type="button" id="btn_addPayList" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#payListModal">
						<span class="material-btn material-symbols-outlined receipt_long">assignment_add</span>
					</button>
					</a>
					<a data-toggle="tooltip" data-placement="left" title="결제내역 조회하기">
					<button type="button" id="btn_findPayList" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#findPayListModal">
						<span class="material-btn material-symbols-outlined receipt_long">receipt_long</span>
					</button>
					</a>
					<a data-toggle="tooltip" data-placement="left" title="멤버 조회하기">
					<button type="button" id="btn_findStoryMember" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#memberModal">
						<span class="material-btn material-symbols-outlined group">group</span>
					</button>
					</a>
				</div>
				<div class="col-12 mt-1 p-0">
					<a data-toggle="tooltip" data-placement="left" title="피드 추가하기">
					<button type="button" id="btn_addFeed" class="btn btn-outline-secondary custom-button buttonWithText" data-toggle="modal" data-target="#transactionModal">
						<span class="material-symbols-outlined add_photo_alternate">add_photo_alternate</span><span class="addFeed"><small>&nbsp;피드 추가하기</small></span>
					</button>
					</a>
				</div>
			</div>
		</div>
		<div class="swiperContent">

		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	<!-- 결제 내역 추가 modal -->
	<div class="modal fade pr-0" id="payListModal">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content modal-content-ta">
				<div class="modal-header">
					<h4 class="modal-title">결제내역 불러오기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body payListModalBody">
					<div class="row payListRow">
						
						
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" id="payListModalOK" value="확인" class="btn playListOk" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>
	<!-- 결제 내역 조회 modal -->
	<div class="modal fade pr-0" id="findPayListModal">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content modal-content-ta">
				<div class="modal-header">
					<h4 class="modal-title">결제내역 조회하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body payListModalBody">
				</div>
				<div class="modal-footer">
					<input type="submit" value="확인" class="btn playListOk" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>
	<!-- 피드 추가 modal -->
	<div class="modal fade" id="transactionModal">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">피드 추가하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div id="transactionStr" class="mt-3"><small>거래내역 하나를 선택해주세요</small></div>
				<div class="modal-body" align="center" style="min-height:100px;">
				
				</div>
				<div class="uploadImg mx-auto picture-btn-re py-2">
					<label id="input-label" for="upload">사진 추가</label> <input
						id="upload" type="file" accept="image/*" multiple> <input
						type="button" id="resetUpload" value="초기화">
					<div id="multiContainer" class="image-area mt-4"></div>
				</div>
				<div class="modal-footer">
					<input type="submit" value="확인" class="btn addPhotoYes" ></input>
				</div>
			</div>
		</div>
	</div>
	<!-- 멤버 조회 modal -->
	<div class="modal fade" id="memberModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">멤버 조회하기</h4>
					<button type="button" class="close btn" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body memberModalBody">
					<div class="col-6 mem-id">
						<p align="center">아이디</p>
						<hr>
					</div>
					<div class="col-6 mem-name">
						<p align="center">이름</p>
						<hr>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" value="확인" class="btn memberSearchOk" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>
</body>
</html>