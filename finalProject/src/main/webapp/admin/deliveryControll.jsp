<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/myDialog.css">
<link rel="stylesheet" href="../css/paging.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.deliveryControll {overflow: visible; width: 100%; min-width:800px; height: auto;}
.deliveryControll ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.deliveryControll ul li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.deliveryControll ul li:first-child {border-bottom: 2px solid black;}
.deliveryControll ul li > div {width: 100%; overflow: visible; height: auto;}
.deliveryControll ul li > div > div {float: left; text-align: center;}
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(1) {width: 5%;} /* 체크박스 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(2) {width: 15%;} /* 주문번호 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(3) {width: 10%;} /* 아이디 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(4) {width: 10%;} /* 이름 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(5) {width: 30%;} /* 주소 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(6) {width: 15%;} /* 전화번호 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(7) {width: 10%;} /* 배송상태 */
.deliveryControll ul li:nth-child(2) {border-bottom: 1px solid black;}
.deliveryControll ul li:nth-child(2)~li {border-bottom: 1px solid #d4d4d4;}

.delivery_step {width: 100%; overflow: hidden; height: auto;}
.delivery_step > * {float: left; margin-right: 20px;}
.delivery_step select {
	width: 150px; /* 원하는 너비설정 */ 
	height: 45px;
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
.delivery_step select::-ms-expand {display:none}

.delivery_step div:last-child {float: right; padding-right: 2%;}
.delivery_step div input {
	width: 150px; /* 원하는 너비설정 */
	height: 45px; 
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit;
	border: 1px solid #999;
}

.btn_black {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.btn_black[disabled] {background: lightgray; border: 1px solid lightgray;}

.delivery_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.delivery_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.delivery_item {cursor: pointer;}

#delivery_item_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#delivery_item_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
#delivery_item_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;}

.items {width: 58%; float: left;height: 300px;overflow: scroll;}
.items .item {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.items .item .item_info {display: block;float: left; vertical-align: middle;}
.items .item .item_info .item_name {font-family: "Do Hyeon"; font-size: 24px; font-weight: 900; padding: 10px 0px; word-wrap: break-word;font-size: 18px;line-height: 24px;font-weight:500; word-wrap: break-word;}
.items .item .item_info .item_size {font-size: 12px; padding-bottom: 10px;}
.itmes .item .item_info .item_count {padding: 10px 0px;}
.items .item .item_image {height: auto; width: 140px;}
.items .item img { float: left; width: 160px; vertical-align: middle; padding: 0px 30px; }

#delivery_item_detail .pay_info {width: 36%; float: right; border-left: 1px solid #d4d4d4; padding: 0px 2%;height: 257px;}
#delivery_item_detail .pay_info > div:nth-child(odd) {float: left; width: 45%; height: 40px; padding-top:10px;}
#delivery_item_detail .pay_info > div:nth-child(even) {float: right; width: 45%; height: 45px; text-align: right; padding-top:5px;}
#delivery_item_detail .pay_info > div:nth-child(4)~div {padding-top:110px;}
#delivery_item_detail .pay_info > div > span {font-family: "Do Hyeon"; font-size: 22pt; font-weight: 700;}
#delivery_item_detail .btn_box {width: 100%; text-align: right;}
.my_btnbox {margin-top: 20px; text-align: right; float:right;padding-right: 2%;}

#inputDialog_frame {
	background-color: rgba(255,255,255,0.5);
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
#inputDialog {
	width: inherit;
    height: inherit;
    padding: 30px 40px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    width: 350px;
    height: 150px;
}
#inputDialog label {width: 30%;}
#inputDialog input {width: 50%;}
#inputDialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
#inputDialog_okBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	left: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
#inputDialog_cancelBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	right: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
</style>

</head>
<body>
<section class="deliveryControll">
	<h3 class="title">배송관리</h3>
	<ul>
		<li>
			<div class="delivery_step">
				<select id="status">
					<option value="">전체</option>
					<option value="입금대기">입금대기</option>
					<option value="결제완료">결제완료</option>
					<option value="준비중">준비중</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
				</select>
				<div>
					<i class="material-icons">date_range</i>&emsp;
					<input type="date" name="startDate" class="datePicker"> ~ 
					<input type="date" name="endDate" class="datePicker">
				</div>
				<div><input type="button" id="deliverySearchBtn" class="btn_black" value="검색"></div>
			</div>
		</li>
		<li>
			<div class="delivery_title">
				<div><input type="checkbox" name="checkAll" id="checkAll"></div>
				<div>주문번호</div>
				<div>아이디</div>
				<div>이름</div>
				<div>주소</div>
				<div>전화번호</div>
				<div>배송상태</div>
			</div>
		</li>
	</ul>
	<div class="my_btnbox">
		<button id="d_complete" class="btn_black" disabled>배송완료</button>
	</div>
	<div id="deliveryControllPaging" align="center" style="padding: 5px 30%;"></div>
</section>
<section id="delivery_item_detail">
	<div class="stepbox">
		주문일자 <span></span> 주문번호 <span></span>
	</div>
	<div class="items">
		<!-- 상품 정보 추가란 -->
	</div>
	<div class="pay_info">
		<div>총 상품가격</div><div><span></span>원</div>
		<div>할인금액</div><div><span></span>원</div>
		<div>총 결제금액</div><div><span></span>원</div>
	</div>
	<div class="btn_box">
		<input type="button" id="d_start" class="btn_black" value="배송시작">
	</div>
</section>
<!-- 날짜 입력 확인 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
		날짜를 입력하지 않았습니다<br>
		기간을 이번달로 설정하시겠습니까?
		<button id="myConfirmDialog_okBtn">확인</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>
<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div></div>
	</div>
</div>
<!-- 날짜 입력 확인 다이얼로그 -->
<div id="inputDialog_frame" style="display: none;">
	<div id="inputDialog">
		<i class="material-icons" id="inputDialog_closeBtn">clear</i>
		<label>택배사</label><input type="text" name="parcel" id="parcel">
		<label>송장번호</label><input type="text" name="parcel_code" id="parcel_code">
		<button id="inputDialog_okBtn">확인</button>
		<button id="inputDialog_cancelBtn">취소</button>
	</div>
</div>
</body>
<input type="hidden" id="checkStatus" value="">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var serial = "";
	var checkStatus = "";
	//체크 박스
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')) {
			$('.check').each(function(index) {
				var status = $(this).parent().parent().children().last().text();
				if(status=='배송중') {
					$(this).prop('checked',true);
				}
			});
			$('#d_complete').prop('disabled', false);
		} else {
			$('.check:checked').prop('checked',false);
			$('#d_complete').prop('disabled', true);
		}
	})
	
	//최초 주문 리스트 불러오기
	conditionalSearch('${param.pg}');
	
	//주문 리스트 클릭시
	$('.deliveryControll').on('click','.delivery_item > *:not(:has(input.check))',function(){
		if($(this).parent().next().prop('tagName')=='SECTION') {
			$('#delivery_item_detail').hide();
			$('.deliveryControll').append($('#delivery_item_detail'));
			return true;
		}
		
		$('#delivery_item_detail').hide();
		$(this).parent().parent().append($('#delivery_item_detail'));
		
		serial = $(this).parent().children().eq(1).text();
		var sum = 0;
		
		checkStatus = $(this).parent().children().last().text();
		if(checkStatus=='준비중')
			$('#d_start').prop('disabled', false);
		else
			$('#d_start').prop('disabled', true);
		
		$.ajax({
			type : 'POST',
			url : '/finalProject/admin/deliveryDetail.do',
			data : {'serial' : serial},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('#delivery_item_detail .items .item').remove();
				
				var date = new Date(data.logtime);
				$('#delivery_item_detail > .stepbox span:eq(0)').text(jsonDateFormat(date));
				$('#delivery_item_detail > .stepbox span:eq(1)').text(serial);
				
				$.each(data.list, function(index, item){
					$('#delivery_item_detail .items').append($('<div/>',{
						class : 'item'
					}).append($('<div/>',{
						class : 'item_image'
					}).append($('<img/>',{
						src : "../image/"+item.MAIN_CODENAME+"/"+item.IMG
					}))).append($('<div/>',{
						class : 'item_info'
					}).append($('<div/>',{
						class : 'item_name',
						text : item.NAME
					})).append($('<div/>',{
						class : 'item_size',
						text : '[Color] '+item.COLOR+'   [Size] '+item.SIZE1+item.SIZE2
					})).append($('<div/>',{
						class : 'item_count',
						text : item.PRICE+"원 / 수량 "+item.COUNT+"개"
					}))));
					sum += item.PRICE;
				});
				
				$('#delivery_item_detail > .pay_info span:eq(0)').text(sum);
				$('#delivery_item_detail > .pay_info span:eq(1)').text('(-) 0');
				$('#delivery_item_detail > .pay_info span:eq(2)').text(sum);
				
				if(data.list.length == '1') {
					$('#delivery_item_detail .items').css('border-right', '0px');
					$('#delivery_item_detail .pay_info').css('border-left', '1px solid #d4d4d4');
				}else {
					$('#delivery_item_detail .items').css('border-right', '1px solid #d4d4d4');
					$('#delivery_item_detail .pay_info').css('border-left', '0px');					
				}
			}
		});
		
		$('#delivery_item_detail').slideToggle();
	});
	
	//시작날짜 수정시
	$("[name='startDate']").change(function(){
		if($("[name='endDate']").val()=='')
			$("[name='endDate']").val($("[name='startDate']").val());
	});
	$("[name='endDate']").change(function(){
		if($("[name='startDate']").val()=='')
			$("[name='startDate']").val($("[name='endDate']").val());
	});
	
	//검색 버튼 클릭시
	$('#deliverySearchBtn').click(function(){
		if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()=='') {
			$('#myConfirmDialog_frame').show();
			return true;
		}else if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()!='')
			$('[name="startDate"]').val($('[name="endDate"]').val());
		else if($('[name="startDate"]').val()!='' && $('[name="endDate"]').val()=='')
			$('[name="endDate"]').val($('[name="startDate"]').val());
		
		conditionalSearch(1);
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	$('#myConfirmDialog_okBtn').click(function() {
		$('#myConfirmDialog_frame').hide();
		conditionalSearch(1);
	});
	
	//조건 검색
	function conditionalSearch(pg) {
		if($('[name="startDate"]').val()=='') setThisMonth();
		
		$('#checkAll').prop('checked',false);
		$.ajax({
			type : 'POST',
			url : '/finalProject/admin/getDeliveryList.do',
			data : {'startDate' : $("[name='startDate']").val(),
					'endDate' : $("[name='endDate']").val(),
					'status' : $('#status').val(),
					'pg' : pg},
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				$('#delivery_item_detail').hide();
				$('.deliveryControll').append($('#delivery_item_detail'));
				$('li:has(.delivery_item)').remove();
				
				$.each(data.list,function(index, item){
					$('<li/>').append($('<div/>',{
						class : 'delivery_item'
					}).append($('<div/>').append($('<input/>',{
						type : 'checkbox',
						name : 'check',
						class : 'check',
						value : item.serial
					}))).append($('<div/>',{
						text : item.serial
					})).append($('<div/>',{
						text : item.id
					})).append($('<div/>',{
						text : item.name
					})).append($('<div/>',{
						style : 'text-align:left;',
						text : '['+item.zipcode+'] '+item.addr1+' '+item.addr2
					})).append($('<div/>',{
						text : item.tel1+'-'+item.tel2+'-'+item.tel3
					})).append($('<div/>',{
						text : item.status
					}))).appendTo($('.deliveryControll ul'));
				});
				
				//페이징
				$('#deliveryControllPaging').html(data.paging.pagingHTML);
			}				
		});
	}
	
	//json Date to YYYY-MM-DD
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	function setThisMonth() {
		var now = new Date();
		var startDate = new Date(now.getYear()+1900, now.getMonth(), 1);
		var endDate = new Date(now.getYear()+1900, now.getMonth()+1, 0);
		
		$("[name='startDate']").val(jsonDateFormat(startDate));
		$("[name='endDate']").val(jsonDateFormat(endDate));
	}
	
	//준비중 -> 배송중 변경 
	$('#d_start').click(function(){
		$('#inputDialog_frame').show();
	});
	$('#inputDialog_okBtn').click(function(){	
		//alert(checkStatus);
		
		$.ajax({
			type : 'POST',
			url : '/finalProject/admin/changeDeliveryStatus.do',
			data : {'checkStatus' : '준비중'
					,'parcel' : $('#parcel').val()
					,'parcel_code' : $('#parcel_code').val()
					,'serial' : serial},
				dataType : 'json',
				success : function(data) {
					conditionalSearch($('#currentPaging').text());
					$('#d_ing').prop('disabled', true);
					$('#d_complete').prop('disabled', true);
					$('#inputDialog_frame').hide();
				}
		});
	});
	
	//배송중 -> 배송완료 변경
	$('#d_complete').click(function(){
		if($('.check:checked').length==0) {
			$('#dialog > div').text('체크한 항목이 없습니다');
			$('#dialog_frame').show();
		}else {
			var datalist = [];
			$('.check:checked').each(function(index){
				datalist.push($(this).val());
			});
			
			$.ajax({
				type : 'POST',
				url : '/finalProject/admin/changeDeliveryStatus.do',
				data : {'check' : datalist, 'checkStatus':'배송중'},
				dataType : 'json',
				success : function(data) {
					conditionalSearch($('#currentPaging').text());
					$('#d_ing').prop('disabled', true);
					$('#d_complete').prop('disabled', true);
				}
			});
		}
	});
	
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
	$('#inputDialog_closeBtn, #inputDialog_cancelBtn').click(function(){
		$('#inputDialog_frame').hide();
	});
	
	
	//배송상태가 다른 주문번호 체크 시 경고
	$('.deliveryControll').on('click','.check',function(){
		var nowStatus = $(this).parent().parent().children().last().text();
		if($('.check:checked').length==0) {
			$('#checkStatus').val('');
			$('#d_ing').prop('disabled', true);
			$('#d_complete').prop('disabled', true);
		}else if($('.check:checked').length==1) {
			$('#checkStatus').val(nowStatus);
			if($('#checkStatus').val()=='준비중') $('#d_ing').prop('disabled', false);
			else if($('#checkStatus').val()=='배송중') $('#d_complete').prop('disabled', false);
		}else {
			if($('#checkStatus').val()!=nowStatus) {
				$('#dialog > div').text('서로 다른 배송상태의 항목을 선택하였습니다');
				$('#dialog_frame').show();
				$(this).prop('checked', false);
			}
		}
	});
	
	//페이지 클릭
	$('#deliveryControllPaging').on('click','span',function(){
		var pg = $(this).prop('class');
		conditionalSearch(pg);
	});
});
</script>
</html>
