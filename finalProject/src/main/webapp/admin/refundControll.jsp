<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.deliveryControll {overflow: hidden; width: 100%; height: auto;}
.deliveryControll ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%;}
.deliveryControll ul li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.deliveryControll ul li:first-child {border-bottom: 2px solid black;}
.deliveryControll ul li > div {width: 100%; overflow: visible; height: auto; text-align: center;}
.deliveryControll ul li > div > div {float: left; text-align: center;}
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(1) {width: 5%;} /* 체크박스 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(2) {width: 15%;} /* 주문번호 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(3) {width: 25%;} /* 접수제목 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(4) {width: 10%;} /* 접수일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(5) {width: 10%;} /* 진행상태 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(6) {width: 10%;} /* 완료일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(7) {width: 10%;} /* 구분 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(8) {width: 10%; text-align: center;} /* 완료버튼 */
.deliveryControll ul li:nth-child(2) {border-bottom: 1px solid black;}
.deliveryControll ul li:nth-child(2)~li {border-bottom: 1px solid #d4d4d4;}

.delivery_step {width: 100%; overflow: hidden; height: auto;}
.delivery_step > * {float: left; margin-right: 20px;}
.delivery_step select {
	width: 150px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: ; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
.delivery_step select::-ms-expand {display:none}

.delivery_step div:last-child {float: right; padding-right: 2%;}
.delivery_step div input {
	width: 150px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit;
	border: 1px solid black; 
}

.btn_white {width: 70px; padding: 3px 0px; border: 1px solid black; background: white; font-size: 13px; line-height: 20px; border-radius: 10px; margin-top: -5px; outline: none; cursor: pointer;}
.CompletedBtn {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.searchBtn {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.btn_white[disabled] {background: lightgray; border: 1px solid lightgray;}

.delivery_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.delivery_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.delivery_item {cursor: pointer;}
.delivery_item > div:first-child {cursor: default;}
.delivery_item > div:last-child {cursor: default;}

#delivery_item_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#delivery_item_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
 #delivery_item_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;} 

.items {width: 37%; float: left;}
.items .item {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.items .item .item_info {display: block;float: left; vertical-align: middle;}
.items .item .item_info .item_name {font-family: "Do Hyeon"; font-size: 24px; font-weight: 900; padding: 10px 0px; word-wrap: break-word;font-size: 18px;line-height: 24px;font-weight:500; word-wrap: break-word;}
.items .item .item_info .item_size {font-size: 12px; padding-bottom: 10px;}
.itmes .item .item_info .item_count {padding: 10px 0px;}
.items .item .item_image {height: auto; width: 140px;}
.items .item img { float: left; width: 80px; vertical-align: middle; padding: 0px 30px; }

.refund_reason {width: 57%; float: right; border-left: 1px solid #d4d4d4; padding: 0px 2%; overflow: visible; height: auto;}
.refund_reason > div:first-child {font-family: "Do Hyeon"; font-size: 22pt; font-weight: 700;}
.refund_reason > div:nth-child(2) {float: left; width: 30%; height: 45px; text-align: right; padding-top:5px; overflow: visible; height: auto;}
.refund_reason > div:nth-child(2) > img {width: 100%;}
.refund_reason > div:nth-child(3) {float: right; width: 68%; height: 45px; text-align: left; padding-top:5px; overflow: visible; height: auto;}
.refund_reason > div > span {float: left; width: 100%; height: 40px; padding-top:10px; border-bottom: 2px;}

.my_btnbox {margin-top: 20px; text-align: right; padding-right: 1%;}


#dialog_frame {
	background-color: transparent;
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
#dialog {
	width: inherit;
    height: inherit;
    padding: 50px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    min-width: 300px;
}
#dialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}


#currentPaging{
	border-bottom: 1.5px solid #000;
	cursor: pointer;
	font-weight: 700;
    color: #000;
    text-decoration:none;
	padding: 1px;
	margin: 10px;
}
#paging{
	text-decoration: none;
	cursor: pointer;
	color: #bcafaf;
	text-decoration:none;
	padding: 1px;
	margin: 10px;
}


.my_btnbox {margin-top: 20px; text-align: right;}

#myConfirmDialog_frame {
	background-color: rgba(255,255,255,0.8);
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
#myConfirmDialog {
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
#myConfirmDialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
#myConfirmDialog_okBtn {
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
#myConfirmDialog_cancelBtn {
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
		<h3 class="title">취소/반품/교환 관리</h3>
		<ul>
			<li>
				<div class="delivery_step">
					<select id="status">
						<option value="">전체</option>
						<option value="진행중">진행중</option>
						<option value="완료">완료</option>
					</select>
					<div><i class="material-icons">date_range</i>&emsp;<input type="date" name="startDate" class="datePicker"> ~ <input type="date" name="endDate" class="datePicker"></div>
					<div><input type="button" name="searchBtn" class="searchBtn"  value="검색" ></div>
				</div>
			</li>
			
			<li>
				<div class="delivery_title">
					<div><input type="checkbox" name="checkAll" id="checkAll"></div>
					<div>주문번호</div>
					<div>접수제목</div>
					<div>접수일자</div>
					<div>진행상태</div>
					<div>완료일자</div>
					<div>구  분</div>
					<div></div>
				</div>
			</li>
		</ul>
		<div class="my_btnbox">
			<button class="CompletedBtn">완료</button>
		</div>
	</section>
	 <section id="delivery_item_detail">
		<div class="stepbox">
			주문일자 <span></span> 주문번호 <span></span>
		</div>
		<div class="items">
			<div class="item">
				<div class="item_image">
					<img>
				</div>
				<div class="item_info">
					<div class="item_name"></div>
					<div class="item_size"></div>
					<div class="item_count"></div>
				</div>
			</div>
		</div>
		<div class="refund_reason"></div>
	</section>
	<div id="deliveryControllPaging" align="center" style="padding: 5px 30%;"></div>
	
	<div id="myConfirmDialog_frame" style="display: none;">
		<div id="myConfirmDialog">
			<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
			정말로 확인처리 하시겠습니까?
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
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	conditionalSearch('${param.pg}');
		
	function conditionalSearch(pg){	
		
		
		$('.deliveryControll ul > li:gt(1)').remove();
				
		if($('[name="startDate"]').val()=='') setThisMonth();
		
		$.ajax({				
			type: 'POST',
			url:'/finalProject/admin/getRefundList.do',
			data:{'startDate' : $("[name='startDate']").val(),
				'endDate' : $("[name='endDate']").val(),
				'status' : $('#status').val(),
				'pg' : pg},
			dataType: 'json',
			success: function(data){
			  	$.each(data.mapList, function(index,item){		  	
			  		var startDate= new Date(item.STARTDATE);
			  		var endDate = new Date(item.ENDDATE);
			  		/* $('li:has(.delivery_item)').remove(); */
			  		
			  		$('.deliveryControll ul').append($('<li/>')
					.append($('<div/>',{
					  			class: 'delivery_item'	
					  		}).append($('<div/>',{	  				  			
					  		}).append($('<input/>',{
					  		type:'checkbox',
					  		class: 'check',
					  		value : item.SERIAL
					  		}))).append($('<div/>',{
					  			id : 'itemSerial',
					  			text: item.SERIAL	  					  			
					  		})).append($('<div/>',{
					  			text: item.TITLE
					  		})).append($('<div/>',{
					  			text: jsonDateFormat(startDate)  			
					  		})).append($('<div/>',{
					  			text: item.STATUS		  			
					  		})).append($('<div/>',{
					  			text: '-',
					  			class : 'endDate'
					  		})).append($('<div/>',{
					  			text: '상품교환'		  			
					  		})).append($('<div/>',{}).append($('<input/>',{
					  			type: 'button',
					  			class: 'btn_white',
					  			value: '완료'		  			
					  		})))));
			  		
			  			if(item.STATUS=='처리완료'){
			  				$('.btn_white').prop("disabled",true);
			  				$('.endDate').text(jsonDateFormat(endDate));
			  			}
					});
			  	$('#deliveryControllPaging').html(data.paging.pagingHTML);
			}			
		});
	}

	//체크 박스
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop('checked')){
			$('.delivery_item').each(function(index,item){
				 if($(this).children().eq(4).text()=='진행중'){
					 $(this).children().eq(0).children().eq(0).prop('checked', true); 	
				}else if($(this).children().eq(4).text()=='처리완료'){
					$('#dialog > div').text('선택한 항목이 없습니다.');
					$('#dialog_frame').show();
					
				}
			});
		}else {

			$('.delivery_item').each(function(index,item){
			$(this).children().eq(0).children().eq(0).prop('checked', false);

			});
			
		}
	});
			
	var checkRefund;//체크된 확인버튼의 this객체 담음.
	
	$('.deliveryControll').on('click','.delivery_item input[class=btn_white]',function(){			
					checkRefund = $(this);
					$('#myConfirmDialog_frame').show();										
					checkRefund.prop("disabled",true);
					if(checkRefund.parent().parent().children().eq(4).text()=='진행중'){
						var itemSerial = checkRefund.parent().parent().children().eq(1).text()
						$.ajax({ 
							 type: 'POST',
							url:'/finalProject/admin/changeRefundInfo.do',
							data:{'itemSerial' : itemSerial},
							dataType: 'json',
							success: function(data){
									conditionalSearch($('#currentPaging').text());		
							}
						 });	 
					}
	});	
	
	
