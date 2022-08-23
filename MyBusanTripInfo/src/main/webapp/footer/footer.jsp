<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
	footer{
		border: 2px dotted green;
		width: 100%;
		height: 100px;
		position: fixed;
		bottom: 0;
		background-color: white;
		transition: 0.3s;
	}
</style>
<script type="text/javascript">
	$(function() {
		let scrollNum = 0;
		window.addEventListener('scroll', function(){
			if(scrollNum<window.scrollY){
				$('footer').css("opacity", "0")
			}else{
				$('footer').css("opacity", "1")
			}
			scrollNum = window.scrollY
		})
	})
</script>
</head>
<body>
	<footer>
		<h2 align="center">footer</h2>
	</footer>
</body>
</html>