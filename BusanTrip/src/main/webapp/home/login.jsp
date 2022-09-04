<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
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
	}
	
	.index{
		height: 60vh;
	    width: 100%;
	    margin: 100px auto 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	    position: relative;
	}
	
	.login-box {
		max-width: 400px;
		margin: 0 auto;
		text-align: center;
		height: 150px;
		position: relative;
		border-radius: 10px;
		border: 2px solid var(--bnk-gray);
	}
	
	.ud-center {
		width: 100%;
		position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.login-box-inner {
		max-width: 300px;
		margin: 10px auto;
		text-align: center;
		display: flex;
		justify-content: space-around;
	}
	
	.inner-text {
		font-size: 20px;
		margin: 0 5px;
		width: 140px;
	}
	
	.form-box {
		width: 160px;
		margin: 0 5px;
	}
	
	.form-login {
		width: 100%;
		margin: 0 5px;
		font-weight: bold;
	}
	
</style>

<script>
	
	$(function() {
		
		$(':button').click(function() {
			location.href = "./register";
		});  // register click
		
	});  // JQuery
	
</script>

</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="로그인"/>
		</c:import>
		
		<div class="index container">
			
			<div class="ud-center">
				<div class="login-box">
					<div class="ud-center">
						<form method="post" name="loginData" action="/member/login">
						<%-- 일단, login.do로 요청을 보내고 loginData라는 이름으로 요청 --%>
						
							<div class="login-box-inner">
								<div class="inner-text">아이디: </div>
								<input type="text" name="id" class="form-box" required="required">
							</div>
							
							<div class="login-box-inner">
								<div class="inner-text">비밀번호: </div>
								<input type="password" name="pw" class="form-box" required="required">
							</div>
							
							<div class="login-box-inner">
								<input type="submit" class="form-login" value="로그인">
								<input type="button" class="form-login" value="회원가입">
							</div>
							
						</form>
					</div>
				</div>
			</div>

		</div>
		
		<%-- <c:import url="/footer/footer.jsp" /> --%>
	</div>
</body>
</body>
</html>