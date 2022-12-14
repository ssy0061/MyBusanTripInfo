<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	.diaryTitle h4{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 700;
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
	}
	.perm_media{
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 600,
	  'GRAD' 0,
	  'opsz' 24;
	  margin:4px 0;
	  color:#53565A;
	}
	.card{
		display: flex;
        justify-content: center;
        align-items: center;
        margin:10px 0;
    	border-radius:5px;
	}
	.card:hover{
		cursor:pointer;
		background-color:#fef0f0;
	}
	.card>img{
		margin:0 0 10px 0;
		border-radius:5px;
	}
	#diaryName{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	/* modal */
	#storyModal h4{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	#storyModal p{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
	}
	#membersearch{
		border-color:transparent;
		border-radius:2px;
	}
	.addDiaryYes{
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
	/* ????????? ?????? ?????? ?????? css */
	.content{
	    margin-top: 90px;
	    width:90%;
		max-width:800px;
		padding: 20px 0;
	}
	@media screen and (max-width: 575px) { /* mobile */
		.content{
			margin-top: 70px; /* ????????? 70*/
			padding-bottom: 80px;/* ????????? 80 */
			min-height: calc(100vh - 70px);
		}
	}
	@media screen and (min-width: 575.1px) { /* Web */
		.content{
			min-height: calc(100vh - 90px); /* ????????? 90px */
	    	padding: 20px 0;
		}
	}
	/* ????????? ?????? ?????? ?????? css */
</style>
<script type="text/javascript">
	$(function(){
		var storyId = location.pathname.substring(10)	
		
		findStoryName(storyId);
		getDiaryList();
		
		function findStoryName(storyId) {
			$.ajax({
				type: 'post',
				url: '/story/findStoryName',
				data: {"storyId": storyId},
				
				success:function(result) {
					//console.log(result);
					$('.diaryTitle').append(
						'<h4>' + result + '</h4>'		
					)
				},
				error:function(e) {
					console.log(e);
				}
			})
			
		}
		
		function getDiaryList(){
			$.ajax({
				type: 'post',
				url: "/story/findAllDiaryList",
				data: {'storyId': storyId},
				
				success:function(result) {
					//console.log(result)
					
					var diaryName;
					var imageUrlList = ['/img/diaryImg1.jpg', '/img/diaryImg2.jpg', '/img/diaryImg04.jpg'
										, '/img/diaryImg05.jpg', '/img/diaryImg06.jpg', '/img/diaryImg07.jpg'];
					var imageUrl = "/img/noimg.png";
					for(var i=0; i<result.length; i++) {
						diaryName = result[i].diaryName;
						var diaryId = result[i].diaryId;
						$('.diary-in-story').append(
									'<div class="col-md-4 col-6 px-2">'
									+'<div class="card" onclick=' + '\"location.href=' + "\'/bnk/trip/"+ storyId + "/"+ diaryId +"\'\">"
										+ '<img class="card-img-top m-0" src=' + imageUrlList[i%6] +' alt="Card image" style="width:100%">'
										+ '<div class="py-2">'
											+ ' <div id="diaryName" class="card-content m-0" style="font-size: 1rem;">' + diaryName + '</div>'
										+ '</div>'
									+'</div></div>'
								
						) 
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}

		$('.addDiaryYes').on("click", addDiary)
		
		function addDiary() {
			var diaryName = $('#newDiaryName').val();
			$.ajax({
				type: "post",
				url: "/story/addDiary",
				data: {'storyId': storyId, 'diaryName': diaryName},
				
				success:function(result) {
					alert(diaryName + " ???????????? ?????? ??????");
					//console.log(result);
					$('.diary-in-story').html("");
					$('#newDiaryName').val("");
					getDiaryList();	// ????????? ???????????? ???????????? ?????? ????????????
				},
				error: function(e){
					console.log(e);
				}
			})
		}
		
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
		<c:param name="navSubTitle" value="????????????"/>
	</c:import>
	<div class="content container">
		<div class="space100"></div>
		<div class="row">
			<div class="diaryTitle col-6">
				<!-- <h4>oo ?????????</h4> -->
			</div>
			<div class="col-6" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<span class="material-symbols-outlined perm_media">perm_media</span>
				</button>
			</div>
		</div>
		<div class="row d-flex justify-content-start diary-in-story">
			
			
		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	 <div class="modal fade" id="storyModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">???????????? ????????????</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
	     		<p>???????????? ?????? : <input type="text" id="newDiaryName" size="18"></p>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="??????" class="btn btn-secondary addDiaryYes" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>