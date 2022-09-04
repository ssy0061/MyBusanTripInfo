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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
		width:90%;
		max-width:800px;
		margin: 20px auto;
	}
	#addbutton{
		display:flex;
		justify-content:center;
		align-items:center;
		background-color:transparent;
		border-style:solid;
		border-width:2px;
		border-color:#53565A;
		border-radius:5px;
		padding:3px 3px;
	}
	.add {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 24
	}
	.card{
		margin:10px 0;
	}
	.card-body:hover{
		cursor:pointer;
		background-color:#fef0f0;
	}
	.deleteStory{
		background-color:transparent;
		border-color:transparent;
	}
	/* modal */
	#storyModal h4, #deleteStoryModal h4{
	 	font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	 }
	 #storyModal p, #deleteStoryModal p{
	 	font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
	 }
	#membersearch{
		display:inline-block;
		background-color:#6c9dc6;
		border-color:transparent;
		border-radius:5px;
		padding:0 3px;
	}
	.search-icon{
		font-variation-settings:
		  'FILL' 0,
		  'wght' 600,
		  'GRAD' 200,
		  'opsz' 24;
		margin-top:2px;
	}
	.modal-body-second{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.addStoryYes{
		display:inline-block;
		padding:4px 10px;
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
		background-color:#53565A;
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
		top: 10px;
		right: 5px;
		font-size: 1.5rem;
		text-align: center;
		border-radius: 30px;
		color: black;
	}
	.deleteStory:active{
		 /*  box-shadow: 3px 3px 3px 3px gray; */
		 background-color: 	#f5f5f5;
	}
	.close {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 500,
	  'GRAD' 0,
	  'opsz' 48;
	  font-size: 25px;
	}
</style>

<script>
$(function() {
	
	var currentMemberId = '<%= (String)session.getAttribute("memberId") %>';
	var memberList = [];
	var storyList = [];
	var storyMemberList = [];
	var cardTitle = "cardTitle";
	var cardSubtitle = "";
	
	//console.log("currentMemberId:: " + currentMemberId);
	
	$.ajax({
		type: 'post',
		url: '/story/findAllStory',
		data: {'memberId': currentMemberId},
		
		success:function(result) {	// 스토리 목록
			console.log("storyList :: " + JSON.stringify(result));
			storyList = result;
			var storyId;
			for(var i=0; i<storyList.length; i++) {
				storyId = storyList[i].storyId;
				cardTitle = storyList[i].storyName;
				cardSubtitle = storyList[i].storySubtitle;
				
				//console.log("공백 여부:: "+ cardSubtitle.search(" "));
				var card = "<div id="+"\'"+ storyId +"\'"+" class=card>"
							+"<div class=card-body onclick=location.href="+"\'/bnk/trip/"+ storyId +"\'>"
							+"<h5 class=card-title>"+ cardTitle+"</h5>"
							+"<p class=card-text>"+ cardSubtitle +"</p></div>"
				if(cardSubtitle.search(" ") == -1) { // 개인 머니 앨범이면
					$('.myStorySpace .col-12').append(
							card + "</div>"
						 )
				}else {
					 $('.ourStorySpace .col-12').append(
						card
						+'<button type=\"button\" class=deleteStory data-toggle=\"modal\" data-target=\"#deleteStoryModal\">'
						+'<span class="close material-symbols-outlined">close</span></button>'
						+"</div>"
					 ) 
				}
				
				
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
		$('#statusmessage').text("");
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
						$('#newmember').val("");
					}
					
				} else {
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
	
	$('.addStoryYes').on('click', addStory)
	function addStory(){
		if(confirm("DB랑 연결해놔서 막 추가하면 안되는데도 스토리를 추가하시겠습니까?")) {
			var storyName = $('#storyname').val();
			//console.log("storyName:: " + storyName + ", currentMemberId:: " + currentMemberId + ", memberList:: " + memberList);
			
			$.ajax({
				type: 'post',
				url: '/story/addStory',		// 스토리 추가 +리더추가
				data: {'storyName':storyName, 'memberId': currentMemberId},
				
				success:function(result) {
					//console.log("result:: " + result+", memberList::" + memberList);
					
					$.ajax({
						type: 'post',
						url: '/story/addStoryMember', // 스토리에 멤버 추가
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
	
	$('#addbutton').hover(function(){
		$(this).children().css("color","white");
		$(this).css("background-color","#53565A");
	}, function(){
		$(this).children().css("color", "#53565A")
		$(this).css("background-color","white");
	})
	
});
</script>

</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navTitle" value="머니앨범"/>
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row myStorySpace ">
			<div class="storyTitle col-12">
				<h4>나의 머니앨범</h4>
			</div>
		</div>
		<div class="row ourStorySpace mt-4">
			<div class="storyTitle col-9">
				<h4>모임 머니앨범</h4>
			</div>
			<div class="col-3" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<span class="material-symbols-outlined add">add</span>
				</button>
				
			</div>
			<div class="col-12">
				
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
	       		<p class="modal-body-second">
					<i class="bi bi-person-bounding-box" style="font-size: 1.2rem;"></i>&nbsp;
	       			<input type="text" id="newmember" placeholder="추가할 멤버 아이디 검색하기" size="23">
	       			&nbsp;<button type="button" class="button btn-primary" id="membersearch">
	       				<span class="material-symbols-outlined search-icon">search</span>
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
	        	<input type="submit" value="추가" class="btn btn-secondary addStoryYes" data-dismiss="modal"></input>
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