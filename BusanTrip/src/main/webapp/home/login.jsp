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
		height: 50vh;
	    width: 100%;
	    margin: 100px auto;
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
	}

</style>
</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="index container">
			
			<div class="ud-center">
				<div class="rounded-lg border border-danger login-box">
					<div class="ud-center">
						<form method="post" name="loginData" action="login.do">
						<%-- 일단, login.do로 요청을 보내고 loginData라는 이름으로 요청 --%>
						
							<div class="rounded-lg border border-danger login-box-inner">
								아이디
							</div>
							
							<div class="rounded-lg border border-danger login-box-inner">
								비밀번호
							</div>
							
							<div class="rounded-lg border border-danger login-box-inner">
								버튼
							</div>
							
						</form>
					</div>
				</div>
			</div>

		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>