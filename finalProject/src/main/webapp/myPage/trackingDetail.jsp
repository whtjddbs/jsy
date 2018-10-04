<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/myDialog.css">
<style type="text/css">
h3.myPage_title {padding-bottom: 10px; border-bottom: 4px solid black; margin: 0px;}

.trackingDetail {position: relative; overflow: hidden; height: auto;}
.trackingDetail h3 {padding-bottom: 10px; border-bottom: 4px solid black; margin: 0px;}
.trackingDetail .stepStatus {margin-top: 84px;}
.trackingDetail .stepStatus ul {display:table;width:100%;margin-top:84px;table-layout:fixed; padding:0px;}
.trackingDetail .stepStatus ul li {display:table-cell;position:relative;text-align:center;vertical-align:middle}
.trackingDetail .stepStatus ul li:last-child {padding-right: 0px;}
.trackingDetail .stepStatus ul li div {position:relative; display:block; text-align:center; width: 80%; padding: 35% 0px; background: #f4f4f4; border-radius: 50%;}
.trackingDetail .stepStatus ul li div.active{background: #303033; color: white;}
.trackingDetail .stepStatus ul li div span {vertical-align: middle; font-size: 16px;}
.trackingDetail .stepStatus ul li:after {
	display:block;clear:both;position:absolute;top:50%;right:4px;width:15px;height:15px;margin-top:-8px;-webkit-transform:rotate(45deg);transform:rotate(45deg);border-top:1px solid #a0a0a0;border-right:1px solid #a0a0a0;content:""
}
.trackingDetail .stepStatus ul li:last-child:after {display: none;}
@media screen and (min-width:541px){
.trackingDetail .stepStatus li[_ngcontent-c10]{padding:0 2%}
.trackingDetail .stepStatus ul li div{display:block;margin:0 auto;padding-top:35%;border-radius:50%;background:#f4f4f4;font-weight:500;font-size:17px;color:#303033;text-align:center}
.trackingDetail .stepStatus ul li div span[_ngcontent-c10]{display:block;position:absolute;top:50%;width:100%;-webkit-transform:translateY(-50%);transform:translateY(-50%);text-align:center}
}

.order_detail {margin-top: 80px;}
.order_detail .order_table {border-top: 4px solid red; border-collapse: collapse;}

.my_info {margin-top: 80px;}
.my_info_table {width:100%; border-collapse: collapse;}
.my_info_table td{padding: 10px 0px 10px 3%; border-bottom: 1px solid #d4d4d4; border-left: 1px solid #d4d4d4;}
.my_info_table td:first-child {border-left: 0px;}

.my_payment {margin-top: 80px;}
.my_payment h3 {padding-bottom: 10px; border-bottom: 4px solid black; margin: 0px;}
.my_payment .my_payment_table {width: 100%; padding: 0px; margin: 0px;}
.my_payment .my_payment_table td{padding: 10px 0px 10px 3%; border-bottom: 1px solid #d4d4d4; border-left: 1px solid #d4d4d4;}
.my_payment .my_payment_table td:first-child {border-left: 0px;}
.my_payment .my_payment_table td * {padding: 10px 0px; margin: 0px;}
.my_payment .my_payment_table td div:nth-child(odd) {width: 30%; float: left;}
.my_payment .my_payment_table td div:nth-child(even) {width: 70%; float: left;}
.my_payment .my_payment_table td:nth-child(3) div:nth-child(odd) {width: 50%; float: left;}
.my_payment .my_payment_table td:nth-child(3) div:nth-child(even) {width: 50%; float: right; text-align: right;}

.my_addr {margin-top: 80px;}
.my_addr .my_addr_table {width: 100%;}
.my_addr .my_addr_table td {padding: 10px 0px 10px 3%; border-bottom: 1px solid #d4d4d4; border-left: 1px solid #d4d4d4;}
.my_addr .my_addr_table td:first-child {width: 15%; border-left: 0px;}
.my_addr .my_addr_table td:nth-child(3) {width: 15%;}
.my_addr .my_addr_table td:nth-child(4) {width: 35%;}

.my_btnbox {margin-top: 80px; text-align: right;}
.btn_black {min-width: 82px;padding: 0 17px;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 40px;}
</style>

<script>
$(document).ready(function(){
	$('#testBtn').click(function(){
		$('#dialog_frame').show();
	});
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
});
</script>

<section class="trackingDetail">
	<h3>주문상세내역</h3>
	<div class="stepbox">
		주문일자 <span>${param.logtime }</span> 주문번호 <span>${param.serial }</span>
	</div>
	<div class="stepStatus">
		<ul>
			<li><div><span>입금대기</span></div></li>
			<li><div><span>결제완료</span></div></li>
			<li><div><span>준비중</span></div></li>
			<!-- <li><div><span>배송시작</span></div></li> -->
			<li><div><span>배송중</span></div></li>
			<li><div><span>배송완료</span></div></li>
		</ul>
	</div>
	<div class="order_detail">
		<table class="tracking_table">
			<thead>
				<tr>
					<td width="70%">상품정보</td>
					<td width="10%">배송비</td>
					<td width="20%">진행상태</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<div class="items">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="my_info">
		<h3>구매자정보</h3>
		<table class="my_info_table">
			<tr>
				<td width="15%">주문자</td>
				<td width="35%">${memberDTO.name }</td>
				<td width="15%">이메일주소</td>
				<td width="35%">${memberDTO.email }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>-</td>
				<td>휴대폰번호</td>
				<td>${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</td>
			</tr>
		</table>
	</div>
	
	<div class="my_payment">
		<h3>최초 결제정보</h3>
		<table class="my_payment_table">
			<tr>
				<td width="33%">
					<h4>상품금액</h4>
					<div>상품합계</div>
					<div>109500원</div>
					<div>배송비</div>
					<div>0원</div>
				</td>
				<td width="33%">
					<h4>할인금액</h4>
					<div>마일리지 사용</div>
					<div>(-)16425원</div>
					<div>쿠폰 사용</div>
					<div>(-)0원</div>
				</td>
				<td width="34%" rowspan="3">
					<div>총 상품가격</div>
					<div>109500원</div>
					<div>할인금액</div>
					<div>(-)16425원</div>
					<div>총 결제금액</div>
					<div>93075원</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>마일리지 적립</div>
					<div>1095 마일리지 적립</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>결제방법</div>
					<div>신용/체크카드 결제일시 2018-08-30 20:38:38</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="my_addr">
		<h3 class="myPage_title">배송지 정보</h3>
		<table class="my_addr_table">
			<tr>
				<td>받는사람</td>
				<td colspan="3">${memberDTO.name }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>-</td>
				<td>휴대폰번호</td>
				<td>${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">${memberDTO.addr1 } ${memberDTO.addr2 }</td>
			</tr>
			<tr>
				<td>배송요청사항</td>
				<td colspan="3"></td>
			</tr>
		</table>
	</div>
	
	<div class="my_btnbox">
		<button id="testBtn" class="btn_black">주문내역서 출력</button>
		<button class="btn_black">영수증 출력</button>
	</div>
	
	<div id="dialog_frame">
		<div id="dialog">
			<i class="material-icons" id="dialog_closeBtn">clear</i>
			테스트 중입니다
		</div>		
	</div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(0) > li:eq(0) > a').css('font-weight', '800');
	
	var sum = 0;
	//주문번호에 해당하는 아이템 로딩
	$('.stepbox').each(function(index){
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/getSerialMapper.do',
			data : {'serial' : $(this).children().last().text() },
			dataType : 'json',
			success : function(data) {
				$.each(data.list, function(index, item){
					$('.items').append($('<div/>',{
						class : 'item'
					}).append($('<div/>',{
						class : 'item_1'
					}).append($('<div/>',{
						class : 'item_image'
					}).append($('<img/>',{
						src : '../image/'+item.MAIN_CODENAME+'/'+item.IMG
					})).append($('<div/>',{
						class : 'item_info'
					}).append($('<div/>',{
						class : 'item_name',
						text : item.NAME
					})).append($('<div/>',{
						class : 'item_size',
						text : '[Size] '+item.SIZE1+item.SIZE2
					})).append($('<div/>',{
						class : 'item_count',
						text : item.PRICE+"원 / 수량 "+item.COUNT+"개"
					}))))).append($('<div/>',{
						class : 'item_2',
						text : '무료배송'
					})).append($('<div/>',{
						class : 'item_3',
					}).append($('<strong/>',{
						text : item.STATUS
					})).append($('<br/>')).append($('<span/>',{
						text : item.PARCEL
					})).append($('<a/>',{
						class : 'searchDelivery',
						href : 'javascript:void(0)',
						text : item.PARCEL_CODE
					}))));
					sum += (parseInt(item.PRICE) * parseInt(item.COUNT));
					
					if(data.list.length==index+1) {
						//최초 결제정보
						$('.my_payment_table tr:eq(0) td:eq(0) div:eq(1)').text(sum+"원");
						$('.my_payment_table tr:eq(1) td:eq(0) div:eq(1)').text((sum*0.01)+" 마일리지 적립");
						$('.my_payment_table tr:eq(0) td:eq(2) div:eq(1)').text(sum+"원");
						$('.my_payment_table tr:eq(0) td:eq(1) div:eq(1)').text('(-)'+item.POINT+'원');
						$('.my_payment_table tr:eq(0) td:eq(2) div:eq(3)').text('(-)'+item.POINT+'원');
						var minus = $('.my_payment_table tr:eq(0) td:eq(1) div:eq(1)').text();
						minus = minus.substring(3,minus.length-1);
						$('.my_payment_table tr:eq(0) td:eq(2) div:eq(5)').text((sum-minus)+"원");
						
						$('.my_addr_table tr:eq(3) td:eq(1)').text(item.COMMENTS);
						
						var status = item.STATUS;
						$('.stepStatus ul li').each(function(index, item){
							$(this).children().eq(0).prop('class','');
							if($(this).find('span').text()==status) {
								$(this).children().eq(0).prop('class','active');
							}
						});
					}
				});
			}
		});
	});
	
	$(document).on('click','.searchDelivery', function(){
		window.open('https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1='+$(this).text()+'&displayHeader=N'
				,"","width=730 height=800 scrollbars=yes");
	});
	
});
</script>