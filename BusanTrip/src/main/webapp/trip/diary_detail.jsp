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
<title>Insert title here</title>
<style>
	/* all */
	*{
		font-family: 'Trebuchet MS', sans-serif;
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
	.MultiCarousel { 
		float: left;
		overflow: hidden;
		padding:15px auto;
		width: 100%;
		position:relative; }
	.MultiCarousel .MultiCarousel-inner {
		transition: 1s ease all;
		float: left; }
	.MultiCarousel .MultiCarousel-inner .item { 
		float: left; margin:10px; }
	.MultiCarousel .MultiCarousel-inner .item > div { 
		text-align: center; padding:10px;
	}
	.MultiCarousel .leftLst, .MultiCarousel .rightLst { 
		position:absolute; border-radius:50%; top:calc(50% - 20px);
		background-color:#CB333B; border-color:transparent; }
	.MultiCarousel .leftLst { left:0; }
	.MultiCarousel .rightLst { right:0; }
	.MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over { 
		pointer-events: none; background:#ccc; }
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
	    z-index: 2;
	    position: relative;
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
$(document).ready(function () {
    var itemsMainDiv = ('.MultiCarousel');
    var itemsDiv = ('.MultiCarousel-inner');
    var itemWidth = "";
    var itemNumbers = 0;

    $('.leftLst, .rightLst').click(function () {
        var condition = $(this).hasClass("leftLst");
        if (condition)
            click(0, this);
        else
            click(1, this)
    });

    ResCarouselSize();

    $(window).resize(function () {
        ResCarouselSize();
    });

    //this function define the size of the items
    function ResCarouselSize() {
        var incno = 0;
        var dataItems = ("data-items");
        var itemClass = ('.item');
        var id = 0;
        var btnParentSb = '';
        var itemsSplit = '';
        var sampwidth = $(itemsMainDiv).width();
        var bodyWidth = $('body').width();
        $(itemsDiv).each(function () {
            id = id + 1;
            itemNumbers = $(this).find(itemClass).length;
            btnParentSb = $(this).parent().attr(dataItems);
            itemsSplit = btnParentSb.split(',');//['1', '3']
            $(this).parent().attr("id", "MultiCarousel" + id);

            if (bodyWidth >= 768) {
                incno = itemsSplit[1];// 3
                itemWidth = sampwidth / incno -20;// margin 보정
            }
            else {
                incno = itemsSplit[0];// 1
                itemWidth = sampwidth / incno -20;// margin 보정
            }
            $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
            $(this).find(itemClass).each(function () {
                $(this).outerWidth(itemWidth);
            });

            $(".leftLst").addClass("over");
            $(".rightLst").removeClass("over");
        });
    }

    //this function used to move the items
    function ResCarousel(e, el, s) { // 왼 0, 오1 / MultiCarousel / 1
        var leftBtn = ('.leftLst');
        var rightBtn = ('.rightLst');
        var translateXval = '';
        var divStyle = $(el + ' ' + itemsDiv).css('transform'); // matrix(1, 0, 0, 1, -468, 0)
        var values = divStyle.match(/-?[\d\.]+/g);
        var xds = Math.abs(values[4]); // matrix 5번째 값: 버튼 누른 시점의 왼쪽 경계 x좌표
        
        if (e == 0) {// 왼쪽이면
            translateXval = parseFloat(xds) - parseFloat((itemWidth+20) * s);// x좌표-(아이템길이*1) 즉, 이동 후 새 좌표값
            $(el + ' ' + rightBtn).removeClass("over");
            if (translateXval <= itemWidth+5) {
                translateXval = 0;
                $(el + ' ' + leftBtn).addClass("over");
            }
        }
        else if (e == 1) {// 오른쪽이면
            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width()-20;//전체 가로길이 - 아이템 길이
            translateXval = parseFloat(xds) + parseFloat((itemWidth+20) * s);// x좌표+(아이템길이*1) 즉, 이동 후 새 좌표값
            $(el + ' ' + leftBtn).removeClass("over");
            if (translateXval >= itemsCondition - (itemWidth * 3 / 2)) {
            	console.log(translateXval+">>>>"+itemsCondition, itemWidth)
                translateXval = (itemWidth+20)*(itemNumbers-2);
                console.log(translateXval)
                $(el + ' ' + rightBtn).addClass("over");
            }
        }
        
        console.log("클릭 전 x좌표: "+xds+"////"+"전체 가로 길이: "+$(itemsDiv).width()+" "+"아이템 길이: "+itemWidth)
        console.log("새 x좌표"+translateXval+" 증가값: "+(translateXval-xds))
        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
    }

    //It is used to get some elements from btn
    function click(ell, ee) {
        var Parent = "#" + $(ee).parent().attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);// 왼 0, 오1 / MultiCarousel / 1
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
			<div class="col-12">
				<h4 align="center">ㅇㅇ여행</h4>
				<h6 align="center">2022.08.13 ~ 2022.08.15</h6>
				<h5>사용자A</h5>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="MultiCarousel" data-items="1,3" data-slide="1" id="MultiCarousel-one"  data-interval="1000">
	            <div class="MultiCarousel-inner">
	            	<div class="item d-none">
	                </div>
	            	<div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="card-text pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="card-text pay-price"><h5>결제금액</h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	            </div>
	            <button class="btn btn-primary leftLst"><</button>
	            <button class="btn btn-primary rightLst">></button>
	        </div>
		</div>
		<div class="row">
			<div class="col-12">
				<h5>사용자B</h5>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="MultiCarousel" data-items="1,3" data-slide="1" id="MultiCarousel-two"  data-interval="1000">
	            <div class="MultiCarousel-inner">
	            	<div class="item d-none">
	                </div>
	            	<div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	                <div class="item card">
	                    <img class="card-img-top" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191216135832825_thumbL" style="width:100%">
						<div class="card-body">
							<h6 class="card-text">결제일시</h6>
							<div class="pay-store"><h5 class="card-title">가게이름</h5></div>
							<div class="pay-price"><h5><small>결제금액</small></h5></div>
							<h6>메모 내용 들어갈 곳</h6>
						</div>
	                </div>
	            </div>
	            <button class="btn btn-primary leftLst"><</button>
	            <button class="btn btn-primary rightLst">></button>
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
				  <div class="mx-auto">
				    <input id="upload" type="file" accept="image/*" multiple>
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
	<script type="text/javascript">
		/* multi file upload */
		
		function readMultiImage(input) {
			const multiContainer = document.getElementById('multiContainer')
			
			if(input.files) {
				const fileArr = Array.from(input.files)
				const $colDiv = document.createElement('div')
				$colDiv.classList.add('column')
				fileArr.forEach((file, index) => {
					const reader = new FileReader()
		            const $imgDiv = document.createElement('div')
		            const $img = document.createElement('img')
		            $img.classList.add('each-image')
		            const $label = document.createElement('label')
		            $label.classList.add('image-label')
		            $label.textContent = file.name
		            $imgDiv.appendChild($img)
		            $imgDiv.appendChild($label)
		            reader.onload = e => {
		            	$img.src = e.target.result
		            }
		            console.log(file.name)
					$colDiv.appendChild($imgDiv)
					
					reader.readAsDataURL(file)
				})
				multiContainer.appendChild($colDiv)
			}
		}
		document.getElementById('upload').addEventListener('change', (e) => {
			readMultiImage(e.target);
		})
	</script>
</body>
</html>