/* $('#myConfirmDialog_okBtn').click(function() {}); */
	
	//체크된 것 전체 확인 처리
	
	$('.CompletedBtn').click(function(){
		if($('.check:checked').length==0){
			$('#dialog > div').text('선택한 항목이 없습니다.');
			$('#dialog_frame').show();
		}else{
			var datalist =[];
			$('.check:checked').each(function(index){
				datalist.push($(this).val());				
			});
			
			$.ajax({
					type:'POST',
					url: '/finalProject/admin/changeAllRefundInfo.do',
					data: {'check':datalist},
					dataType: 'json',
					success: function(data){
						conditionalSearch($('#currentPaging').text());
						
					}								
			});
		}			
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
	
	//주문 리스트 클릭시
	$('.deliveryControll').on('click','.delivery_item > *:not(:has(input))',function(){
			if($(this).parent().next().prop('tagName')=='SECTION') {
				$('#delivery_item_detail').hide();
				$('.deliveryControll').append($('#delivery_item_detail'));
				
				return false;
			}
			
			$('#delivery_item_detail').hide();
			
			var serial = $(this).parent().children().eq(1).text();
						
			$.ajax({
				type: 'POST',
				url: '/finalProject/admin/getRefundDetail.do',
				data: {'serial' :serial},
				dataType: 'json',
				success: function(data) {					
					$('#delivery_item_detail .items .item *').remove();
					
					$.each(data.list, function(index,item){
						var date = new Date(item.LOGTIME);	
					$('#delivery_item_detail > .stepbox span:eq(0)').text(jsonDateFormat(date));
					$('#delivery_item_detail > .stepbox span:eq(1)').text(item.SERIAL);
						
						$('#delivery_item_detail .items').append($('<div/>',{
							class: 'item'
						}).append($('<div/>',{
							class:'item_image'
						}).append($('<img/>',{
							src:"../image/"+item.MAIN_CODENAME+"/"+item.IMG
						}))).append($('<div/>',{
							class: 'item_info'						
						}).append($('<div/>',{
							class:'item_name',
							text:item.NAME
						})).append($('<div/>',{
							class:'item_size',
							text:'[COLOR]'+item.COLOR+ '[SIZE]'+item.SIZE1+item.SIZE2
						}))));		
					});
				}
			});
			
			
			$.ajax({
				type: 'POST',
				url: '/finalProject/admin/getRefundInfo.do',
				data: {'serial' :serial},
				dataType: 'json',
				success: function(data1) {
					$('#delivery_item_detail .refund_reason *').remove();
					
					$.each(data1.mapList1, function(index1,item1){
						$('#delivery_item_detail .refund_reason').append($('<div/>',{
								text: '사유 :' 
						}).append($('<span/>',{
							text: item1.TITLE
						}))).append($('<div/>',{}).append($('<img/>',{
							 src: "../image/refund/"+item1.IMG
						}))).append($('<div/>',{}).append($('<pre/>',{
							text: item1.CONTENT
						})));
					});
				}
			});
			
				$(this).parent().parent().append($('#delivery_item_detail'));
				$('#delivery_item_detail').slideToggle();
	});
	
	
	
	//검색 버튼 클릭시
		$('.searchBtn').click(function(){	
				if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()=='') {
					$('#myConfirmDialog_frame').show();
				}else if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()!='')
					$('[name="startDate"]').val($('[name="endDate"]').val());
				else if($('[name="startDate"]').val()!='' && $('[name="endDate"]').val()=='')
					$('[name="endDate"]').val($('[name="startDate"]').val());
				
				conditionalSearch(1);
		});
	
		$('#myConfirmDialog_okBtn').click(function() {
			
			$('#myConfirmDialog_frame').hide();
			/* conditionalSearch($('#currentPaging').text()); */
			return true;	
		});
		
	//페이지 클릭
	$('#deliveryControllPaging').on('click','span',function(){
		var pg = $(this).text()
		conditionalSearch(pg);
	});
	
	
	//json Date to YYYY-MM-DD
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	//요번달 계산
	function setThisMonth() {
		var now = new Date();
		var startDate = new Date(now.getYear()+1900, now.getMonth(), 1);
		var endDate = new Date(now.getYear()+1900, now.getMonth()+1, 0);
		
		$("[name='startDate']").val(jsonDateFormat(startDate));
		$("[name='endDate']").val(jsonDateFormat(endDate));
	}
	
	$("[name='startDate']").change(function(){
		if($("[name='endDate']").val()=='')
			$("[name='endDate']").val($("[name='startDate']").val());
	});
	$("[name='endDate']").change(function(){
		if($("[name='startDate']").val()=='')
			$("[name='startDate']").val($("[name='endDate']").val());
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	}); 
	
	
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
	


});
</script>
</html>