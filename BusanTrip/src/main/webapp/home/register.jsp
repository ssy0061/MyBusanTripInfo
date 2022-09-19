<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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
	  --button-hover: #F5F5F5;
	  --button-active: #EEEEEE;
	}
	
	.content{
/* 		min-height: 66.5vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px; */
	    position: relative;
	}
	
	.register-box {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		height: 340px;
		position: relative;
		border-radius: 10px;
		box-shadow:2px 3px 5px 2px lightGray;
	}
	
	.register-box-inner {
		max-width: 300px;
		margin: 6px auto;
		text-align: center;
		display: flex;
		justify-content: space-around;
	}
	
	.inner-text {
		font-size: 16px;
		margin: 0 5px;
		width: 140px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	
	.inner-text-black { color: black; }
	.inner-text-red { color: #CB333B; }
	.inner-text-green { color: green; }
	
	.form-box, #birthday {
		width: 160px;
		margin: 0 5px;
		font-size: 13px;
	}
	
	#checkDuple, #checkPassword {
		width: 100%;
		text-align: right;
		font-size: 12px;
	}
	
	/*#checkBday{
		font-size:12px;
		padding:0;
		width:30px;
	}*/
	
	.register-gender>div{
		width:110px;
	}
	
	#joinbutton {
		width: 100%;
		margin: 0 5px;
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
	#joinbutton:hover{
		background-color: #CB333B;
	    color: white;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* 상단바 70*/
			padding-bottom: 80px;/* 하단바 80 */
			min-height: calc(100vh - 80px);
		}
		.ud-center{
			padding: 0 10px;
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 90px); /* 상단바 90px */
	    	padding: 20px 0;
		}
		.backImg{ /* web backgorund */
			background-image: url("/img/back-login7.jpg");
			background-size: 1920px 100%;
			background-repeat: no-repeat;
		}
		.register-box{
			box-shadow:2px 3px 15px 2px white;
			background-color: transparent;
			background-color: rgba( 255, 255, 255, 0.65 )
		}
	}
	/* 상하단 바를 위한 필수 css */
</style>

<script>

	$(function(){
		var isValidId = false;
		var isValidPw = false;
		
		$('#idForm').on('keyup', function() {
			let idVal = $(this).val();
			isValidId = false;
			
			if (idVal == "") {  // 공백 시
				$('#checkDuple').text('아이디를 입력해주세요.');
				$('#checkDuple').attr('class', 'inner-text inner-text-black');
			} else if ((idVal.length < 5) || (idVal.length > 30)) {  // 글자 위반
				$('#checkDuple').text('5자 ~ 30자로 아이디를 입력해주세요.');
				$('#checkDuple').attr('class', 'inner-text inner-text-red');
			} else {
				// id 유무 check
				$.ajax({
					type: 'post',
					url: '/member/findIdExist',
					data: {'memberId': idVal},
					success: function(result) {
						if (result) {  // 중복 시
							$('#checkDuple').text('다른 아이디를 사용해주세요.');
							$('#checkDuple').attr('class', 'inner-text inner-text-red');
						} else {  // ok
							$('#checkDuple').text('아이디로 사용가능합니다!');
							$('#checkDuple').attr('class', 'inner-text inner-text-green');
							isValidId = true;
						}
					},
					error: function(e){ console.log(e); }
				});  // findIdExist end
			}
		});  // id on-keyup
		
		$('#pwForm').on('keyup', function() {
			let pwVal = $(this).val();
			isValidPw = false;
			
			if (pwVal == "") {  // 공백 시
				$('#checkPassword').text('아이디를 입력해주세요.');
				$('#checkPassword').attr('class', 'inner-text inner-text-black');
			} else if ((pwVal.length < 7) || (pwVal.length > 30)) {  // 글자 위반
				$('#checkPassword').text('7자 ~ 30자로 비밀번호를 입력해주세요.');
				$('#checkPassword').attr('class', 'inner-text inner-text-red');
			} else {  // ok
				$('#checkPassword').text('비밀번호로 사용가능합니다!');
				$('#checkPassword').attr('class', 'inner-text inner-text-green');
				isValidPw = true;
			}
		});  // pw on-keyup
		
		
		$(':submit').click(function() {
			if (!isValidId || !isValidPw) return false;
			let birthday = document.getElementById("birthday").value;
			console.log(birthday)
		});  // submit button
		
	});  // JQuery
	
</script>

</head>
<body> 
	<div class="backImg">
		<c:import url="/header/nav.jsp">
			<%-- param 없으면 home log 출력--%>
			<%-- <c:param name="navTitle" value="주요기능"/> --%>
			<%-- <c:param name="navSubTitle" value="상세기능"/> --%>
			<c:param name="navSubTitle" value="회원가입"/>
		</c:import>
		
		<div class="content container">
			<div class="ud-center">
				<div class="register-box">
					<div class="ud-center">
						<form method="post" name="registerData" action="/member/join">
						<%-- register.do로 요청. registerData라는 이름으로 요청 --%>
							<div class="register-box-inner">
								<div class="inner-text">아이디 : </div>
								<input id="idForm" type="text" name="memberId" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div id="checkDuple" class="inner-text inner-text-red">아이디를 입력해주세요.</div>
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">비밀번호 : </div>
								<input id="pwForm" type="password" name="memberPw" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div id="checkPassword" class="inner-text inner-text-red">비밀번호를 입력해주세요.</div>
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">이름 : </div>
								<input type="text" name="memberName" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<label for="birthday" class="inner-text">생년월일 : </label>
								<input type="date" id="birthday">
								<%-- <input id="checkBday" type="submit" value="확인"> --%>
							</div>
							
							<div class="register-box-inner register-gender">
								<div class="inner-text">성별 : </div>
								<input type="radio" id="male" value="male"><label for="male">남</label>
								<input type="radio" id="female" value="female"><label for="female">여</label>
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">전화번호 : </div>
								<input type="text" name="memberTele" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">주소 : </div>
								<input type="text" name="memberAddr" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<input type="submit" class="form-register" id="joinbutton" value="회원가입">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="/footer/footer.jsp" />
	</div>
</body>
</body>
</html>