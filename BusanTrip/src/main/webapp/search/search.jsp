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
			
			<div class="rounded-lg border border-danger search-box">
			
				<div class="rounded-lg border border-danger shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
					</div>
				</div>
				
				<div class="rounded-lg border border-danger shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
					</div>
				</div>
				
				<div class="rounded-lg border border-danger shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
					</div>
				</div>
				
				<div class="rounded-lg border border-danger shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
					</div>
				</div>
				
				<div class="rounded-lg border border-danger shadow bg-white search-box-inner">
					<div class="ud-center">
						<div class = "rounded-lg border border-danger">
							Sample text
						</div>
						<div class = "rounded-lg border border-danger">
							Sample text
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