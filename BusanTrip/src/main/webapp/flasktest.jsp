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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<script>

	$(function() {
		$(':button').click(function() {
			$.ajax({
				type: 'post',
				url: 'http://127.0.0.1:8888/test/data',
				data: {'data': $('#data').val()},
				success:function(result) {
					$(':text').val("")
					$('#lst').append('<li>'+result.data+'</li>')
				},
				error: function(e){
					console.log(e);
				}
			})
		})
		
	})
</script>
</head>
<body class=container>
	<h3>flask test</h3>
	<input type="text" name="data" id="data">
	<input type="button" value="TEST">
	<ul id="lst">
	</ul>
	
</body>
</html>