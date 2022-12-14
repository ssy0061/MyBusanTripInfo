<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/animations.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	.space85 {
		height:85px;
	}
	.swiperContent h5, .myPlace h5{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	/* == first row == */
	#first-row{
		margin-top:20px;
	}
	.charPlace{
		display: flex;
        justify-content: center;
        align-items: center;
	}
	.charIamge{
		width:40%;
		max-width:150px;
		min-width:100px;
		height:auto;
		border-style:solid;
		border-color:#CB333B;
		border-width:4px;
		border-radius:4px;
		box-shadow:2px 3px 5px 0 #53565A;
	}
	.charIamge:hover{
		cursor:pointer;
	}
	.infoPlace{
		display: flex;
        justify-content: center;
        align-items: center;
        margin-top:12px;
	}
	.myInfo{
		width:80%;
		max-width:400px;
		min-width:225px;
		padding:5px 20px 5px 20px;
		border-radius:4px;
		box-shadow:2px 3px 5px 2px lightgray;
	}
	.myInfo p{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		color:#53565A;
	}
	.userInfo{
		margin:4px 0 4px 0;
	}
	/* modal */
	.modal-header{
		width:95%;
	}
	 .each-pic{
	 	margin:5px 0;
	 	width:80%;
	 	max-width:150px;
	 	height:auto;
	 	border-style:solid;
		border-color:#CB333B;
		border-width:4px;
		border-radius:4px;
		box-shadow:2px 3px 5px 0 #53565A;
		filter: brightness(80%);
	 }
	 .each-pic:hover{
	 	cursor:pointer;
		filter: brightness(100%);
	 }
	 .charChangeOk{
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
	 #editModal h4{
	 	font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	 }
	 #editModal p{
	 	font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	 }
	/* == second row == */
	#second-row{
		width:80%;
		max-width:400px;
		margin:10px auto;
		display:flex;
		justify-content:center;
	}
	#button1, #button2{
		width: 40%;
		min-width:90px;
	    margin:0 5px 10px 5px;
		line-height: 2.0;
		font-size: 1rem;
	    text-align: center;
	    color:white;
	    font-weight: bold;
	    background-color: #53565A;
	    border-color:transparent;
	    border-radius: 5px;
	    box-shadow: 0px 5px 8px -3px #aaa;
	}
	#button1:hover, #button2:hover{
		background-color: #CB333B;
	    color: white;
	}
	/* == third row == */
	#whichPlace, #myPlace{
		width:100%;
		height:150px;
		padding:10px 10px;
		border-style:solid;
		border-color:gray;
		border-radius:5px;
	}
	#third-row{
		width:200px;
		height:200px;
		color: white;
   		padding: 20px;
		display:flex;
		justify-content:center;
		align-items:end;
		border-radius:10px;
    background-image:
    linear-gradient(to bottom, transparent, #F08080 80%),
    url("https://image.shutterstock.com/image-photo/grilled-chicken-meat-fresh-vegetable-600w-1888455823.jpg");
	}
	/* swiper */
	.swiper {
        width: 100%;
        height: 100%;
      }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff
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
    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .swiperContent>*{
    	display: flex;
		flex-wrap: wrap;
		align-content: space-between;;
    }
    .bgGrad {
		width:220px;
		height:200px;
		color: white;
    	padding: 10px;
		display:flex;
		justify-content:center;
		align-items:end;
		border-radius:10px;
    	background-size: cover;
	}
	.swiperContent h6{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	/* == fourth row == */
	#fourth-row{
		margin-top:20px;
		display:flex;
		justify-content:center;
	}
	#myPlaceList{
		display:flex;
		justify-content:center;
		flex-wrap:wrap;
		padding:5px;
		border-style:solid;
		border-radius:5px;
		border-color:lightgray;
		min-height: 60px;
	}
	.myjjim{
		display:flex;
		justify-content:space-between;
		align-items: center;
		background-color:white;
		border-radius:4px;
		box-shadow:2px 3px 5px 2px lightgray;
		margin:6px;
		padding:5px;
	}
	.favorite-icon{
		font-variation-settings:
	  'FILL' 1,
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 24;
	  color:#eb4747;
	  cursor:pointer;
	}
	.favorite-icon:hover{
		color:#F08080;
	}
	.jjimname, .jjimaddr{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		color:#53565A;
	}
	/* responsive web */
	@media screen and (max-width: 575px) {
		.large {
		  display:none;
		}
	}
	@media screen and (min-width: 576px) {
		.small {
		  display: none;
		}
	}
	/* ????????? ?????? ?????? ?????? css */
	.content{
	    margin-top: 90px;
	    width:80%;
		max-width:800px;
		padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* ????????? 70*/
			padding-bottom: 80px;/* ????????? 80 */
			min-height: calc(100vh - 80px);
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 90px); /* ????????? 90px */
	    	padding: 20px 0;
		}
	}
	/* ????????? ?????? ?????? ?????? css */
