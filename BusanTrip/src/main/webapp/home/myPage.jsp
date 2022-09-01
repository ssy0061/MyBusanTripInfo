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
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	div{
        justify-content: center;
        align-items: center;
	}
	.space100 {
		height:100px;
	}
	.container{
		width:80%;
		max-width:800px;
	}
	#accountPlace, #charPlace, #whichPlace, #myPlace{
		margin-top:20px;
		width:100%;
		height:150px;
		background-color:gray;
		border-radius:5px;
	}
	#chargePlace, #payPlace, #sendPlace, #editPlace{
		margin-top:20px;
		width:100%;
		height:50px;
		background-color:gray;
		border-radius:5px;
	}
</style>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navTitle" value="마이페이지" />
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row">
			<div class="col-8">
				<div id="accountPlace">
					<p>부산은행 계좌번호</p>
					<p>금액</p>
				</div>
			</div>
			<div class="col-4">
				<div id="charPlace">
					<p>캐릭터 선택</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-3">
				<div id="chargePlace">
					<p>충전</p>
				</div>
			</div>
			<div class="col-3">
				<div id="payPlace">
					<p>결제</p>
				</div>
			</div>
			<div class="col-3">
				<div id="sendPlace">
					<p>송금</p>
				</div>
			</div>
			<div class="col-3">
				<div id="editPlace">
					<p>정보 수정</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div id="whichPlace">
					<p>무엇을 넣을지...?</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div id="myPlace">
					<p>나의 플레이스 (찜 목록)</p>
				</div>
			</div>
		</div>
		<div class="space100"></div>
	</div>
	<c:import url="/footer/footer.jsp" />
</body>
</html>