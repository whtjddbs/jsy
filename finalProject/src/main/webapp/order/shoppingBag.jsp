<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.shoppingBag_table{width: 70%;border-collapse: collapse;}
.shoppingBag_table thead td{text-align: center;padding: 10px 0px; border-bottom: 1px solid #d4d4d4;}
.shoppingBag_table tbody td{text-align: center;padding: 10px 0px; border-top: 1px solid #d4d4d4;}
.shoppingBag_table tbody td:nth-child(2) {text-align: left; padding: 10px 0px;}
.shoppingBag_table tbody td img {float: left; width: 90px; vertical-align: middle; padding-right: 30px; }
.shoppingBag_table tbody span.item_name{font-size: 16px; font-weight:900;}
.shoppingBag_table tbody span.originalprice{font-size: 16px; font-weight:900;}

.shoppingBag_Billing {width: 70%;border-collapse: collapse;}
.shoppingBag_Billing thead td{text-align: center;padding: 10px 0px; border-bottom: 1px solid #d4d4d4;}
.shoppingBag_Billing tbody td:nth-child(1) {font-size: 24px; font-weight: 700;}
.shoppingBag_Billing tbody td:nth-child(2) {font-size: 24px; font-weight: 700;}
.shoppingBag_Billing tbody td:nth-child(3) {font-size: 24px; font-weight: 700;}

.shoppingBag_Billing tbody td:nth-child(2):before {float: left;font-size: 24px;font-weight: 900;content: "+";vertical-align: middle;display: block;height: 17px;}
.shoppingBag_Billing tbody td:nth-child(3):before {float: left;font-size: 24px;font-weight: 900;content: "=";vertical-align: middle;display: block;height: 17px;}

.stepbox {border-bottom: 1px solid black; margin: 20px 0px;}
.BuyBtn{background-color:black; border: none; color: white; padding:10px 25px; text-align: center; text-decoration: none; display: inline-block; font-size: 12px; margin: 4px 2px; cursor: pointer;}
.countBtn{background-color: white; border: 1px solid #d4d4d4; color: #d4d4d4; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 9px; margin: 4px 2px; cursor: pointer; }
.payBtn{background-color: white; border: 1px solid #d4d4d4; color: black; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 10px; margin: 4px 2px; cursor: pointer;}
.continueBtn{background-color: white; border: 1px solid #d4d4dr; color: black; padding: 30px 45px; text-align: center; text-decoration: none; display: inline-block; font-size: 15px; margin: 4px 2px; cursor: pointer;}
.checkoutBtn{background-color: black; border: none; color: white; padding: 28px 65px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 4px 2px; cursor: pointer;}

.items{display: block;}
.items .item{border-bottom: 1px solid #d4d4d4; width: 100%; display: inline-block; *display: inline; padding: 10px 0px; }

</style>
<form name="shoppingBag" id="shoppingBag" method="post" action="/finalProject/order/checkout.do">
<section class="shoppingBag">
	<div align="center">
		<h3>
			<span>01 shoppingBag</span> >
			<span>02 order</span> >
			<span>03 order confirmed</span>
		</h3>
		<div style="border-top: 4px solid black; width:70%;"></div>
		<table class="shoppingBag_table">
			<thead>
				<tr>
					<td width="5%"><input type="checkbox" id="checkAll"></td>
					<td width="60%">상품정보</td>
					<td width="10%">수량</td>
					<td width="13%">주문금액</td>
					<td width="12%">배송비</td>
				</tr>
			</thead>
		<c:if test="${not empty list }">
			<c:set var="sum" value="0"/>
			<c:forEach  var="data" items="${list }">
				<tbody>
					<tr>
						<td width="5%"><input type="checkbox" name="checkone" id="checkone"
						class="checkone" value="${data.SEQ }" checked></td>
						<td width="60%" float="left">
							<img src="../image/${data.MAIN_CODENAME }/${data.IMG }"/>
								<span class="item_name">${data.NAME }</span><br>
								<span class="item_originalprice">${data.PRICE}원</span><br>
								<span>옵션:[사이즈]${data.SIZE1 }${data.SIZE2 }</span>
						</td>
						<td width="10%" align="center">
							<button type="button" class="countBtn" id="minBtn">-</button>
							<input size="2" type="text" id="itemCnt" name="itemCnt" value="${data.COUNT }">
							<button type="button" class="countBtn" id="plusBtn">+</button>
						</td>					
						<td width="13%">
							<span id="itemSum">${data.PRICE * data.COUNT }원</span><br>
							<button class="BuyBtn" type="button" id="buyBtn">Buy Now</button>
							<input type="hidden" name="seq" id="seq" value="${data.SEQ }">
							<input type="hidden" name="color" id="color" value="${data.COLOR }">
							<input type="hidden" name="size1" id="size1" value="${data.SIZE1 }">
							<input type="hidden" name="size2" id="size2" value="${data.SIZE2 }">
							<input type="hidden" name="count" id="count" value="${data.COUNT }">
						</td>
						
						<td>
							<span>무료 업체배송</span>
						</td>
					</tr>
				</c:forEach>
			</c:if>
				
			</tbody>
		</table>
	<div align="center" style="border-top:2px solid black; margin-top: 10px; width:70%;"></div>
	<table style="width: 70%; margin-top: 20px;">
		<tbody>
			<tr>
				<td align="left">
					<button type="button" class="payBtn" id='choiceDelete'>선택상품삭제</button>
					<button class="payBtn">품절상품 삭제</button>
				</td>
				<td align="right">
					<span>장바구니는 접속 종료 후 60일 동안 보관됩니다</span>
				</td>
			</tr>
		</tbody>
	</table>
		
		<div align="center" style="border-top: 4px solid black; margin-top: 20px; width:70%;"></div>
	
	<table class="shoppingBag_Billing">
		<thead>
			<tr>
				<td width="30%">총 주문금액</td>
				<td width="31%">총 배송비</td>
				<td width="39%">총 결제금액</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
				<c:set var="sum" value="0"/>
				<c:forEach var="data" items="${list }">
					<c:set var="sum" value="${data.PRICE * data.COUNT }"/>
					<c:set var="totalSum" value="${totalSum+sum }"/>
					<c:set var="totalCount" value="${totalCount+data.COUNT }"/>
				</c:forEach>
				<tr>
					<td id="totalSum1" align="center" style="margin-top: 20px;">
					<fmt:formatNumber pattern="###,###,###원"><c:out value="${totalSum }"/></fmt:formatNumber>
					</td>
					<td align="center" style="margin-top: 20px;">무료 배송</td>
					<td id="totalSum2" align="center" style="margin-top: 20px;">
					<fmt:formatNumber pattern="###,###,###원">
					<c:out value="${totalSum }"/></fmt:formatNumber>					
					</td>
				</tr>
			</c:if>
			<tr>
				<td id="totalCount" align="center" style="font-size: 9pt;">총 ${totalCount }개</td>
			</tr>
			
			<tr style="border-top: 2px solid black;">
				<td align="center" colspan="3">
					<button class="continueBtn" type="button">CONTINUE SHOPPING</button>				
					<button class="checkoutBtn" type="button" id="checkoutBtn">CHECK OUT</button>
				</td>
			</tr>			
		</tbody>
	</table>
</div>
</section>
</form>
<form id="singleForm" action="/finalProject/order/checkout.do" method="POST">
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')){
			$('.checkone').prop('checked', true);
		}else {
			$('.checkone').prop('checked', false);
		}
	});
	$('#choiceDelete').click(function(){
		$('#shoppingBag').prop('action','/finalProject/order/shoppingBagDelete.do');//
		
		var count = $('.checkone:checked').length;
		if(count==0)
			alert("항목을 선택하세요");
		else
			$('#shoppingBag').submit();
	});
	$('.checkone').click(function(){
		totalCalc();
	});
	$('#checkAll').click(function(){
		totalCalc();
	});
	
	//총 계산
	function totalCalc() {
		var sum = 0;
		var count = 0;
		$('.checkone:checked').each(function(index){
			var price = $(this).parent().parent().children().eq(3).children().eq(0).text();
			sum += parseInt(price.substring(0,price.length-1));
			count += parseInt($(this).parent().parent().children().eq(2).children().eq(1).val());
		});
		//alert(sum);
		//alert(count);
		$('#totalSum1').text(sum.toLocaleString()+'원');
		$('#totalSum2').text(sum.toLocaleString()+'원');
		$('#totalCount').text('총 '+count+'개');
	}
	
	//플러스 버튼
	$(document).on('click', '#plusBtn', function(){
		var plusCnt = parseInt($(this).prev().val())+1;
		var price = $(this).parent().parent().children().eq(1).children().eq(3).text();
		price = price.substring(0,price.length-1);
		var sum = parseInt(plusCnt * price);
		$(this).prev().val(plusCnt).text(plusCnt);
		$(this).parent().parent().children().eq(3).children().eq(0).text(sum+'원');
		
		totalCalc();
	});
	//마이너스 버튼
	$(document).on('click', '#minBtn', function(){
		if($(this).next().val()!='1') {
		var minCnt = parseInt($(this).next().val())-1;
		var price = $(this).parent().parent().children().eq(1).children().eq(3).text();
		price = price.substring(0,price.length-1);
		var sum = parseInt(minCnt * price);
		$(this).next().val(minCnt).text(minCnt);
		$(this).parent().parent().children().eq(3).children().eq(0).text(sum+'원');
		
		totalCalc();
		}
	});
	
	$('.BuyBtn').click(function(){
		$('#shoppingBag').prop('action','/finalProject/order/checkout.do');//
		alert($(this).next().val());
		/* var xhr = new XMLHttpRequest();
		xhr.open('POST','/finalProject/order/checkout.do');
		var formData = new FormData();
		formData.append('seq',$(this).next().val());
		formData.append('color',$(this).next().next().val());
		formData.append('size1',$(this).next().next().next().val());
		formData.append('size2',$(this).next().next().next().next().val());
		formData.append('count',$(this).next().next().next().next().next().val());
		xhr.send(formData); */
			
		$('#singleForm').append($('<input/>',{
			type : 'hidden',
			name : 'seq',
			value : $(this).next().val()
		})).append($('<input/>',{
			type : 'hidden',
			name : 'color',
			value : $(this).next().next().val()
		})).append($('<input/>',{
			type : 'hidden',
			name : 'size1',
			value : $(this).next().next().next().val()
		})).append($('<input/>',{
			type : 'hidden',
			name : 'size2',
			value : $(this).next().next().next().next().val()
		})).append($('<input/>',{
			type : 'hidden',
			name : 'count',
			value : $(this).next().next().next().next().next().val()
		}));
		
		$('#singleForm').submit();
		
		
		
		/* $.ajax({
			type : 'POST',
			url : '/finalProject/order/checkout.do',
			data : {'seq' : $('#seq').val(),
					'color' : $('#color').val(),
					'size1' : $('#size1').val(),
					'size2' : $('#size2').val(),
					'count' : $('#count').val()},
			dataType : 'text',
			success : function(data){
				alert(JSON.stringify(data));
			}
		}); */
	});
	
	$('#checkoutBtn').click(function(){
		$('.checkone:not(:checked)').each(function(index){
			$(this).parent().parent().find('input[type="hidden"]').remove();
		});
		
		
		$('#shoppingBag').prop('action','/finalProject/order/checkout.do');
		$('#shoppingBag').submit();
	});
});
</script>
