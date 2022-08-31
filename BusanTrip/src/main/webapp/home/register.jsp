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
		min-height: 60vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	    position: relative;
	}
	
	.register-box {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		height: 200px;
		position: relative;
		border-radius: 10px;
		border: 2px solid var(--bnk-gray);
	}
	
	.register-box-inner {
		max-width: 300px;
		margin: 5px auto;
		text-align: center;
		display: flex;
		justify-content: space-around;
	}
	
	.inner-text {
		font-size: 15px;
		margin: 0 5px;
		width: 140px;
	}
	
	.form-box {
		width: 160px;
		margin: 0 5px;
		font-size: 13px;
	}
	
	#checkDuple {
		width: 100%;
		text-align: right;
		font-size: 12px;
	}
	
	.form-register {
		width: 100%;
		margin: 0 5px;
		font-weight: bold;
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}

</style>

<script>
	
</script>

</head>
<body> 
	<div>
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
						<form method="post" name="registerData" action="register.do">
						<%-- register.do로 요청. registerData라는 이름으로 요청 --%>
						
							<div class="register-box-inner">
								<div class="inner-text">아이디: </div>
								<input type="text" name="id" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div id="checkDuple" class="inner-text">아이디를 입력해주세요</div>
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">비밀번호: </div>
								<input type="password" name="pw" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">전화번호: </div>
								<input type="text" name="tel" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<div class="inner-text">주소: </div>
								<input type="text" name="addr" class="form-box" required="required">
							</div>
							
							<div class="register-box-inner">
								<input type="submit" class="form-register" value="회원가입">
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