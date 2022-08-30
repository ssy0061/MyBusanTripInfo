<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
		border-radius:30px;
		border-width:2px;
		border-color:#cb333b;
		background-color:white;
		margin:2px 0;
	}
	.custom-button:hover{
		background-color:#cb333b;
		border-color:#cb333b;
	}
	/* modal */
	.mem-id, .mem-name{
		width:50%;
		text-align:justify;
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
            var itemNumbers = $(this).find(itemClass).length;
            btnParentSb = $(this).parent().attr(dataItems);
            itemsSplit = btnParentSb.split(',');
            $(this).parent().attr("id", "MultiCarousel" + id);

            if (bodyWidth >= 768) {
                incno = itemsSplit[1];
                itemWidth = sampwidth / incno;
            }
            else {
                incno = itemsSplit[0];
                itemWidth = sampwidth / incno;
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
    function ResCarousel(e, el, s) {
        var leftBtn = ('.leftLst');
        var rightBtn = ('.rightLst');
        var translateXval = '';
        var divStyle = $(el + ' ' + itemsDiv).css('transform');
        var values = divStyle.match(/-?[\d\.]+/g);
        var xds = Math.abs(values[4]);
        if (e == 0) {
            translateXval = parseInt(xds) - parseInt(itemWidth * s);
            $(el + ' ' + rightBtn).removeClass("over");

            if (translateXval <= itemWidth / 2) {
                translateXval = 0;
                $(el + ' ' + leftBtn).addClass("over");
            }
        }
        else if (e == 1) {
            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
            translateXval = parseInt(xds) + parseInt(itemWidth * s);
            $(el + ' ' + leftBtn).removeClass("over");

            if (translateXval >= itemsCondition - itemWidth / 2) {
                translateXval = itemsCondition;
                $(el + ' ' + rightBtn).addClass("over");
            }
        }
        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
    }

    //It is used to get some elements from btn
    function click(ell, ee) {
        var Parent = "#" + $(ee).parent().attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);
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
				<a href="#" data-toggle="tooltip" data-placement="left" title="멤버 조회">
				<button type="button" class="btn btn-outline-secondary custom-button"  data-toggle="modal" data-target="#memberModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
					  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/><path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
					</svg>
				</button>
				</a>
			</div>
		</div>
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
				거래내역 추가하기 <input type="text"></input>
				다음 페이지로 넘어가고?
				사진 추가하기 <input type="file" accept="image/png, image/jpeg" multiple>
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