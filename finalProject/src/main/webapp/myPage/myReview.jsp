<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" src="../css/myPage.css">
<style>
    body, input, select, textarea, button, a {
        -webkit-text-size-adjust:none;
        font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
    }
</style>

<style>
	.article_right{overflow:hidden;}
	.article_right   .article_right, .cs_wrap   .article_left, .cs_wrap   .article_right{padding-top:0}
	
 	.my_tbl_tit{border-bottom:1px solid #000;font-weight:700}  
	.my_tbl_lst .my_tbl_tit .tit,   .my_tbl_lst .my_tbl_tit .type{text-align:center}  
	.my_tbl_lst .my_tbl,   .my_tbl_lst>li{border-bottom:1px solid #d4d4d4}  
	.my_tbl_lst .btn_bor{position:absolute;top:50%;right:20px;width:43px;height:34px;margin-top:-17px;border-radius:2px;line-height:34px}  
	.my_tbl_info{table-layout:fixed;position:relative;box-sizing:border-box;color:#303033}  
	.my_tbl_info,   .my_tbl_info .infoinner{display:table;width:100%} 
	.my_tbl_info p{display:table-cell;min-height:50px;text-align:center;vertical-align:middle;font-size:14px;box-sizing:border-box}
	.my_tbl_info {border-bottom: 1px solid #d4d4d4; padding: 10px 0px;}
	
	.my_tbl_lst .reply_row{display:none}  
	.my_tbl_lst .reply_row img{max-width:100%}  
	.my_tbl_lst .active .reply_row{display:block}  
	 
	.order_lst .thead{display:table;width:100%;border-bottom:1px solid #303033;font-size:12px;line-height:50px;table-layout:fixed}  
	.order_lst .thead .in_td{display:table-cell;position:relative;height:0;padding:0;border:0;text-align:center;vertical-align:middle}  
	.order_lst .thead .in_td:first-child{overflow:hidden;width:68%}  
	.order_lst .thead .type1{float:left;width:100px}  
	.order_lst .thead .type2{overflow:hidden}  
	.order_lst .goods_tip{margin-top:10px;font-size:12px;line-height:24px;color:#a0a0a0;text-align:right}
	
	.order_lst .my_tbl_info{display:table;width:100%;border-bottom:1px solid #d4d4d4;font-size:12px;line-height:50px;table-layout:fixed}
	.order_lst .my_tbl_info .in_td{display:table-cell;position:relative;height:0;padding:0;border:0;text-align:center;vertical-align:middle}  
	.order_lst .my_tbl_info .in_td:first-child{overflow:hidden;width:68%;text-align:left;padding-left:2%;}
	.order_lst .my_tbl_info .in_td img {width: 100px;}
	.order_lst .my_tbl_info .in_td #itemName {font-size: 16pt;font-weight: bold;}
	
	.my_review .order_lst{margin-top:40px;border-top:4px solid #000}  
	.my_review .goods .col2,   .my_review .goods .col3{text-align:center}  
	.my_review .goods .col3{width:auto} 
	.my_review .goods .btn_black{min-width:76px}  
	.my_review .goods .btn_black,   .my_review .goods .btn_bor{display:inline-block}
		
	.tab{overflow:hidden;margin-top:40px;border-bottom:4px solid #000;font-size:0}
	.tab   li{margin:0 -1px -1px 0}
	.tab   li, .tab   li   a{display:inline-block}
	.tab   li   a{padding:0 30px;border:1px solid #d4d4d4;font-size:14px;color:#a0a0a0;line-height:48px;text-decoration: none;}
	.tab   .selected   a{border-color:#000;background:#000;color:#fff}

	.review_info{margin-top:20px;font-size:14px;color:#303033;line-height:24px}
	.btn_black {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
	.btn_black[disabled] {background: lightgray; border: 1px solid lightgray;}
	
	#reviewDetail_frame {
		background-color: transparent;
	    z-index: 1000;
	    opacity: 1;
		display: none;
	    position: fixed;
	    overflow: hidden;
	    top: 0;
	    left: 0;
	    bottom: 0;
	    right: 0;
	    text-align: center;
	}
	#reviewDetail_dialog {
		width: inherit;
	    height: inherit;
	    padding: 50px 40px 40px;
	    background-color: rgb(255, 255, 255);
	    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
	    opacity: 1;
	    transform: translate(-50%, -50%) scale(1);
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    box-sizing: border-box;
	    width: 1000px;
	    height: 700px;
	    overflow: scroll;
	}
	#dialog_closeBtn {
		position: fixed;
		top: 5px;
		right: 5px;
		cursor: pointer;
	}
	#reviewDetail_dialog h3 {
	    width: 100%;
	    border-bottom: 4px solid black;
	    padding: 10px 0px 10px 10px;
	    margin: 0px;
	    text-align: left;
	}
	#reviewDetail_dialog #star {width: 20%; float: left; height: 30px;}
	#reviewDetail_dialog #logtime {width: 20%; float: left; height: 30px;}
	#reviewDetail_dialog > div {margin: 10px 0px; border-bottom: 1px solid black; height: auto; overflow: hidden;}
	#reviewDetail_dialog > div:last-child {border-bottom: 0px;}
	#reviewDetail_dialog div div span:first-child {font-size:14pt; font-weight: bold; height: 30px; vertical-align: top; margin: 10px;}
	#reviewDetail_dialog span {height: 30px;}
	#reviewDetail_dialog #reviewImg {width: 40%; float: left;}
	#reviewDetail_dialog #reviewImg img {width: 100%;}
	#reviewDetail_dialog #reviewComments {width: 60%; float: left; height: 100%; min-height: 300px;}
</style>
	

</head>
<body>

<div class="article_right">
	<ui-my-order-review ng-version="4.0.3">
	
		<section class="my_review">
		<h3 class="my_tit nobor">상품후기</h3>
		
		<div class="tab">
			<ul>
				<li class="selected">
					<a>상품후기 쓰기</a>
				</li>
				<li class="">
					<a>작성내역</a>
				</li>
			</ul>
		</div>
			
		<div class="review_info">
			<p class="pc_view">구매하신 상품에 대한 유용한 정보를 다른 고객과 공유하는 곳으로 솔직담백한 상품후기를 올려주세요.</p>
			<ul>
				<li>포토후기 : 사진과 함께 30자 이상의 글을 쓰시면 1,500 point</li>
				<li>일반후기 : 사진없이 30자 이상의 글을 쓰시면 500 point</li>
				<li>기타후기 : 1만원 이하의 상품, 사진 유무 상관없이 30자 미만의 글을 쓰신 분께는 기본마일리지 100 point가 적립됩니다.</li>
				<li>상품후기를 작성은 배송정보상 [출고완료] 이후부터 작성하실 수 있습니다.</li>
				<li>취소/반품의 경우 해당상품의 후기 및 적립된 마일리지는 자동삭제 됩니다.</li>
				<li>3개월 이전 구매상품에 대한 후기는 작성하실 수 없습니다.</li>
				<li>구매 후 3개월이 지난 상품의 후기는 노출되지 않습니다.</li>
				<li>처음 등록한 후기를 기준으로 마일리지가 지급됩니다.</li>
				<li>상품후기 수정을 통해서만 내용 변경이 가능하고 상품후기 삭제시 재작성 및 복구 불가합니다.</li>
			</ul>
		        
		</div>
		
		<div class="order_wrap">
			<ul class="order_lst">
				<li class="thead">
					<div class="in_td">상품명</div>
					<div class="in_td">구매일</div>
					<div class="in_td">상품후기쓰기</div>
				</li>
				<c:if test="${empty list }">
					<li class="my_tbl_info">
						<p>작성할 내역이 없습니다.</p>
					</li>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="data" items="${list }">
						<li class="my_tbl_info">
							<div class="in_td">
								<img src="../image/${data.MAIN_CODENAME }/${data.IMG}">
								<span id="itemName">${data.NAME }</span>
								[Color]<span>${data.COLOR }</span>
								[Size]<span>${data.SIZE1 }${data.SIZE2 }</span>
							</div>
							<div class="in_td">${data.LOGTIME }</div>
							<div class="in_td">
								<input type="button" class="btn_black" value="후기작성">
								<input type="hidden" id="seq" value="${data.SEQ }">
								<input type="hidden" id="serial" value="${data.SERIAL }">
							</div>
						</li>
					</c:forEach>
				</c:if>
			</ul>
			<ul class="order_lst" style="display: none;">
				<li class="thead">
					<div class="in_td">상품명</div>
					<div class="in_td">구매일</div>
					<div class="in_td">상품후기보기</div>
				</li>
				<c:if test="${empty reviewList }">
					<li class="my_tbl_info">
						<p>작성한 내역이 없습니다.</p>
					</li>
				</c:if>
				<c:if test="${not empty reviewList }">
					<c:forEach var="data" items="${reviewList }">
						<li class="my_tbl_info">	
							<div class="in_td">
								<img src="../image/${data.MAIN_CODENAME }/${data.IMG}">
								<span id="itemName">${data.NAME }</span>
								[Color]<span>${data.COLOR }</span>
								[Size]<span>${data.SIZE1 }${data.SIZE2 }</span>
							</div>
							<div class="in_td">${data.LOGTIME }</div>
							<div class="in_td">
								<input type="button" class="btn_black" value="후기보기">
								<input type="hidden" id="seq" value="${data.SEQ }">
								<input type="hidden" id="serial" value="${data.SERIAL }">
							</div>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>		
		
		</section>	<!-- class="my_review" -->
	</ui-my-order-review>
</div>	<!-- class="article_right" -->

<div id="reviewDetail_frame">
	<div id="reviewDetail_dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<h3>상품 후기</h3>
		<div id="reviewStepBox">
			<div id="logtime"><span>작성일</span><span></span></div>
			<div id="star"><span>별점</span><span></span></div>
		</div>
		<div>
			<div id="reviewImg"></div>
			<div id="reviewComments"></div>
		</div>
		<div></div>
	</div>
</div>

</body>
<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(0) > li:eq(2) > a').css('font-weight', '800');
	
	$('.tab ul li').click(function(){
		$('.tab ul li').prop('class','');
		$(this).prop('class','selected');
		
		if($(this).children().eq(0).text()=='작성내역') {
			$('.order_lst:eq(0)').hide();
			$('.order_lst:eq(1)').show();
		}else {
			$('.order_lst:eq(0)').show();
			$('.order_lst:eq(1)').hide();
		}
	});
	
	//후기 작성
	$('.order_lst:eq(0) .btn_black').click(function(){
		var seq = $(this).next().val();
		var serial = $(this).next().next().val();
		
		
	});
	
	
	//후기 상세보기
	$('.order_lst:eq(1) .btn_black').click(function(){
		var seq = $(this).next().val();
		var serial = $(this).next().next().val();
		
		$('#logtime span:eq(1)').text('');
		$('#star span:eq(1) *').remove();
		$('#reviewImg *').remove();
		$('#reviewComments').text('');
		$('#reviewDetail_dialog > div:eq(2) > *').remove();
		//alert('seq='+seq+'&serial='+serial);
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/reviewDetail.do',
			data : 'seq='+seq+'&serial='+serial,
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				$('#reviewDetail_dialog #logtime span:eq(1)').text(data.item_reviewDTO.logtime);
				for(var i=0; i< data.item_reviewDTO.star; i++) {
					$('#reviewDetail_dialog #star span:eq(1)').append($('<i/>',{
						class : 'material-icons',
						text : 'star'
					}));
				}
				for(var i=0; i< 5-data.item_reviewDTO.star; i++) {
					$('#reviewDetail_dialog #star span:eq(1)').append($('<i/>',{
						class : 'material-icons',
						text : 'star_border'
					}));
				}
				
				if(data.item_reviewDTO.item_image!=null) {
					$('#reviewImg').append($('<img/>',{
						src : '../image/review/'+data.item_reviewDTO.item_image
					}));
				
					var imageHeight = $('#reviewImg img').css('height');
					$('#reviewComments').text(data.item_reviewDTO.comments).css('width', '60%');
										
				}else {
					$('#reviewComments').text(data.item_reviewDTO.comments).css('width', '100%');
				}
				
				$('#reviewDetail_dialog > div:eq(2)').append($('<input/>',{
					type : 'button',
					id : 'reviewDetailOkBtn',
					class : 'btn_black',
					value : '확인',
				}));
				
				$('#reviewDetail_frame').show();
			}
		});
	});
	
	$('#dialog_closeBtn').click(function(){
		$('#reviewDetail_frame').hide();
	});
	
	$(document).on('click','#reviewDetailOkBtn',function(){
		$('#reviewDetail_frame').hide();
	});
});
</script>
</html>