</style>
<script>
$(document).ready(function() {
	var memberId = '<%= (String)session.getAttribute("memberId") %>';
	var memberCharUrl = '';
	findAllWishlist();
	
	$.ajax({
		type:'post',
		url:'/member/findMemberInfo',
		data:{'memberId':memberId},
		success:function(result){
			$('#userName').append(result.memberName);
			$('#userId').append(memberId);
			$('#userTele').append(result.memberTele);
			$('#userAddr').append(result.memberAddr);
			$('.charIamge').attr("src", result.memberChar);
			memberCharUrl = result.memberChar;
		},
		error: function(e){ console.log(e); }
	}); // ?????? ??????
	
	function updateChar() {
		$.ajax({
			type:'post',
			url:'/member/findMemberInfo',
			data:{'memberId':memberId},
			success:function(result){
				let storeNameList = 
				$('.charIamge').attr("src", result.memberChar);
			},
			error: function(e){ console.log(e); }
		});
	} // ????????? ????????? ?????? ??????
	
	$('#button2').click(function() {
		$.ajax({
			type: 'post',
			url: '/member/logout',
			success: function(result) {
				location.href = result;
			},
			error: function(e){ console.log(e); }
		});
	}) // ????????????
	
	var grcolor = ['#F08080', '#66CDAA', '#FFA07A', '#6c9dc6'];
	
	var tmpCharUrl = "";
	$('.each-pic').on("click", function(e){
		tmpCharUrl = $(this).attr("src");
		$(".each-pic").css("filter","brightness(80%)");
		$(this).css("filter","brightness(100%)")
	}); // ????????? ????????? ??????
	$('.charChangeOk').on("click", function(e){
		if(tmpCharUrl!==memberCharUrl){
			$.ajax({
				type:'post',
				url:'/member/updateCharacter',
				data:{'memberChar':tmpCharUrl, 'memberId':memberId},
				success:function(result){
					memberCharUrl = tmpCharUrl;
					console.log(result);
					updateChar()
				},
				error: function(e){ console.log(e); }
			});
		}
		
	}); // ????????? ????????? ?????????
	
	
	var photoList=[];
	function findTransactionPhoto(transactionId) { // ???????????? ??? ?????? ?????? ????????????
		$.ajax({
			type: 'post',
			url: '/story/findDiaryPhoto',
			data: {"transactionId": transactionId},
			async: false,		// ?????? ????????? refreshContent??? ????????? ??? findTransactionPhoto ???????????? photoList??? ??? ????????????
			
			success: function(result) {	// Photo List
				photoList = result;
			},
			error: function(e) {
				console.log(e)
			}
		})	
	}
	
	
	refreshContent();
	
	//this function define the size of the items
    function refreshContent() {
		$.ajax({
			type: 'post',
			url: '/story/findDiaryTransactionByMember',
			data: {'memberId': memberId},
		
			success: function(result){
				console.log(result);
				let transactionList = result;
				
				// ????????? ??? ??????
				$('.swiperContent').append(
		    			"<div id='user-"+memberId+"'>"+
		    			"<div class='swiper' id='swiper-"+memberId+"'>"+
		    			"<div class='swiper-wrapper'>"+
		    			"</div><div class='swiper-pagination'></div>"+
		    			"<div class='swiper-scrollbar'></div></div></div>"
		    	);
				
				var swiper = new Swiper("#swiper-"+memberId, {
	    			slidesPerView: 2.7,
	    	        spaceBetween: 10,
	    	        grabCursor: true,
	    	        navigation: {
	    	          nextEl: ".swiper-button-next",
	    	          prevEl: ".swiper-button-prev",
	    	        },
	    	        breakpoints: {
	    	        	// when window width is >= 0px
	    	            0: {
	    	            	slidesPerView: 2.3,
	    	            	spaceBetween: 10
	    	            },
	    	            720: {
	    	            	slidesPerView: 3.3,
	    	            },
	    	            1200: {
	    	            	slidesPerView: 3.5,
	    	            }
	    	        },
	    	        scrollbar: {
	    	            el: ".swiper-scrollbar",
	    	            draggable: true,
	    	        }
	    		});
				
				console.log("length:: " + transactionList.length);
				for(let i=0; i<transactionList.length; i++) {
					findTransactionPhoto(transactionList[i].diarytransactionId); // ?????? ?????? ????????????
					// ????????? ????????? ????????? ????????????
					if(photoList.length!=0) {
						let transactionStore = transactionList[i].transactionStore;
			    		//let transactionAmt = transactionList[i].transactionAmt;
			    		let transactionMemo = transactionList[i].transactionMemo;
			    		
			    		let transactionDate = transactionList[i].transactionTime.substring(0,10);
			    		let transactionTime = transactionList[i].transactionTime.substring(11,19);
			    		
			    		let photoUrl = photoList[0].photoUrl; // ????????? ?????? ??? ????????? ????????? ??????
			    		
			    		$('#swiper-'+memberId).children('.swiper-wrapper').append(
			    				"<div class='swiper-slide'><div class='bgGrad' "+
			    				"style='background-image:linear-gradient(to bottom, transparent, transparent, "+grcolor[(i%4)]+" 95%),url(\""+
			    				photoUrl+"\"); background-position:center center;'><h6>"+
			    				transactionStore+"<br><small>"+ transactionDate +"</small></h6></div>"
			    		);
					}
				}
			},
			error: function(e){
				console.log(e);
			}
		
		})
    }
	
	function findAllWishlist() {
		$.ajax({
			type:'post',
			url:'/store/findAllWishlist',
			data:{'memberId':memberId},
			success:function(result){
				let i;
				for(i=0; i<result.length; i++) {
					console.log(result[i].storeName);
					$('#myPlaceList').append("<div class='myjjim col-md-5' id='"+result[i].storeId+"'>"+
							"<span class='material-symbols-outlined favorite-icon'>favorite</span>"+
							"<span class='jjimname'>"+result[i].storeName+"</span>"+
							"<span class='jjimaddr'>"+result[i].storeAddr.split(" ")[0]+"</span></div>")
				}
			}, error: function(e){ console.log(e); }
		});
	}
	
    function deletejjim(){
    	$.ajax({
    		type:'post',
    		url:'/store/deleteWishlist',
    		data:{'storeId':storeId, 'memberId':memberId},
    		success:function(result){
    		}, error:function(e) { console.log(e); }
    	});
    }
	
    var storeId = "";
    $('#myPlaceList').on('click', '.favorite-icon', function(){
    	//console.log($(this).parent().attr('id'));
    	storeId = $(this).parent().attr('id');
    	deletejjim();
    	$(this).parent().remove();
    })
    
    $("#editModal").on('show.bs.modal', function () {/* ?????? ?????? ??? */
        $(".each-pic[src='"+memberCharUrl+"']").css("filter","brightness(100%)")
    });
    $("#editModal").on('hide.bs.modal', function () {/* ?????? ?????? ??? */
        $(".each-pic[src='"+tmpCharUrl+"']").css("filter","brightness(80%)")
    });
	$("#updateModal").on('show.bs.modal', function () {/* ?????? ?????? ??? */
        $(".each-pic[src='"+memberCharUrl+"']").css("filter","brightness(100%)")
    });
    $("#updateModal").on('hide.bs.modal', function () {/* ?????? ?????? ??? */
        $(".each-pic[src='"+tmpCharUrl+"']").css("filter","brightness(80%)")
    });
    
    $('#updateButton').on('click', updateMemberInfo)
})
	
	function updateMemberInfo(){
		var memberPw = $('#memberPw').val();
		var memberTele = $('#memberTele').val();
		var memberAddr = $('#memberAddr').val();
		var memberId = '<%= (String)session.getAttribute("memberId") %>';
		console.log(memberPw +" "+ memberTele +" "+ memberAddr)

		$.ajax({
			type: 'post',
			url: '/member/updateMemberInfo',
			data: {'memberPw':memberPw, 'memberTele': memberTele, 'memberAddr':memberAddr, 'memberId':memberId},
			
			success:function(result) {
				alert("?????? ?????? ?????????????????????.")
				location.href = '/bnk/myPage';
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
</script>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navSubTitle" value="???????????????" />
	</c:import>
	<div class="content container">
		<div class="row" id="fisrt-row">
			<div class="col-12">
				<div class="charPlace">
					<img class="charIamge" src="" data-toggle="modal" data-target="#editModal">
				</div>
				<div class="infoPlace">
					<div class="myInfo">
						<p id="userName" class="userInfo">?????? : </p>
						<p id="userId" class="userInfo">????????? : </p>
						<p id="userTele" class="userInfo">???????????? : </p>
						<p id="userAddr" class="userInfo">?????? : </p>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="second-row">
			<button type="button" id="button1" data-toggle="modal" data-target="#updateModal">?????? ??????</button>
			<button type="button" id="button2">????????????</button>
		</div>
		
		<div class="swiperContent">
			<h5>?????? ???????????? ??????</h5>
		</div>
		
		<!-- Slider main container -->
		<div class="swiper mySwiper">
		  <!-- Additional required wrapper -->
		  <div class="swiper-wrapper">
		    <!-- Slides -->
		  </div>
		  <!-- If we need pagination -->
		  <div class="swiper-pagination"></div>
		
		  <!-- If we need scrollbar -->
		  <div class="swiper-scrollbar"></div>
		</div>
		
		<div class="row myPlace" id="fourth-row">
			<div class="col-12">
				<h5>?????? ???????????? (??? ??????)</h5>
				<div id="myPlaceList">
				</div>
			</div>
			
		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="editModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">????????? ????????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" align="center">
					<div class="row">
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_01.png">
							<p>????????? ???</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_02.png">
							<p>????????????</p>
						</div>
						<div class="col-6 mx-autoc">
							<img class="each-pic" src="/img/character_03.png">
							<p>?????? ??????</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_04.png">
							<p>?????? ???</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_05.png">
							<p>G??????</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_06.png">
							<p>??????</p>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="??????" class="btn btn-secondary charChangeOk" data-dismiss="modal"></input>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="updateModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">?????? ?????? ??????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" align="center">
					<p>???????????? : <input type="text" id="memberPw" size="18"></p>
					<p>???????????? : <input type="text" id="memberTele" size="18"></p>
					<p>???    ??? : <input type="text" id="memberAddr" size="18"></p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="?????? ??????" id="updateButton" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>