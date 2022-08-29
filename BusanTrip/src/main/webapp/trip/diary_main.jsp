<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
	/* all */
	*{
		font-family: 'Trebuchet MS', sans-serif;
		box-sizing:border-box;
	}
	/* header */
	header{
		background-color:#ffffff;
		height:100px;
		border-bottom-style:solid;
		border-bottom-width:6px;
		border-color:#cb333b;
		padding-top:30px;
	}
	svg{
		vertical-align:middle;
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
	/* footer */
	footer{
		height:80px;
	}
	.icon{
		margin:0 auto;
	}
	#mobilefooter{
		width:340px;
		margin:10px auto;
		bottom:0;
		position:center fixed;
	}
	#webfooter{
		background-color:#53565A;
		width:100%;
		height:100px;
		margin:0 auto;
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
</head>
<body>
	<header class="fixed-top">
		<div class="row">
			<div class="col-2" align="center">
				<a href="test_story.html">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
				</a>
			</div>
			<div class="col-8">
				<h3 align="center">여행</h3>
			</div>
			<div class="col-2">
			</div>
		</div>
	</header>
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
			<div class="col-12">
				<div class="card bg-light">
					<div class="card-body" onclick="location.href='#'">
						<h5 class="card-title">통영에서의 추억</h5>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body" onclick="location.href='#'">
						<h5 class="card-title">염미정과의 이야기</h5>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body" onclick="location.href='test_diary_detail.html'">
						<h5 class="card-title">부산 당일치기</h5>
					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body" onclick="location.href='#'">
						<h5 class="card-title">앨범004</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="row small fixed-bottom" id="mobilefooter">
			<div class="icon">
				<a href="#"><img src="./img/icon_home.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="#"><img src="./img/icon_search.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="#"><img src="./img/icon_album.png" width="80px" height="80px"></a>
			</div>
			<div class="icon">
				<a href="#"><img src="./img/icon_hotplace.png" width="80px" height="80px"></a>
			</div>
		</div>
		<div class="row large fixed-bottom" id="webfooter">
		</div>
	</footer>
	<!-- The Modal -->
	 <div class="modal fade" id="storyModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">다이어리 생성하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
	     		<p>다이어리 이름 : <input type="text" size="18"></p>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="추가" class="btn btn-secondary" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>