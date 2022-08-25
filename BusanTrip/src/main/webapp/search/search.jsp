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
.index{
	min-height: 100vh;
    width: 100%;
    margin-top:100px;
    padding-top: 30px;
    padding-bottom: 30px;
}

p{
	margin-top: 100px;
}

.home-top, .home-middle, .home-bottom {
	max-width: 400px;
	margin: 0 auto;
	text-align: center;
	position: relative;
}

.home-middle, .home-bottom{
	margin-top: 15px;
}

.home-top {
	height: 180px;
}

.home-middle {
	height: 180px;
}

.home-bottom {
	height: 180px;
}


	
	
</style>

</head>
<body>
	<div>
		<c:import url="../header/nav.jsp">
			<c:param name="navSubTitle" value="조회222"/>
		</c:import>
		
		<div class="index container">
			
			<div class="rounded-lg border border-danger home-top">
				sample
			</div>

			
		</div>
		
		<c:import url="../footer/footer.jsp" />
	</div>
</body>
</body>
</html>