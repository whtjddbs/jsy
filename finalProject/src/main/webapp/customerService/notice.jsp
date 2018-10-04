<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
.noticeContent{
	background-color : #EAEAEA;
	width: 100%;
	margin : 0px;
	text-align: center;
	display: none;
}
</style>
</head>

<div class="notice">
	<input type="hidden" name="pg" id="pg" value="1">
	<h3>공지사항</h3>
	<div class="notice_tab" style="margin-top: 40px; border-bottom: 4px solid #000; padding: 10px 0px 0px 0px;">
		<ul>
			<li class="notice_selected" rel="notice_my_tab1" style="display: inline-block; font-size: 14px; font-weight: 500; color:#fff; padding: 0 30px; line-height: 48px; border: 1px solid #d4d4d4; border-color: #000; background: #000;">공지사항</li>
		</ul>
	</div>
	<div class="notice_tab_list"  >
		<div class="notice_tab_tit" style="border-bottom: 1px solid #000; font-weight: 700;">
			<div class="notice_tab_info" style="width : 100%; padding: 10px 0; display: table;">
				<strong class="type" style="width: 20%; display: table-cell; min-width: 100px; float: left; padding-left: 50px;">번호</strong>
				<strong class="tit" style="width: 60%; display: table-cell; float: left;">제목</strong>
				<strong class="date" style="width: 20%; display: table-cell; float: left;">등록일</strong>
			</div>
		</div>
	</div>
	
	<div class="notice_tab_container">
		<div id="tab1" class="notice_my_tab1" style="border-bottom: 1px solid #000;">
			<!-- 여기에 공지사항 내용을 뿌릴거야. -->
		</div>
		<div align=center id="noticePagingDiv" style="padding-top: 20px;"></div>
	</div>
	
	
	<c:if test="${memberDTO.code == 9 }">
		<div style="background: #000; width: 80px; float: right; margin-right: 80px;">
			<input type="button" id="noticeWrite" value="글쓰기" style="background: #000; color: #fff; border: none; line-height: 50px; padding-left: 20px;">
		</div>
	</c:if>
	
</div><!-- notice -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'POST',
		url: '/finalProject/customerService/noticeList.do',
		data : 'pg=${param.pg}',
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('.notice_my_tab1 *').remove();
			$.each(data.list, function(index, item){
				$('.notice_my_tab1').append($('<div/>',{
					id : 'viewNoticeList',
					style: "border-bottom: 1px solid lightgray; padding: 10px 0; height: auto; overflow: hidden;"
				}).append($('<span/>',{		
					style : 'width: 20%; display: table-cell; min-width: 100px; float: left; padding-left: 50px;',
					html : item.seq
				})).append($('<span/>',{
					style : 'width: 60%; display: table-cell; float: left; cursor: pointer;',
					html : item.title
				})).append($('<span/>',{
					style : 'width: 20%; display: table-cell; float: left;',
					html : item.logtime
				}))).append($('<div/>',{
					class : 'noticeContent',
					html : item.content
				}).append($('<div/>',{
					style: 'padding-bottom: 10px;'
				}).append($('<input/>',{
					type: 'button',
					value : '글수정',
					id : 'noticeChange',
					style : 'background: #000; color: #fff; width: 100px; border: none; line-height: 40px; margin-right: 10px;'
				})).append($('<input/>',{
					type: 'button',
					value: '글삭제',
					id : 'noticeDelete',
					style : 'background: #000; color: #fff; width: 100px; border: none; line-height: 40px;'
				}))));
			});
			$('#noticePagingDiv').html(data.noticePaging.pagingHTML);
		}//success
	});
	
	$('body').on('click','#viewNoticeList',function(){
		$(this).next().slideToggle();
	});
	
	$('#noticeWrite').click(function(){
		location.href="/finalProject/admin/noticeWriteForm.do";
	});
	
	$('body').on('click','#noticeDelete', function(){
		//alert($(this).parent().parent().prev().children().eq(0));
		var seq = $(this).parent().parent().prev().children().eq(0).text();
		location.href="/finalProject/admin/noticeDelete.do?seq="+seq;
	});
	
	$('body').on('click','#noticeChange', function(){
		var seq = $(this).parent().parent().prev().children().eq(0).text();
		location.href="/finalProject/admin/noticeModifyForm.do?seq="+seq;
	});
});
</script>
</html>