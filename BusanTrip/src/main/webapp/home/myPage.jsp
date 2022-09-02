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
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	.space100 {
		height:100px;
	}
	.container{
		width:80%;
		max-width:800px;
		margin: 20px auto;
	}
	#first-row, #third-row, #fourth-row{
		margin-top:20px;
	}
	/* == first row == */
	#accountPlace{
		width:100%;
		height:140px;
		padding:20px 20px;
		border-style:solid;
		border-color:gray;
		border-radius:5px;
	}
	#bnkIcon{
		width:30px;
		height:30px;
		border-style:solid;
		border-radius:10px;
		border-color:#CB333B;
	}
	#accountPrice{
		width:100%;
	    font-size: 22px;
	    text-align: right;
	    font-weight:bold;
	}
	.charPlace{
		display: flex;
        justify-content: center;
        align-items: center;
	}
	.charPlace.large{
		width:80%;
		height:140px;
	}
	.charPlace.small{
		height:130px;
		width:auto;
		padding-top:10px;
	}
	.charIamge{
		width:auto;
		height:100%;
		border-style:solid;
		border-color:#CB333B;
		border-width:4px;
		border-radius:4px;
		box-shadow:2px 3px 5px 0 #53565A;
	}
	.charIamge:hover{
		cursor:pointer;
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
	/* == second row == */
	#second-row{
		margin:20px 1px 0 1px;
		display:flex;
		justify-content:space-around;
	}
	.button1, .button2{
		width:28%;
		padding:6px 0;
		color:#4CAF50;
		font-weight:600;
		background-color:white;
		border: 3px solid #4CAF50;
		border-radius:2px;
	}
	.button3{
		width:40%;
		padding:6px 0;
		color:#4CAF50;
		font-weight:600;
		background-color:white;
		border: 3px solid #4CAF50;
		border-radius:2px;
	}
	.button1:hover, .button2:hover, .button3:hover{
		background-color:#4CAF50;
		color:white;
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

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .content>*{
    	display: flex;
		flex-wrap: wrap;
		align-content: space-between;;
    }
	/* == fourth row == */
	/* responsive web */
	@media screen and (max-width: 575px) {
		.large, .large>* {
		  display:none;
		}
	}
	@media screen and (min-width: 576px) {
		.small, .small>* {
		  display: none;
		}
	}
</style>
<script>
$(document).ready(function() {
	$('.each-pic').on("click", function(e){
		var src = $(this).attr("src");
		console.log(src)
	});
	
	refreshContent();

    $(window).resize(function () {
    });
	
	//this function define the size of the items
    function refreshContent() {
    	for(let i = 0; i<result.length; i++) {
    		// 생성
    		user = result[i].user;
    		list = result[i].list;
    		$('.content').append(
    			"<div id='user-"+user+"'>"+
    			"<h5>"+user+"</h5>"+
    			"<div class='swiper' id='swiper-"+user+"'>"+
    			"<div class='swiper-wrapper'>"+
    			"</div><div class='swiper-pagination'></div>"+
    			"<div class='swiper-scrollbar'></div></div></div>"
    		);
    		for(let i=0; i<list.length; i++){
    			$('#swiper-'+user).children('.swiper-wrapper').append(
    				"<div class='swiper-slide'><div class='card'>"+
    				"<img class='card-img-top' src='"+list[i].url+"' style='width:100%'>"+
    				"<div class='card-body'><h6 class='card-text'>결제일시</h6>"+
    				"<div class='card-text pay-store'><h5 class='card-title'>"+list[i].storeName+"</h5></div>"+
    				"<div class='card-text pay-price'><h5>"+list[i].payment+"</h5></div>"+
    				"<h6>"+list[i].memo+"</h6></div></div></div>"
    			);
    		}
    		
    		var swiper = new Swiper("#swiper-"+user, {
    			slidesPerView: 2.7,
    	        spaceBetween: 10,
    	        grabCursor: true,
    	        navigation: {
    	          nextEl: ".swiper-button-next",
    	          prevEl: ".swiper-button-prev",
    	        },
    	        breakpoints: {
    	            // when window width is >= 0px
    	            0: { slidesPerView: 1.2, spaceBetween: 10 },
    	            720: { slidesPerView: 2.2, },
    	            1200: { slidesPerView: 2.5, }
    	        },
    	        scrollbar: {
    	            el: ".swiper-scrollbar",
    	            draggable: true,
    	        }
    		});
    	}
    }
})
	
</script>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navTitle" value="마이페이지" />
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row" id="fisrt-row">
			<div class="col-8">
				<div id="accountPlace">
					<p><img id="bnkIcon" src="/img/bank_db.png"> 부산은행 계좌번호</p>
					<p id="accountPrice">9,999,999원</p>
				</div>
			</div>
			<div class="col-4">
				<div id="charPlace" class="charPlace small">
					<img class="charIamge" src="/img/char.png" data-toggle="modal" data-target="#editModal">
				</div>
				<div id="charPlace" class="charPlace large">
					<img class="charIamge" src="/img/char.png" data-toggle="modal" data-target="#editModal">
				</div>
			</div>
		</div>
		<div class="row" id="second-row">
			<button type="button" class="button1">충전</button>
			<button type="button" class="button2">결제</button>
			<button type="button" class="button3">정보 수정</button>
		</div>
		<div class="row" id="third-row">
			
		</div>
		
		<!-- Slider main container -->
		<div class="swiper mySwiper">
		  <!-- Additional required wrapper -->
		  <div class="swiper-wrapper">
		    <!-- Slides -->
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름1</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름2</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름3</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름4</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>			
		  </div>
		  <!-- If we need pagination -->
		  <div class="swiper-pagination"></div>
		
		  <!-- If we need scrollbar -->
		  <div class="swiper-scrollbar"></div>
		</div>
		
		<div class="row" id="fourth-row">
			<div class="col-12">
				<div id="myPlace">
					<p>나의 플레이스 (찜 목록)</p>
				</div>
			</div>
		</div>
		<div class="space100"></div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="editModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">캐릭터 선택하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" align="center">
					<div class="row">
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_01.png">
							<p>미스터 비</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_02.png">
							<p>엔젤케이</p>
						</div>
						<div class="col-6 mx-autoc">
							<img class="each-pic" src="/img/character_03.png">
							<p>바우 와우</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_04.png">
							<p>엔젤 엔</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_05.png">
							<p>G방울</p>
						</div>
						<div class="col-6 mx-auto">
							<img class="each-pic" src="/img/character_06.png">
							<p>토리</p>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="변경" class="btn btn-secondary charChangeOk" data-dismiss="modal"></input>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>