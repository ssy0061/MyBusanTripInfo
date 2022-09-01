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
<title>Insert title here</title>
<style>
	/* all */
	*{
		box-sizing:border-box;
	}
	/* container */
	/*background:linear-gradient(90deg, #ffe6e6, #e6e6e6);*/
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
		display: flex;
        justify-content: center;
        align-items: center;
        margin:10px 0;
    	border-radius:5px;
	}
	.card:hover{
		cursor:pointer;
		background-color:#f0c2c4;
	}
	.card>img{
		margin:0 0 10px 0;
		border-radius:5px;
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
<script type="text/javascript">
	$(function(){
		var storyId = location.pathname.substring(10)
		
		
		$.ajax({
			type: "post",
			url: "/story/findAllDiaryList",
			data: {'storyId': storyId},
			
			success:function(result) {
				console.log(result)
				
				var diaryName;
				var imageUrl = "/img/noimg.png";
				for(var i=0; i<result.length; i++) {
					diaryName = result[i].diaryName;
					
					$('.diary-in-story').append(
							'<div class="card col-sm-6 col-md-4">'
								+'<div class="card-body" onclick='+'\"location.href='+"\'/bnk/trip/diary_detail\'\">"
									+'<h5 class="card-title">'+ diaryName +'</h5>'
								+'</div>'
								+'<img class="card-img-bottom" src='+ imageUrl +' style="width:100%">'
							+'</div>'
					) 
				}

			},
			error: function(e){
				console.log(e);
			}
		})
		
		$.ajax({
			type: "post",
			url: "/story/findStoryMember",
			data: {'storyId': storyId},
			
			success:function(result) {
				console.log(result)
			},
			error: function(e){
				console.log(e);
			}
		})

		$('.modal-button').on("click", addDiary)
		function addDiary() {
			var diaryName = $('#newDiaryName').val();
			$.ajax({
				type: "post",
				url: "/story/addDiary",
				data: {'storyId': storyId, 'diaryName': diaryName},
				
				success:function(result) {
					alert(diaryName + " 다이어리 추가 완료");
					console.log(result);
					document.location.reload();	// 생성된 다이어리 반영하기 위해 새로고침
				},
				error: function(e){
					console.log(e);
				}
			})
		}
		
		
	});
</script>
</head>
<body>
	<c:import url="/header/nav.jsp">
		<c:param name="navSubTitle" value="여행"/>
	</c:import>
	<div class="container">
		<div class="space100"></div>
		<div class="row">
			<div class="col-6">
				<h4>oo 스토리</h4>
			</div>
			<div class="col-6" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#53565A" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
					  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
					</svg>
				</button>
			</div>
		</div>
		<div class="row d-flex justify-content-center diary-in-story">
			<div class="card col-sm-6 col-md-4">
				<div class="card-body" onclick="location.href='/bnk/trip/diary_detail'">
					<h5 class="card-text">직접 입력한 추억</h5>
				</div>
				<img class="card-img-bottom" src="/img/noimg.png" style="width:100%">
			</div>
			
		</div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	 <div class="modal fade" id="storyModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">다이어리 생성하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
	     		<p>다이어리 이름 : <input type="text" id="newDiaryName" size="18"></p>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary modal-button" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>