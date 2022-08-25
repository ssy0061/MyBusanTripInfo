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
    margin: 100px auto;
    padding-top: 10px;
    padding-bottom: 10px;
}

.search-box {
	max-width: 400px;
	margin: 0 auto;
	text-align: center;
	min-height: 10vh;
}

.search-box-inner {
	max-width: 300px;
	margin: 15px auto;
	height: 80px;
	position: relative;
	border: 4px outset var(--bnk-lightgray);
}

.search-box-inner-upper {
	height: auto;
	text-align: left;
}

.search-box-inner-lower {
	display: flex;
	justify-content: space-around;
}

.ud-center {
	width: 100%;
	position: absolute;
	left: 50%; top: 50%;
	transform: translate(-50%, -50%);
}

#bankIcon, #bankName {
	position: relative;
	left: 10px;
}

#bankIcon {
	width: 25px;
	height: 25px;
	border-radius: 10px;
	border: 1px solid var(--bnk-dark-red);
}

#bankName {
	margin: 10px 0;
}

#accountNumber {
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

#amount {
	max-width: 160px;
	width: 100%;
	font-size: 22px;
	text-align: right;
	position: relative;
	right: 5px;
	font-weight: bold;
}



	
	
</style>

</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="index container">
			
			<div class="rounded-lg border border-danger search-box">
			
				<div class="rounded-lg shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class="search-box-inner-upper">
							<img id="bankIcon" src="./img/bank_icon.png">
							<span id="bankName">은행명칭</span>
						</div>
						<div class="search-box-inner-lower">
							<span id="accountNumber">XXX-XXXXXX-XX-XXX</span>
							<span id="amount">0,000,000원</span>
						</div>
					</div>
				</div>
				
				<div class="rounded-lg shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class="search-box-inner-upper">
							<img id="bankIcon" src="./img/bank_icon.png">
							<span id="bankName">은행명칭</span>
						</div>
						<div class="search-box-inner-lower">
							<span id="accountNumber">XXX-XXXXXX-XX-XXX</span>
							<span id="amount">0,000,000원</span>
						</div>
					</div>
				</div>
				
				<div class="rounded-lg shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class="search-box-inner-upper">
							<img id="bankIcon" src="./img/bank_icon.png">
							<span id="bankName">은행명칭</span>
						</div>
						<div class="search-box-inner-lower">
							<span id="accountNumber">XXX-XXXXXX-XX-XXX</span>
							<span id="amount">0,000,000원</span>
						</div>
					</div>
				</div>
				
				<div class="rounded-lg shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class="search-box-inner-upper">
							<img id="bankIcon" src="./img/bank_icon.png">
							<span id="bankName">은행명칭</span>
						</div>
						<div class="search-box-inner-lower">
							<span id="accountNumber">XXX-XXXXXX-XX-XXX</span>
							<span id="amount">0,000,000원</span>
						</div>
					</div>
				</div>
				
				<div class="rounded-lg shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class="search-box-inner-upper">
							<img id="bankIcon" src="./img/bank_icon.png">
							<span id="bankName">은행명칭</span>
						</div>
						<div class="search-box-inner-lower">
							<span id="accountNumber">XXX-XXXXXX-XX-XXX</span>
							<span id="amount">0,000,000원</span>
						</div>
					</div>
				</div>
				
				
			</div>

			
		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>