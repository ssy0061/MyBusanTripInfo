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
<srcipt src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></srcipt>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
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
	}

	.pay-store{
		width:50%;
		float:left;
	}
	.pay-price{
		width:50%;
		float:right;
	}
	.card-body>h6{
		width:100%;
		float:left;
	}
	/* customizebutton */
	#customizeButton{
		right:20px;
		bottom:100px;
		position:fixed;
		z-index: 98;
	}
	.custom-button{
		border-width:2px;
		border-color:#cb333b;
		background-color:white;
		margin:2px 0;
	}
	.custom-button:hover{
		background-color:#cb333b;
		border-color:#cb333b;
	}
	/* modal - member */
	.mem-id, .mem-name{
		float:left;
		text-align:justify;
	}
	.modal-footer>input{
		box-shadow: 0 3px 3px 0 #53565A;
	}
	/* modal - pic */
	.image-area {
	    position: relative;
	}
	.image-area::before {
	    color: #fff;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    z-index: 1;
	}
	.each-image {
	    width:50%;
	    height:auto;
	    padding:2px 5px;
	    margin:5px 2px;
	    z-index: 2;
	    position: relative;
	}
	.picture-btn-re>input[type="file"]{
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	.picture-btn-re>label, #resetUpload, .deleteBtn{
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
		background-color:#F08080;
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
	/* swiper */
	.swiper {
        width: 100%;
        height: 100%;
      }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .content>*{
    	display: flex;
		flex-wrap: wrap;
		align-content: space-between;;
    }
</style>
<script>
$(document).ready(function () {
	var result = [
		{
		'user': '사용자1',
		'list': [
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름1',
				'payment': '20000',
				'memo': 'memo1'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름2',
				'payment': '50000',
				'memo': 'memo2'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름3',
				'payment': '30000',
				'memo': 'memo3'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름4',
				'payment': '70000',
				'memo': 'memo4'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름5',
				'payment': '40000',
				'memo': 'memo5'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름6',
				'payment': '10000',
				'memo': 'memo6'
			}
		]},
		{
		'user': '사용자2',
		'list': [
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름1',
				'payment': '20000',
				'memo': 'memo1'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름2',
				'payment': '50000',
				'memo': 'memo2'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름3',
				'payment': '30000',
				'memo': 'memo3'
			}]
		},
		{
		'user': '사용자3',
		'list': [
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름1',
				'payment': '20000',
				'memo': 'memo1'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름2',
				'payment': '50000',
				'memo': 'memo2'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름3',
				'payment': '30000',
				'memo': 'memo3'
			},
			{
				'url': 'https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL',
				'storeName': '가게이름4',
				'payment': '70000',
				'memo': 'memo4'
			}]
		},
	];

	refreshContent();

    $(window).resize(function () {
    });
    
    //this function define the size of the items
    function refreshContent() {
    	for(let i = 0; i<result.length; i++) {
    		// 생성
    		user = result[i].user;
    		list = result[i].list;
    		$('.content').append(
    			"<div id='user-"+user+"'>"+
    			"<h5>"+user+"</h5>"+
    			"<div class='swiper' id='swiper-"+user+"'>"+
    			"<div class='swiper-wrapper'>"+
    			"</div><div class='swiper-pagination'></div>"+
    			"<div class='swiper-scrollbar'></div></div></div>"
    		);
    		for(let i=0; i<list.length; i++){
    			$('#swiper-'+user).children('.swiper-wrapper').append(
    				"<div class='swiper-slide'><div class='card'>"+
    				"<img class='card-img-top' src='"+list[i].url+"' style='width:100%'>"+
    				"<div class='card-body'><h6 class='card-text'>결제일시</h6>"+
    				"<div class='card-text pay-store'><h5 class='card-title'>"+list[i].storeName+"</h5></div>"+
    				"<div class='card-text pay-price'><h5>"+list[i].payment+"</h5></div>"+
    				"<h6>"+list[i].memo+"</h6></div></div></div>"
    			);
    		}
    		
    		var swiper = new Swiper("#swiper-"+user, {
    			slidesPerView: 2.7,
    	        spaceBetween: 10,
    	        grabCursor: true,
    	        navigation: {
    	          nextEl: ".swiper-button-next",
    	          prevEl: ".swiper-button-prev",
    	        },
    	        breakpoints: {
    	            // when window width is >= 0px
    	            0: {
    	            	slidesPerView: 1.2,
    	            	spaceBetween: 10
    	            },
    	            720: {
    	            	slidesPerView: 2.2,
    	            },
    	            1200: {
    	            	slidesPerView: 2.5,
    	            }
    	        },
    	        scrollbar: {
    	            el: ".swiper-scrollbar",
    	            draggable: true,
    	        }
    		});
    		
    		
    	}
    }
    var fileArr = "";
    /* multi file upload */
	function readMultiImage(input) {
		const multiContainer = document.getElementById('multiContainer');
		
		if(input.files) { // 인풋 태그에 파일들이 있는 경우
			// 이미지 파일 검사 생략
			console.log(input.files)
			console.log(input.files.length)
			fileArr = Array.from(input.files) // forEach문으로 처리하기 위해 유사배열을 배열로 변환
			const $colDiv = document.createElement('div')
			fileArr.forEach((file, index) => {
				const reader = new FileReader()
				
	            const $imgDiv = document.createElement('div')
	            const $img = document.createElement('img')
	            $img.classList.add('each-image')
	            const $label = document.createElement('label')
	            $label.classList.add('image-label')
	            $label.textContent = file.name
	            //var str="<button type='button' id='delete_"+(index)+"'>삭제</button>"
	            
	            var $str = document.createElement('button');
	            $str.setAttribute('type', 'button');
	            $str.setAttribute('id', 'delete_'+index);
	            $str.setAttribute('class', 'deleteBtn');
	            $str.append('삭제');
	            
	            $imgDiv.appendChild($img);
	            $imgDiv.appendChild($label);
	            reader.onload = e => {
	            	$img.src = e.target.result;
	            };
	            console.log(file.name);
				$colDiv.appendChild($imgDiv);
				$imgDiv.append($str);
				
				reader.readAsDataURL(file)
				
				})
				multiContainer.appendChild($colDiv)
			}
			
		}
	const inputMultiImage = document.getElementById("upload")
		inputMultiImage.addEventListener('change', (e) => {
			readMultiImage(e.target)
	});
		
	function deleteFile(obj){
		obj.parent().remove();
	}
	$('#resetUpload').hide();
	$('#resetUpload').click(function(){
		$('#multiContainer').children().remove();
		$('#input-label').show();
		$('#resetUpload').hide();
	})
	$('#upload').change(function(){
		$(this).hide();
		$('#input-label').hide();
		$(this).val("");
		$('#resetUpload').show();
	})
	$('#multiContainer').on("click", ".deleteBtn", function(e) {
		console.log($(this).attr("id").substring(7));
		fileArr.splice($(this).attr("id").substring(7),1);
		console.log(fileArr)
		$(this).parent().remove();
	});
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
			<div class="col-12">
				<h4 align="center">ㅇㅇ여행</h4>
				<h6 align="center">2022.08.13 ~ 2022.08.15</h6>
			</div>
		</div>
		<div class="content">
		
		</div>
		<div class="row">
			<div class="col-12">
				<h5>사용자A</h5>
			</div>
		</div>
		
		<!-- Slider main container -->
		<div class="swiper mySwiper">
		  <!-- Additional required wrapper -->
		  <div class="swiper-wrapper">
		    <!-- Slides -->
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름1</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름2</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름3</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>
		    <div class="swiper-slide">
				<div class="card">
                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
					<div class="card-body">
						<h6 class="card-text">결제일시</h6>
						<div class="card-text pay-store"><h5 class="card-title">가게이름4</h5></div>
						<div class="card-text pay-price"><h5>결제금액</h5></div>
						<h6>메모 내용 들어갈 곳</h6>
					</div>
                </div>
			</div>			
		  </div>
		  <!-- If we need pagination -->
		  <div class="swiper-pagination"></div>
		
		  <!-- If we need scrollbar -->
		  <div class="swiper-scrollbar"></div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<h5>사용자B</h5>
			</div>
		</div>
		
		<div id="customizeButton">
			<div class="btn-group-vertical">
				<a data-toggle="tooltip" data-placement="left" title="거래내역 추가하기">
				<button type="button" class="btn btn-outline-secondary custom-button" data-toggle="modal" data-target="#transactionModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
					</svg>
				</button>
				</a>
				<a data-toggle="tooltip" data-placement="left" title="멤버 조회">
				<button type="button" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#memberModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
					  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/><path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
					</svg>
				</button>
				</a>
			</div>
		</div>
		<div class="space100"></div>
	</div>
	<c:import url="/footer/footer.jsp" />
	<!-- The Modal -->
	  <!-- 거래 내역 추가 modal -->
	  <div class="modal fade" id="transactionModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">거래내역 추가하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body" align="center">
				<p>거래내역 추가하기 <input type="text"></input></p>
				<div class="row py-2">
				  <div class="mx-auto picture-btn-re">
				  	<label id="input-label" for="upload">사진 추가</label>
				    <input id="upload" type="file" accept="image/*" multiple>
				    <input type="button" id="resetUpload" value="초기화">
				    <div id="multiContainer" class="image-area mt-4">
				    </div>
				</div>
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="확인" class="btn btn-secondary" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
	  <!-- 멤버 조회 modal -->
	  <div class="modal fade" id="memberModal">
	   <div class="modal-dialog modal-dialog-centered">
	     <div class="modal-content">
	     	<div class="modal-header">
	     		<h4 class="modal-title">멤버 조회하기</h4>
	     		<button type="button" class="close" data-dismiss="modal">&times;</button>
	     	</div>
	     	<div class="modal-body">
	     		<div class="col-6 mem-id">
					<p align="center">아이디</p>
					<p align="center">aaaaa</p>
					<p align="center">bbbbb</p>
					<p align="center">ccccc</p>
					<p align="center">ddddd</p>
				</div>
				<div class="col-6 mem-name">
					<p align="center">이름</p>
					<p align="center">에이에이</p>
					<p align="center">비비비</p>
					<p align="center">씨씨씨</p>
					<p align="center">디디디</p>
				</div> 
	     	</div>
	        <div class="modal-footer">
	        	<input type="submit" value="확인" class="btn btn-secondary" data-dismiss="modal"></input>
	     	</div>
	      </div>
	    </div>
	  </div>
</body>
</html>