<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
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
	.add-button{
		border-color:transparent;
		background-color:transparent;
	}
	.add-picture, .add-transaction{
		width:200px;
		border-radius:10px;
		border-style:solid;
		border-color:silver;
		display: flex;
        justify-content: center;
        align-items: center;
		margin:10px auto;
		padding:15px 0;
	}
	.add-picture:hover{
		cursor:pointer;
		background-color:lightgray;
	}
	.add-transaction:hover{
		cursor:pointer;
		background-color:lightgray;
	}
	 .each-picture{
		/*background-image:url("https://www.visitbusan.net/uploadImgs/files/cntnts/20191209162810545_thumbL");*/
		background-color:gray;
		background-repeat: no-repeat;
		background-size:100% 100%;
		background-position: center;
		border-radius:10px;
		margin:10px 10px;
	}
	.each-picture>img{
		width:100%;
		min-width:100%;
		height:auto;
	}
	/* modal */
	#membersearch{
		border-color:transparent;
		border-radius:2px;
	}
	.mem-id, .mem-name{
		float:left;
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
			</div>
		</div>
		<!-- <div class="row">
			<div class="col-12">
				<div class="add-picture"  data-toggle="modal" data-target="#pictureModal">
					<button type="button" class="add-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#53565A" class="bi bi-camera-fill" viewBox="0 0 16 16">
						  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
						  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
						</svg>
					</button>
				</div>
			</div>
		</div> -->
		<div class="row d-flex justify-content-center">
			<div class="col-5 each-picture" id="eachPic">
			</div>
			<div class="col-5 each-picture" id="eachPic">
			</div>
			<div class="col-5 each-picture" id="eachPic">
				<img alt="이미지 들어갈 자리 확보" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL">
			</div>
			<div class="col-5 each-picture" id="eachPic">
				<img alt="이미지 들어갈 자리 확보" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191217101816206_thumbL">
			</div>
			<div class="col-5 each-picture" id="eachPic">
				<img alt="이미지 들어갈 자리 확보" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191217113924538_thumbL">
			</div>
			<div class="col-12" align="center">
				거래내역 넣을 공간
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
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
						  <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
						  <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
						  <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
						</svg>
				</button>
				</a>
				<a href="#" data-toggle="tooltip" data-placement="left" title="타임라인">
				<button type="button" class="btn btn-outline-secondary custom-button">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2-check-fill" viewBox="0 0 16 16">
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5zm-2.6 5.854a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
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
				<input type="file" accept="image/png, image/jpeg">
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