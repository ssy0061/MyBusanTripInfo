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
	#addbutton, #deletebutton{
		background-color:transparent;
		border-style:solid;
		border-width:2px;
		border-color:#53565A;
		border-radius:5px;
	}
	#addbutton:hover, #deletebutton:hover {
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
						"<div class="+"card"+">"
						+"<div class="+"card-body"+ " onclick="+"location.href="+"\'/bnk/trip/"+storyId +"\'>"
						+"<h5 class="+"card-title"+">"+ cardTitle +"</h5>"
						+"<p class="+"card-text"+">"+ cardText +"</p></div></div>"
				) 
			} 
			
		},
		error:function(e) {
			console.log(e);
		}
		
	});
	
	

	
	$('#membersearch').on('click', addMember)
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
						$('#memberresult li').append(memberId+'   ');
					}

				}
				else {
					if(memberId != ""){
						$('#statusmessage').text("존재하지 않는 사용자"); 
					}
						
				}
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
							alert(result2+"명과 함께하는 스토리가 생성되었습니다.");
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
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16" weight="medium">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
					</svg>
				</button>
				<button type="button" id="deletebutton">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16" weight="medium">
					  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
					</svg>
				</button>
			</div>
			<div class="col-12">
				<div class="card">
					<div class="card-body" onclick="location.href='/bnk/trip/3'">
						<h5 class="card-title">First Story</h5>
						<p class="card-text">불러온거 아니고 직접 넣은 카드</p>
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
	       				<div id="statusmessage" style="color:red">
		       				함께할 친구의 ID를 입력하세요.
		       			</div>
	       				<ul>
	       					<li>추가된 멤버:  </li>
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