<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/itemList.css">
<link rel="stylesheet" href="../css/myDialog.css">

<style>
.btn_bor {
    display: inline-block;
    width: 161px;
    margin-top: 24px;
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    font-size: 14px;
    color: #5d5d5d;
    line-height: 40px;
    text-align: center;
    box-sizing: border-box;
    padding-right: 20px;
}

#dialog a {
	outline : none;
	text-decoration : none;
}

#loginTitle{
	font-size : 24px;
}

#arrowIcon{
	font-size: 15px;
    position: absolute;
    padding-top: 12px;
    padding-left: 8px;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//왼쪽영역 
	var floatPosition = parseInt($("#floatMenu").css('top'));
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
	//왼쪽영역 태그
	$.ajax({
		type : 'POST',
		url : '/finalProject/new/getSubList.do',
		data : {'main_codename' : '${param.main_codename}'},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>').append($('<a/>', {
						style : 'text-decoration:none; color:black;',
						href : 'javascript:void(0)',
						text : item
				}))).appendTo($('#codename'));
			});
		}
	});
	
	$('#codename').on('click','a',function(){
		var url = '/finalProject/new/itemDisplay.do?main_codename=${param.main_codename}&sub_codename='+$(this).text()+'&pg=1';
		location.href=url;
	});
	
	//위시 리스트 로딩
	if('${memberDTO}'!='') {
		$.ajax({
			type : 'POST',
			url : '/finalProject/member/getWishList.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.wishList, function(index, seq){
					$('#wish'+seq+' > i').prop('class','fas fa-heart');
				});
			}
		});
	}
	
	//위시 리스트 추가
	$(document).on('click','.far.fa-heart',function(){
		var thisisme = $(this).parent().next();
		if('${memberDTO}'=='') $('#dialog_frame').show();
		else {
			$(this).prop('class','fas fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/addWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					thisisme.text(parseInt(thisisme.text())+1);
				}
			});
		}
	});
	//위시 리스트 제거
	$(document).on('click','.fas.fa-heart',function(){
		var thisisme = $(this).parent().next();
		if('${memberDTO}'=='') $('#dialog_frame').show();
		else {
			$(this).prop('class','far fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/deleteWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					thisisme.text(parseInt(thisisme.text())-1);
				}
			});
		}
	});
	
	/* 로그인하러 가기 버튼 눌렀을 때 */
	$('#loginGoBtn').click(function(){
		location.href="/finalProject/member/loginForm.do"
	});
	
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
	
});

</script>

<div id="floatMenu" style="margin-left: 1%; margin-right: 3%;">
	<span><h3>${param.main_codename }</h3></span>
		<div style="width:99%; border:2px solid black;"></div>
	<table class="codename" id="codename">	
	</table>
</div>

<div style="margin-left: 300px; width: 80%; float: left;">
	
	<c:if test="${not empty list }">
		<c:forEach var="data" items="${list }">
			<div class="itemAll">
				<a class="itemA" href="/finalProject/itemView/itemViewTop.do?seq=${data.SEQ }">
					<div class="itemInfo">
						<!-- img -->
						<div class="itemImg">
							<img src="../image/${data.MAIN_CODENAME }/${data.IMG}"/>
						</div>	
						<div class="itemText1">${data.SUB_CODENAME }</div>
						<div class="itemText2">${data.NAME }</div>
						<c:if test="${data.DISCOUNT!=0 }">
							<div class="itemText3" id="itemText3" style="color: #d4d4d4;">${data['PRICE'] }원</div>
							<fmt:parseNumber var="priceDiscount" integerOnly="true" value='${data.PRICE * (1-data.DISCOUNT )}'/>
							<fmt:parseNumber var="discount" integerOnly="true" value='${data.DISCOUNT*100 }'/>												
							<div class="itemText4" id="itemText4" style="font-size: 14px; color: #ff4800;">${discount }% ${priceDiscount}원</div>
						</c:if>
						<c:if test="${data.DISCOUNT==0 }">
							<div class="itemText3" id="itemText3">${data['PRICE'] }원</div>							
						</c:if>					
				</a>
				<!-- 하트 -->
				<a id="wish${data.SEQ }">
					<input type="hidden" id="wish${data.SEQ }" value="${data.SEQ }">
					<i class="far fa-heart" style="color: red;"></i>
				</a>
					<span>${data.COUNT }</span>&emsp;&emsp;
				<!-- 리뷰 -->
				<a>
					<i class="far fa-comment-alt"></i>
				</a>
					<span>${data.REVIEWCOUNT }</span>
				</div>
			</div>
		</c:forEach>
		<div class="paging" id="paging">${itemPaging.pagingHTML }</div>
	</c:if>
</div>

<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div id="loginTitle">로그인하세요</div>
		<a class="btn_bor" id="loginGoBtn">로그인하러 가기
		<!-- <i class="far fa-angle-right" style="font-size:24px;"></i></a> -->
		<i class="material-icons" id="arrowIcon">arrow_forward_ios</i></a>
	</div>
</div>