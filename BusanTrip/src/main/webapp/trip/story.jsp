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
		border-style:solid;
		border-width:2px;
		border-color:#53565A;
		border-radius:5px;
	}
	#addbutton:hover{
		color:white;
		background-color:#53565A;
	}
	.card{
		margin:10px 0;
	}
	.card-body:hover{
		cursor:pointer;
		background-color:#f0c2c4;
	}
	.deleteStory{
		background-color:transparent;
		border-color:transparent;
	}
	/* modal */
	#membersearch{
		border-color:transparent;
		border-radius:2px;
	}
	.deleteStoryYes{
		display:inline-block;
		padding:4px 10px;
		cursor:pointer;
		font-size:inherit;
		color:white;
		text-align:center;
		vertical-align:middle;
		border-radius:10px;
		border-color:transparent;
		background-color:#F08080;
		box-shadow: 0 3px 3px 0 #53565A;
	}
	.deleteStoryNo{
		display:inline-block;
		padding:4px 10px;
		margin:0 5px;
		cursor:pointer;
		font-size:inherit;
		color:white;
		text-align:center;
		vertical-align:middle;
		border-radius:10px;
		border-color:transparent;
		background-color:#6c9dc6;
		box-shadow: 0 3px 3px 0 #53565A;
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
	.card-body{
		position: relative;
	}
	.deleteStory{
		position: absolute;
		top: 2px;
		right: 5px;
		font-size: 1.5rem;
		text-align: center;
		border-radius: 30px;
		
	}
	.deleteStory:hover{
		 /*  box-shadow: 3px 3px 3px 3px gray; */
		 background-color: 	#f5f5f5;
	}
</style>

<script>

$(function() {
	
	var currentMemberId = '<%= (String)session.getAttribute("memberId") %>';
	var memberList = [];
	var storyList = [];
	var cardTitle = "cardTitle";
	var cardText = "cardText";
	
	//console.log("currentMemberId:: " + currentMemberId);
	
	$.ajax({
		type: 'post',
		url: '/story/findAllStory',
		data: {'memberId': currentMemberId},
		
		success:function(result) {
			//console.log("storyList :: " + result);
			
			var storyId;
			for(var i=0; i<result.length; i++) {
				storyId = result[i].storyId;
				cardTitle = result[i].storyName;
				//console.log("storyId:: " + storyId + " storyName:: " + cardTitle);
				
				 $('.col-12').append(
					"<div id="+"\'"+ storyId +"\'"+" class=card>"
						+"<div class=card-body onclick=location.href="+"\'/bnk/trip/"+ storyId +"\'>"
							+"<h5 class=card-title>"+ cardTitle+"</h5>"
							+"<p class=card-text>"+ cardText +"</p></div>"
						+'<button type=\"button\" class=deleteStory data-toggle=\"modal\" data-target=\"#deleteStoryModal\"><i class="bi bi-x-lg"></i></button>'
					+"</div>"
				) 
			} 
		},
		error:function(e) {
			console.log(e);
		}
		
	});
	
	
	$('#membersearch').click(function(){
		addMember();
	});
	$('#closebutton').click(function(){
		$('#statusmember').text("");
		$('#statusmessage').append("함께할 친구의 ID를 입력하세요.");
		//$('#newmember').setAttribute('value','');
		var searchmember = document.getElementById('newmember');
		searchmember.value="";
		//$('#newmember').setAttribute('placeholder','추가할 멤버 아이디 검색하기');
	})
	function addMember() {
		var memberId = $('#newmember').val();
		
		$.ajax({
			type: 'post',
			url: '/story/findIdExist',
			data: {'memberId':memberId},
			
			success:function(result) {
				if(result){
					var flag = 0;
					for(var i=0; i<memberList.length; i++) {
						if(memberList[i] == memberId){
							$('#statusmessage').text("이미 추가된 사용자");
							flag = 1;
							break;
						} 
					}
					if(flag == 0) {
						memberList.push(memberId);
						$('#statusmember').append('<p class="mb-0">'+memberId+'</p>');
						$('#statusmessage').text("");
					}
				}
				else {
					if(memberId != ""){
						$('#statusmessage').text("존재하지 않는 사용자"); 
					}
						
				}
				$("#membersearch").slideDown();
				console.log(result);
			},
			error:function(e) {
				console.log(e);
			}
		});
		
	}
	
	$('.modal-button').on('click', addStory)
	function addStory(){
		if(confirm("DB랑 연결해놔서 막 추가하면 안되는데도 스토리를 추가하시겠습니까?")) {
			var storyName = $('#storyname').val();
			//console.log("storyName:: " + storyName + ", currentMemberId:: " + currentMemberId + ", memberList:: " + memberList);
			
			$.ajax({
				type: 'post',
				url: '/story/addStory',
				data: {'storyName':storyName, 'memberId': currentMemberId},
				
				success:function(result) {
					//console.log("result:: " + result+", memberList::" + memberList);
					
					$.ajax({
						type: 'post',
						url: '/story/addStoryMember',
						data: {'storyId':result, 'memberList': memberList},
						
						success:function(result2) {
							alert(result2+"명과 함께하는 머니앨범이 생성되었습니다.");
							$('#storyname').val("")
							$('#newmember').val("");
							console.log(result2)
							document.location.reload();	// 생성된 스토리 반영하기 위해 새로고침
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
	
	var deleteStoryId = "";
	$('.col-12').on("click", ".deleteStory",function(){
		deleteStoryId = $(this).parent().attr("id");
		console.log("deleteStoryId:: " + deleteStoryId)
	})
	

	
	$('.deleteStoryYes').click(function(){

		$.ajax({
			type: 'post',
			url: '/story/deleteStory',
			data: {'storyId': deleteStoryId},
			
			success: function(result) {
				alert("삭제되었습니다.");
				document.location.reload();	// 삭제된 스토리 반영하기 위해 새로고침
			},
			error: function(e) {
				console.log(e);
			}
		});
	})
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
				<h4>머니앨범</h4>
			</div>
			<div class="col-6" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<i class="bi bi-plus-lg" style="font-size: 1.2rem;"></i>
				</button>
			</div>
			<div class="col-12">
				<div id='story-1' class="card">
					<div class="card-body">
					<!-- <div class="card-body" onclick="location.href='/bnk/trip/3'"> -->
						<h5 class="card-title">First Story</h5>
						<p class="card-text">불러온거 아니고 직접 넣은 카드</p>
						<button type="button" class="deleteStory" data-toggle="modal" data-target="#deleteStoryModal"><i class="bi bi-x-lg"></i></button>
					</div>
				</div>
				<div id='story-2' class="card">
					<div class="card-body">
					<!-- <div class="card-body" onclick="location.href='/bnk/trip/3'"> -->
						<h5 class="card-title">Second Story
							<button type="button" class="deleteStory float-right" data-toggle="modal" data-target="#deleteStoryModal">&times;</button>
						</h5>
						<p class="card-text">직접 넣은 카드2</p>
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
	     		<h4 class="modal-title">머니앨범 생성하기</h4>
	     		<button type="button" id="closebutton" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
	       		<p>머니앨범 이름 : <input type="text" id="storyname" size="18"></p>
	       		<p>
	       			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#53565A" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
					  <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
					  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					</svg>
	       			<input type="text" id="newmember" placeholder="추가할 멤버 아이디 검색하기" size="23">
	       			<button type="button" class="button btn-primary" id="membersearch">
		       			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-search" viewBox="0 0 16 16">
						  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
	       		</p>
	       		<p>
	       			<div id="memberresult">
	       				<div id="statusmessage" style="color:red">
		       				함께할 친구의 ID를 입력하세요.
		       			</div>
	       				<div id="statusmember">
	       				</div>
	       			</div>
	       		</p>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
	  <div class="modal fade" id="deleteStoryModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">머니앨범 삭제하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				<p align="center">해당 머니앨범을 정말 삭제하겠습니까?</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="삭제" class="btn btn-secondary deleteStoryYes" data-dismiss="modal"></input>
					<input type="submit" value="취소" class="btn btn-secondary deleteStoryNo" data-dismiss="modal"></input>
				</div>
			</div>
		</div>
	</div>
</body>
</html>