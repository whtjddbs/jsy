<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트</title>
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
.event_title{
	text-align: center;	
}

.container {
    width: 1200px !important;
    min-width: 1200px !important;
}

.event-list {
    margin-top: 60px;
}

.row {
    list-style: none;
    padding-left: 0;
    margin-bottom: 0;
}

.event-list li {
    margin-bottom: 30px;
}

.col{
	width : 25%;
	float: left;
	position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

.event-list li a {
    position: relative;
    display: block;
}

a {
    color: #337ab7;
    text-decoration: none;
    background-color : transparent;
}

.img_div{
    margin: 0;
    overflow: hidden;
    position: relative;
}

.img{
	max-width : 100%;
	vertical-align : middle;
	border : 0;
	height : 350px;
	width : 500px;
}

.img_in_div{
	display: table;
    position: absolute;
    left: 0;
    bottom: 0;
    height: 60px;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.8);
}

.img_in_div p{
	display: table-cell;
    margin-bottom: 0;
    text-align: center;
    vertical-align: middle;
    font-size: 14px;
    color: #fff;
    line-height: 20px;
}

.eventEndDiv {
	position: absolute;
    font-size: 20pt;
    font-weight: bold;
    color: white;
    top: 0px;
    left: 0px;
    width: 270px;
    height: 350px;
    padding: 150px 0px 0px 45px;
    background-color: rgba(0,0,0,0.8);
}

</style>
</head>
<body>
<div class="event_title">
	<input type="hidden" name="pg" id="pg" value="1">
	<h3 style="margin-bottom:30px;">EVENT</h3>
</div>

<div class="container">
	<div class="event-list">
		<ul class="row">
		</ul>
	</div>
	<div id="pagingDiv" class="paging"></div>
</div>

<!-- 현재 날짜 -->
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	conditionalSearch(1);
	
	function conditionalSearch(pg){
		$.ajax({
			type: 'POST',
			url: '/finalProject/new/eventMainList.do',
			data : 'pg='+pg,
			dataType: 'json',
			success : function(data){
				$('.row li').remove();
				$.each(data.list, function(index, item){
					$('.row').append($('<li/>',{
						class : 'col'													
					}).append($('<a/>',{
						/* class : replay_link, */
						href : "/finalProject/new/eventDetail.do?seq="+item.seq
					}).append($('<div/>',{
						class : 'img_div'
					}).append($('<div/>',{
						class : item.endtime < '${nowDate}' ? 'eventEndDiv' : '', 
						text : item.endtime < '${nowDate}' ? '이벤트 종료 :)' : '',
					})).append($('<img/>',{
						class : 'img',
						src : '../image/event/'+item.img,
					})).append($('<div/>',{
						class : 'img_in_div'
					}).append($('<p/>',{
						text : item.title
					}))))));
				});
				
				$('#pagingDiv').html(data.paging.pagingHTML);
			}
		});
	}
	
	
	//페이지 클릭
	$('#pagingDiv').on('click','span',function(){
		location.href="#"; 
		var pg = $(this).prop('class');
		conditionalSearch(pg);
	});
})
</script>
</body>
</html>