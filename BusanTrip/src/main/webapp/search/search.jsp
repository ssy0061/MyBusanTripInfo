<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search page</title>
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

	/* 상하단 바를 위한 필수 css */
	.content{
	    margin-top: 90px;
	    padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* 상단바 70*/
			padding-bottom: 80px;
			background-color: #fef0f0;
			min-height: calc(100vh - 70px);
		}
		.search-box{
			padding-top: 10px;
			padding-bottom: 10px;
			background-color: #fef0f0;
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 90px);
		}
		.search-box{
			padding-top: 50px;
			padding-bottom: 50px;
			min-height: calc(100vh - 170px);
			background-color: rgba( 255, 255, 255, 0.6 );
		}
		.backImg { /* web backgorund */
			background-image:
				linear-gradient(rgba(256, 256, 256, 0.3), rgba(256, 256, 256, 0.3)),
				url("/img/back-login5.jpg");
			background-size: cover;
			background-repeat: no-repeat;
		}
	}
	/* 상하단 바를 위한 필수 css */
	
	.search-box {
		max-width: 720px;
		margin: 0 auto;
		text-align: center;
		border-radius: 10px;
	}
	
	.search-box-inner {
		max-width: 500px;
		width: 85%;
		margin: 0 auto 15px;
		height: 100px;
		/* position: relative; */
		background-color: white;
		padding-top: 10px;
	}
	.search-box-inner:hover {
	    background-color: var(--button-hover);
	    cursor: pointer;
	}
	
	.search-box-inner:active {
	    background-color: var(--button-active);
	}
	
	.search-box-inner-upper {
		height: auto;
		text-align: left;
	}
	.upper-title{
		display: inline-flex;
		text-align: left;
		flex-direction: column;
		padding-left: 10px;
	}
	
	.search-box-inner-lower {
		display: flex;
		justify-content: flex-end;
	}
	
	.ud-center {
		width: 100%;
		/* position: absolute;
		left: 50%; top: 50%;
		transform: translate(-50%, -50%); */
		padding: 20px auto;
	}
	
	.bankIcon{
		position: relative;
		left: 10px;
		width: 32px;
		height: 32px;
		margin: 0 10px 0 0;
	}
	
	.bankName {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	.accountNumber {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		color: gray;
	}
	
	.amount {
		max-width: 160px;
		width: 100%;
		font-size: 22px;
		text-align: right;
		position: relative;
		right: 10px;
		font-weight: bold;
	}

</style>


<script>

	$(function() {
		$('#searchBox').on('click', '.search-box-inner', function(){
			let accountNumber = $(this).attr('id');
			// id값을 이용해서 페이지 이동. Post 방식.
			let tempForm = document.createElement('form');
		    tempForm.setAttribute('method', 'post');
		    tempForm.setAttribute('action', '/bnk/search');
		
			var data = document.createElement('input');
			data.setAttribute('type', 'text');
			data.setAttribute('name', 'accountNumber');
			data.setAttribute('value', accountNumber);
			
			tempForm.appendChild(data);
			tempForm.setAttribute('accountNumber', accountNumber);
		    document.body.appendChild(tempForm);
		    tempForm.submit();
		});  // div click
		
		var memberId = '<%= (String)session.getAttribute("memberId")%>';
		/* console.log(memberId) */
		$.ajax({
			type: 'post',
			url: '/member/findAllAccount',
			data: {'memberId': memberId},
			
			success:function(result) {
				/* console.log(result) */
				for (var i=0; i<result.length; i++) {
					let accountBank = result[i].accountBank;
					let icon = "/img/bank_bnk.png" /* 부산은행 or 경남은행 */
					let accountNumber = result[i].accountNumber;
					let accountBalance = result[i].accountBalance;
					let id = result[i].id;
					
					accountBalance = accountBalance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  + " 원"
					var goTo = '#account'
					if(accountBank === '포인트') {
						goTo = '#point';
						icon = "/img/bank_db.png";
					}
					$(goTo).append(
						'<div id="'+accountNumber+'" class="rounded-lg shadow bg-white search-box-inner">'+
						'<div class="ud-center">'+
						
						'<div class="search-box-inner-upper">'+
						'<img class="bankIcon" src="'+icon+'">'+
						'<div class="upper-title">'+
						'<div class="bankName">'+accountBank+'</div>'+
						'<div class="accountNumber">'+accountNumber+'</div></div></div>'+
						
						'<div class="search-box-inner-lower">'+
						'<span class="amount">'+accountBalance+'</span>'+
						'</div></div></div>'
					);
				}  // Initial
			},
			error: function(e){
				console.log(e);
			}
		})
	});  // JQuery
	
</script>

</head>
<body>
	<div class="backImg">
		<c:import url="/header/nav.jsp">
			<c:param name="navTitle" value="계좌"/>
		</c:import>
			
		<div class="content container">
			<div id="searchBox" class="search-box">
				<div id="point">
				
				</div>
				<div id="account">
				
				</div>
			</div>
		</div>
		
		<c:import url="/footer/footer.jsp" />
	</div>
</body>
</html>