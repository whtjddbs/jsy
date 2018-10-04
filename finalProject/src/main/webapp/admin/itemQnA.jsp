<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet" href="../css/myDialog.css">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.itemControll {overflow: visible; width: 100%; min-width:800px; height: auto;}
.itemControll > ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.itemControll > ul > li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px;}
.itemControll > ul > li:first-child {border-bottom: 2px solid black;}
.itemControll > ul > li > div {width: 100%; overflow: visible; height: auto;}
.itemControll > ul > li > div > div {float: left; text-align: center;}
.itemControll > ul > li > div > div:nth-child(1) {width: 8%;} /* 상품번호 */
.itemControll > ul > li > div > div:nth-child(2) {width: 10%;} /* 아이디 */
.itemControll > ul > li > div > div:nth-child(3) {width: 10%;} /* 상품분류 */
.itemControll > ul > li > div > div:nth-child(4) {width: 20%;} /* 상품명 */
.itemControll > ul > li > div > div:nth-child(5) {width: 10%;} /* 카테고리 */
.itemControll > ul > li > div > div:nth-child(6) {width: 22%;} /* 내용 */
.itemControll > ul > li > div > div:nth-child(7) {width: 12%;} /* 등록일 */
.itemControll > ul > li > div > div:nth-child(8) {width: 8%;} /*  */
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


.item_reply{
	background-color : #EAEAEA;
	width: 100%;
	margin : 0px;
	display: none;
	text-align: left;
	padding-left: 40px;
}

.liChk{
	background-color : #EAEAEA;
}

.replyContent {
	outline: none; 
	border: 0px; 
	background-color: inherit;
}

</style>

<section class="itemControll">
	<h3 class="title">상품Q&A 목록</h3>
	<ul>
		<li>
			<div class="item_title">
				<div>상품번호</div>
				<div>아이디</div>
				<div>상품분류</div>
				<div>상품명</div>
				<div>카테고리</div>
				<div>내용</div>
				<div>등록일</div>
				<div></div>
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

<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div></div>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//리스트 불러오기
	itemReview('${param.pg}');
	
	function itemReview(pg) {
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/itemQnAList.do",
			data : {'pg':pg},
			dataType : "json",
			success : function(data){
				$('li:has(.item_review)').remove();
				
				$.each(data.list,function(index,item){
					$('<li/>').append($('<div/>',{
						id : 'item_review'
					}).append($('<div/>',{
						text : item.ITEM_SEQ
					})).append($('<div/>',{
						text : item.ID
					})).append($('<div/>',{
						text : item.MAIN_CODENAME
					})).append($('<div/>',{
						text : item.NAME
					})).append($('<div/>',{
						text : item.CATEGORY
					})).append($('<div/>',{
						class : 'item_comments',
						text : item.COMMENTS
					})).append($('<div/>',{
						id : 'sysdate',
						text : jsonDateFormat(new Date(item.LOGTIME))
					})).append($('<input/>',{
						type : 'hidden',
						id : 'seq',
						value : item.SEQ 
					})).append($('<input/>',{
						type : 'button',
						class : 'btn_black',
						id : 'replyBtn',
						style : 'width : 80px;',
						value : '답글'
					}))).append($('<div/>',{
						class : 'item_reply'
					}).append($('<span/>',{
						style : 'color : blue;text-align: left;padding-right: 1220px;',
						text : '답변'
					})).append($('<textarea/>',{
						class : 'replyContent',
						cols : '150px',
						style: 'outline:none;text-align: left;margin-top:10px; height:auto; overflow:visible;',
						text : item.REPLY
					}))).appendTo($('.itemControll ul'));
				});
				
				$('#paging').html(data.paging.pagingHTML);
			}
		});
	}
	
	//리뷰 자세히보기
	$('body').on('click','#item_review > div',function(){
		$(this).next().children().eq(1).css('height', ht);
		if($(this).parent().prop('class') == 'liChk'){ // 줄이기
			$(this).parent().next().hide();
			$(this).parent().prop('class','');
			$(this).parent().parent().css('background-color','');
		}else{
			$(this).parent().next().show(); //늘리기
			$(this).parent().prop('class','liChk');
			$(this).parent().parent().css('background-color','#EAEAEA');
		}
		
		var ht = $(this).parent().next().children().eq(1).prop('scrollHeight');
		$(this).parent().next().children().eq(1).height(ht);
	});
	
	//리뷰 답글달기
	$('body').on('click','#replyBtn',function(){
		var thisisme = $(this);
		 if($(this).parent().next().children().eq(1).prop('class')=='replyContent'){ //답글 눌렀을 떄
			if($(this).parent().parent().prop('class') != 'liChk') {
				$(this).parent().next().show(); //늘리기
				$(this).parent().parent().css('background-color','#EAEAEA');
			}
			$(this).parent().next().children().eq(1).prop('class','');
			$(this).val('수정');
			
		}else{
			$.ajax({
				type : "POST",
				url : "/finalProject/admin/itemQnAModify.do",
				data : {'reply':thisisme.parent().next().children().eq(1).val()
					   ,'seq':thisisme.prev().val()
					   ,'item_seq':thisisme.parent().children().eq(0).text()},
				dataType : "json",
				success : function(data){
					$('#dialog > div').text('정상적으로 수정되었습니다.');
	 				$('#dialog_frame').show();
				}
			});
			$(this).parent().next().hide(); //줄이기
			$(this).parent().next().children().eq(1).prop('class','replyContent');
			$(this).parent().prop('class','');
			$(this).parent().parent().css('background-color','');
			$(this).val('답글');
		}
		 
		var ht = $(this).parent().next().children().eq(1).prop('scrollHeight');
		$(this).parent().next().children().eq(1).height(ht);
		
	}); 
	
	$(document).on('keydown', 'textarea', function(e) {
		/* var row = $(this).prop('rows');
		alert(row);
		if(e.which==13) {
			$(this).prop('rows', row+1);
		} */
		$(this).height(1).height( $(this).prop('scrollHeight')+14);
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
	
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
});
});
</script>