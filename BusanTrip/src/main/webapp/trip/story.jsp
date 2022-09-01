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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
<style type="text/css">
	/* all */
	card{
		box-sizing:border-box;
	}
	.storyTitle h4{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	/* container */
	.space100 {
		height:100px;
	}
	.container{
		width:80%;
		max-width:800px;
		margin: 20px auto;
	}
	#addbutton{
		background-color:transparent;
		border-color:transparent;
	}
	.card{
		margin:10px 0;
	}
	.card-body:hover{
		cursor:pointer;
		background-color:#f0c2c4;
	}
	/* modal */
	#membersearch{
		border-color:transparent;
		border-radius:2px;
	}
	/* responsive web */
	@media screen and (max-width: 575px) {
		.large {
		  display: none;
		}
	}
	@media screen and (min-width: 576px) {
		.small {
		  display: none;
		}
	}
</style>

<script>

$(function() {
	$('.modal-button').on('click', addStory)
	function addStory(){
		if(confirm("DB랑 연결해놔서 막 추가하면 안되는데도 스토리를 추가하시겠습니까?")) {
			var storyName = $('#storyname').val();
			var leaderId = '<%= (String)session.getAttribute("memberId") %>';
			// 지금은 한명만 받아오는데 프론트 구현되고 여러명 받아도록 바꿔야 함
			var memberId = $('#newmember').val();
			console.log("storyName:: " + storyName + ", leaderId:: " + leaderId + ", memberId:: " + memberId);
			
			$.ajax({
				type: 'post',
				url: '/story/addStory',
				data: {'storyName':storyName, 'memberId': leaderId},
				
				success:function(result) {
					console.log(result);
					
					$.ajax({
						type: 'post',
						url: '/story/addStoryMember',
						data: {'storyId':result, 'memberId': memberId},
						
						success:function(result) {
							alert("스토리 추가 성공!")
							$('#storyname').val("")
							$('#newmember').val("");
							console.log(result)
						},
						error: function(e){
							console.log(e);
						}
					})
				},
				error: function(e){
					console.log(e);
				}
			});
		}
		
		

	}

});

</script>

</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navTitle" value="여행"/>
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row">
			<div class="storyTitle col-6">
				<h4>스토리</h4>
			</div>
			<div class="col-6" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#53565A" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
					  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
					</svg>
				</button>
			</div>
			<div class="col-12">
				<div class="card">
					<div class="card-body" onclick="location.href='/bnk/trip/3'">
						<h5 class="card-title">First Story</h5>
						<p class="card-text">My Story</p>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body" onclick="location.href='/bnk/trip/3'">
						<h5 class="card-title">Second Story</h5>
						<p class="card-text">Story with xxx</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	 <div class="modal fade" id="storyModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">스토리 생성하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
	       		<p>스토리 이름 : <input type="text" id="storyname" size="18"></p>
	       		<p>
	       			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#53565A" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
					  <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
					  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					</svg>
	       			<input type="text" id="newmember" placeholder="추가할 멤버 아이디 검색하기" size="23">
	       			<button type="button" class="button btn-primary" id="membersearch" data-toggle="collapse" data-target="#memberresult">
		       			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-search" viewBox="0 0 16 16">
						  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
	       		</p>
	       		<p>
	       			<div id="memberresult" class="collapse">
	       				일치하지 않는 경우 : 일치하는 아이디가 존재하지 않습니다.
	       				일치하는 경우 : 일치하는 아이디 (이름)
	       				<ul>
	       					<li>아이디 비번</li>
	       				</ul>
	       			</div>
	       		</p>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>