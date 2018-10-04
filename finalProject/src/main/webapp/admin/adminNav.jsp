<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminMenu {width: 200px; height: auto; margin-left: 10px; position: absolute; top: 300px;}
.adminMenu h4 {border-bottom: 4px solid black; font-size: 24px; font-weight: 900; padding-bottom: 10px;}
.adminMenu a {text-decoration: none; color: #5d5d5d; font-size: 16px;}
</style>
</head>
<body>
<div class="adminMenu">
	<h4>관리자 메뉴</h4>
	<ul>
		<li><a href="/finalProject/admin/itemControll.do">재고 관리</a></li>
		<li><a href="/finalProject/admin/deliveryControll.do">배송 관리</a></li>
		<li><a href="/finalProject/admin/refundControll.do">취소/교환/반품 관리</a></li>
		<li><a href="/finalProject/admin/salesMgmt.do">매출 관리</a></li>
		<li><a href="/finalProject/admin/notice.do">공지사항</a></li>
		<li><a href="/finalProject/admin/eventAdd.do">이벤트 등록</a></li>
		<li><a href="/finalProject/admin/itemReviewList.do">상품후기 목록</a></li>
		<li><a href="/finalProject/admin/itemQnA.do">상품Q&A 목록</a></li>
	</ul>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	var menuTop = parseInt($('.adminMenu').css('top'));
	
	$(window).scroll(function(){	
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + menuTop + "px";
		
		var menuBottom = parseInt($('.adminMenu').css('bottom'));
		$(".adminMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
});
</script>
</html>