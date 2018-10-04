<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section _myPage class="my_order">
	<span style="display: inline; float:right; right: 100%; cursor: pointer;">더보기 ></span>
	<h3 style="display: inline; float:left; margin: 0px; padding-bottom: 10px;">최근 주문</h3>
	<div style="margin-top: 30px;">
	<table class="my_order_table" style="width: 100%;">
		<thead>
			<tr>
				<td width="15%">주문일</td>
				<td width="50%">주문내역</td>
				<td width="20%">주문번호</td>
				<td width="15%">결제금액</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr style="border-top: 1px solid black;">
					<td colspan="4" align="center">최근 주문내역이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:set var="serial" value="0"/>
				<c:forEach var="data" items="${list }">
					<c:if test="${data.SERIAL != serial }">
						<tr class="order_list">
							<td>
								<fmt:formatDate value="${data.LOGTIME}" pattern="yyyy-MM-dd"/>
							</td>
							<td><img src="../image/${data.MAIN_CODENAME }/${data.IMG}"> ${data.NAME } / ${data.COLOR }</td>
							<td>${data.SERIAL }</td>
							<td>${data.PRICE * data.COUNT }원</td>
						</tr>
					<c:set var="serial" value="${data.SERIAL }"/>
					</c:if>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</div>
</section>
<section _myPage class="my_heart">
	<span style="display: inline; float:right; right: 100%; cursor: pointer;">더보기 ></span>
	<h3 style="display: inline; float:left; margin: 0px;">MY HEART</h3>
	<div style="border-top: 4px solid black; margin-top: 30px;">
	<h4 style="padding-bottom: 5px;">products</h4>
		<c:if test="${empty wishList }">
			<div class="no_heart_list">추가한 찜 목록이 없습니다</div>		
		</c:if>
		<c:if test="${not empty wishList }">
		<ul class="heart_list">
			<c:forEach var="data" items="${wishList }">
				<li>
					<input type="hidden" id="item_seq" value="${data.seq }">
					<img src="../image/${data.main_codename }/${data.img}">
					<p>${data.name }</p>
				</li>
			</c:forEach>
		</ul>
		</c:if>
	</div>
</section>

<script type="text/javascript" src="../js/myDate.js"></script>
<script>
$(document).ready(function(){
	//주문내역 상세보기
	$('.my_order_table').on('click','.order_list',function(){
		var serial = $(this).children().eq(2).text();
		var logtime = $(this).children().eq(0).text();
		location.href='trackingDetail.do?serial='+serial+'&logtime='+logtime;
	});
	
	//주문내역 더보기
	$('.my_order span:eq(0)').click(function(){
		location.href='tracking.do';
	});
	
	//위시리스트 더보기
	$('.my_heart span:eq(0)').click(function(){
		location.href='wishList.do?pg=1';
	});
	
	//위시리스트 상품보기
	$('.heart_list li').click(function(){
		location.href='/finalProject/itemView/itemViewTop.do?seq='+$(this).find('input').val();
	});
	
	$('.order_list').each(function(index){
		var name = $(this).children().eq(1);
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/getSerialCount.do',
			data : {'serial' : $(this).children().eq(2).text()},
			dataType : 'json',
			success : function(data) {
				if(data.count > 1) 
					name.append($('<span/>',{
						text : ' 외 '+(data.count-1)+'건'
					}));
			}
		});
	});
});
</script>