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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">

	:root {
	  --bnk-red: #E60000;
	  --bnk-dark-red: #BE0000;
	  --bnk-gray: #545443;
	  --bnk-grey: #545443;
	  --bnk-lightgray: #B3B38F;
	  --bnk-lightgrey: #B3B38F;
	}
	
	.index{
		border: 5px dotted red;
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
		height: 200px;
		position: relative;
	}
	
	.searchDetail-lower {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		min-height: 10vh;
		height: 80px;
		position: relative;
	}
	
	.searchDetail-lower-box {
		margin: 10px auto;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}

</style>
</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="index container">
			
			<div class="rounded-lg border border-danger searchDetail-upper">
				<div class="ud-center">
					<div class="rounded-lg border border-danger">
						<span class="border border-primary">계좌번호</span>
						<span class="border border-primary">금액</span>
					</div>
					<div class="rounded-lg border border-danger">
						<span class="border border-primary">기간 조회</span>
					</div>
					<div class="rounded-lg border border-danger">
						<span class="border border-primary searchDetail-period-box" value="1">1개월</span>
						<span class="border border-primary searchDetail-period-box" value="3">3개월</span>
						<span class="border border-primary searchDetail-period-box" value="6">6개월</span>
						<span class="border border-primary searchDetail-period-box" value="12">1년</span>
					</div>
				</div>
			</div>
			
			<div class="rounded-lg border border-danger searchDetail-lower">
				<div class="ud-center">
					<div class="rounded-lg border border-danger searchDetail-lower-box">
						<span class="border border-primary">결제일시</span>
						<span class="border border-primary">가게이름</span>
						<img class="border border-primary">
						<img class="border border-primary">
						<span class="border border-primary">결제금액</span>
					</div>
					<div class="rounded-lg border border-danger searchDetail-lower-box">
						<span class="border border-primary">결제일시</span>
						<span class="border border-primary">가게이름</span>
						<img class="border border-primary">
						<img class="border border-primary">
						<span class="border border-primary">결제금액</span>
					</div>
				</div>
			</div>

		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>