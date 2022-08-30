<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
	/* all */
	*{
		font-family: 'Trebuchet MS', sans-serif;
		box-sizing:border-box;
	}
	/* container */
	/*background:linear-gradient(90deg, #ffe6e6, #e6e6e6);*/
	.space100 {
		height:100px;
	}
	.container{
		width:80%;
		max-width:800px;
		margin: 20px auto;
	}
	.pay-store{
		width:50%;
		float:left;
	}
	.pay-price{
		width:50%;
		float:right;
	}
	.card-body>p{
		width:100%;
		float:left;
	}
	/* modal */
	#membersearch{
		border-color:transparent;
		border-radius:2px;
	}
	.mem-id, .mem-name{
		width:50%;
		text-align:justify;
	}
	/* customizebutton */
	#customizeButton{
		right:20px;
		bottom:100px;
		position:fixed;
	}
	.custom-button{
		border-radius:20px;
		border-width:2px;
		background-color:white;
		margin:2px 0;
	}
	.custom-button:hover{
		background-color:#cb333b;
		border-color:#cb333b;
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
</style>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navSubTitle" value="여행"/>
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row">
			<div class="col-12">
				<h4 align="center">ㅇㅇ여행</h4>
				<h6 align="center">2022.08.13 ~ 2022.08.15</h6>
				<p></p>
				<h5>사용자A</h5>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="card col-md-6">
				<img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
				<div class="card-body">
					<h6 class="card-text">결제일시</h6>
					<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
					<div class="pay-price"><h5><small>결제금액</small></h5></div>
					<p>메모 내용 들어갈 곳</p>
				</div>
			</div>
			<div class="card col-md-6">
				<img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
				<div class="card-body">
					<h6 class="card-text">결제일시</h6>
					<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
					<div class="pay-price"><h5><small>결제금액</small></h5></div>
					<p>메모 내용 들어갈 곳</p>
				</div>
			</div>
		</div>
		<div id="customizeButton">
			<div class="btn-group-vertical">
				<a href="#" data-toggle="tooltip" data-placement="left" title="사진 추가하기">
				<button type="button" class="btn btn-outline-secondary custom-button" data-toggle="modal" data-target="#pictureModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
					  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
					  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
					</svg>
				</button>
				</a>
				<a href="#" data-toggle="tooltip" data-placement="left" title="거래내역 추가하기">
				<button type="button" class="btn btn-outline-secondary custom-button" data-toggle="modal" data-target="#transactionModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
					</svg>
				</button>
				</a>
				<a href="#" data-toggle="tooltip" data-placement="left" title="멤버 조회">
				<button type="button" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#memberModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
					  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/><path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
					</svg>
				</button>
				</a>
			</div>
		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	<!--  사진 추가 modal -->
	 <div class="modal fade" id="pictureModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">사진 추가하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
				<input type="file" accept="image/png, image/jpeg" multiple>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
	  <!-- 거래 내역 추가 modal -->
	  <div class="modal fade" id="transactionModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">거래내역 추가하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
				거래내역 추가
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary" data-dismiss="modal"></input>
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
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body">
	     		<div class="col-6 mem-id">
					<p align="center">아이디</p>
					<p align="center">aaaaa</p>
					<p align="center">bbbbb</p>
					<p align="center">ccccc</p>
					<p align="center">ddddd</p>
				</div>
				<div class="col-6 mem-name">
					<p align="center">이름</p>
					<p align="center">에이에이</p>
					<p align="center">비비비</p>
					<p align="center">씨씨씨</p>
					<p align="center">디디디</p>
				</div> 
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="확인" class="btn btn-secondary" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>