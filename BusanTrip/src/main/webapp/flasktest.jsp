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
		
		function getCategory(userData) { /* model 결과 요청 */
			$.ajax({
				type: 'post',
				url: 'http://127.0.0.1:8888/api/ai/data',
				headers: {'Content-Type': 'application/json'},
				crossDomain: true,
				data: JSON.stringify(userData),
				success:function(result) {
					/* result.data == 카페 */
					$(':text').val("")
					$('#lst').append('<li>'+result.data+'</li>')
					$()
				},
				error: function(e){
					console.log(e);
				}
			})
		}
		var memberId = '<%= (String)session.getAttribute("memberId")%>';
		console.log(memberId)
		$(':button').click(function() {
			$.ajax({
				type: 'post',
				url: '/member/findInputDataToML',
				data: {'memberId': memberId},
				success:function(result) {
					if (result.length === 0) {
						console.log('거래내역 없음')
						return
					}
					// console.log(memberId)
					userInfo = result[0]
					console.log('userInfo')
					console.log(userInfo)
					
					userData = { /* 샘플 데이터 */
							'gender': '여',
							'ages': '40',
							'amount': '1169000',
							'cnt': '37',
							'avg_amount': '31594.595',
							'max_amount': '138700',
							'min_amount': '28000'
					}
					userData = {
							'gender': userInfo.MEMBER_GENDER,
							'ages': userInfo.MEMBER_AGE,
							'amount': userInfo.TOTAL_AMT,
							'cnt': userInfo.TRANSACTION_COUNT,
							'avg_amount': userInfo.AVG_AMT,
							'max_amount': userInfo.MAX_AMT,
							'min_amount': userInfo.MIN_AMT
					}
					/* model 결과 요청 */
					getCategory(userData)
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