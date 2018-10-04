<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.itemControll {overflow: visible; width: 100%; min-width:800px; height: auto;}
.itemControll > ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.itemControll > ul > li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.itemControll > ul > li:first-child {border-bottom: 2px solid black;}
.itemControll > ul > li > div {width: 100%; overflow: visible; height: auto;}
.itemControll > ul > li > div > div {float: left; text-align: center;}
.itemControll > ul > li > div > div:nth-child(1) {width: 10%;} /* 상품번호 */
.itemControll > ul > li > div > div:nth-child(2) {width: 10%;} /* 아이디 */
.itemControll > ul > li > div > div:nth-child(3) {width: 8%;} /* 상품분류 */
.itemControll > ul > li > div > div:nth-child(4) {width: 20%;} /* 상품명 */
.itemControll > ul > li > div > div:nth-child(4) {width: 10%;} /* 카테고리 */
.itemControll > ul > li > div > div:nth-child(5) {width: 30%;} /* 내용 */
.itemControll > ul > li > div > div:nth-child(6) {width: 8%;} /* 이미지 */
.itemControll > ul > li > div > div:nth-child(7) {width: 8%;} /* 등록일 */
.itemControll > ul > li:nth-child(1) {border-bottom: 1px solid black;}
.itemControll > ul > li:nth-child(1)~li {border-bottom: 1px solid #d4d4d4;}


.btn_black {width: 150px;padding: .6em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.btn_black[disabled] {background: lightgray; border: 1px solid lightgray;}

.item_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.item_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.my_btnbox {margin-top: 10px; text-align: right;}

#item_review{
	cursor : pointer;
}

.item_comments{
	text-overflow: ellipsis;
	overflow : hidden;
	white-space: nowrap;
}

.item_comments_view {
    height: auto;
    white-space: normal;
    text-overflow: clip;
}
</style>

<section class="itemControll">
	<h3 class="title">상품후기 목록</h3>
	<ul>
		<li>
			<div class="item_title">
				<div>상품번호</div>
				<div>아이디</div>
				<div>상품분류</div>
				<div>상품명</div>
				<div>내용</div>
				<div>이미지</div>
				<div>등록일</div>
			</div>
		</li>
	</ul>
	<!-- <div class="my_btnbox">
		<button type="button" class="btn_black" id="itemAddBtn">상품등록</button>
		<button type="button" class="btn_black" id="checkDelete">선택삭제</button>
	</div> -->
	<div class="reviewList_container">
		<div class="reviewList"></div>
		<div id="paging" align="center" style="padding: 5px 30%;"></div>
	</div>
</section>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//리스트 불러오기
	itemReview('${param.pg}');
	
	function itemReview(pg) {
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/itemReviewListShow.do",
			data : {'pg':pg},
			dataType : "json",
			success : function(data){
				$('li:has(.item_review)').remove();
				
				$.each(data.list,function(index,item){
					$('<li/>').append($('<div/>',{
						id : 'item_review'
					}).append($('<div/>',{
						text : item.SERIAL
					})).append($('<div/>',{
						text : item.ID
					})).append($('<div/>',{
						text : item.MAIN_CODENAME
					})).append($('<div/>',{
						text : item.NAME
					})).append($('<div/>',{
						class : 'item_comments',
						text : item.COMMENTS
					})).append($('<div/>',{
						text : item.ITEM_IMAGE==null ? '-':item.ITEM_IMAGE
					})).append($('<div/>',{
						id : 'sysdate',
						text : jsonDateFormat(new Date(item.LOGTIME))
					}))).appendTo($('.itemControll ul'));
				});
				
				$('#paging').html(data.paging.pagingHTML);
			}
		});
	}
	
	//리뷰 자세히보기
	$('body').on('click','#item_review',function(){
		if($(this).children().eq(4).prop('class') == 'item_comments_view'){ // 줄이기
			$(this).children().eq(4).prop('class','item_comments');
			$(this).parent().css('background-color','');
		}else{
			$(this).children().eq(4).prop('class','item_comments_view').show(); //늘리기
			$(this).parent().css('background-color','#EAEAEA');
		}
	});
 
	
	//페이지 클릭
	$('#paging').on('click','span',function(){
		location.href="#"; 
		var pg = $(this).prop('class');
		itemReview(pg);
	});
	
	
	//json Date to YYYY-MM-DD
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
});
</script>