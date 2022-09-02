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
	.diaryTitle h4{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
	}
	/* container */
	/*background:linear-gradient(90deg, #ffe6e6, #e6e6e6);*/
	.space100 {
		height:100px;
	}
	.container{
		width:90%;
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
	/* modal */
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

		$('.addDiaryYes').on("click", addDiary)
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
			<div class="diaryTitle col-6">
				<h4>oo 스토리</h4>
			</div>
			<div class="col-6" align="right">
				<button type="button" id="addbutton" data-toggle="modal" data-target="#storyModal">
					<i class="bi bi-plus-lg" style="font-size: 1.2rem;"></i>
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
	        	<input type="submit" value="추가" class="btn btn-secondary addDiaryYes" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>