<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
h3.title {padding: 10px 0px;border-bottom: 4px solid black;margin-bottom: 0px;font-size: 24px;font-weight: 700;}
.tblarea1 {width: 100%;padding-top: 10px;padding-bottom: 10px;margin: 0 auto; border-bottom: 2px solid #333;position: relative;}
.tblarea1 th {padding: 0px; padding: 10px 0px;}
.tblarea1 th:last-child {border-right: 0px;}
.selectBx1 select {float: left;width: 160px;padding: .8em .5em;font-family: inherit;background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;border: 1px solid #999;border-radius: 0px;-webkit-appearance: none;}
.selectBx2 select{float: left;width: 160px;padding: .8em .5em;font-family: inherit;background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;border: 1px solid #999;border-radius: 0px;-webkit-appearance: none;}
.searchBx img{float:right;}
.searchBx input{border:none;}
input:focus{outline:none;height:30px;}
.searchBx {width: 300px;margin: 0 auto;border-bottom: 2px solid #000;position: relative;float: right;}
.searchBx {margin-right: 0px;    float: right;}
.searchDate{margin-left: 10%;float: left;}
.searchDate input{width: 150px; height:42px; padding: .8em .5em; font-family: inherit; border: 1px solid #999; }
.tblarea2 {width: 100%;padding-top: 5px;margin: 0 auto;border-bottom: 1px solid #333;position: relative;}
.tblarea2 th {text-align: center; padding: 5px 10px;border-bottom: 1px solid #333;border-right: 1px solid #333;}
.tblarea2 td {padding: 10px 10px;text-align: center;border-bottom: 1px solid #d4d4d4;}
.tblarea2 th:last-child {border-right: 0px;}
.total input{border:none;padding: 0px;height: 28px;}
.total{margin-right : 50px;padding: 5px 10px; float: right;width: 300px;margin: 0 auto;border-bottom: 2px solid #333;position: relative;float: right;}
.btn_black{width:150px; padding: .8em .5em; border: 1px solid #303033; background: #303033; font-size: 13px; color: #fff; line-height: 20px;}
ul{list-style:none; padding-left:0px;}
table {border-collapse: collapse;}
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
#currentPaging{
	border-bottom: 1.5px solid #000;
	cursor: pointer;
	font-weight: 700;
	color: #000;
	text-decoration: none;
	padding: 1px;
	margin: 10px;
}
#paging{
	text-decoration: none;
	cursor: pointer;
	color: #bcafaf;
	text-decoration: none;
	padding: 1px;
	margin: 10px;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//주문 리스트 불러오기
	conditionalSearch('${param.pg}');
	
	$.ajax({
		type : 'GET',
		url : '/finalProject/admin/checkMain_codename.do',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){				
				$('.selectBx1 > select').append($('<option/>',{
					value : item,
					text : item
				}))
			});
		}
	});
	$('.selectBx1 select').change(function(){
		$.ajax({
			type : 'GET',
			url : '/finalProject/admin/checkSub_codename.do',
			data : {'main_codename' : $(this).val() }, 
			dataType : 'json',
			success : function(data){
				$('#status2 > option:gt(0)').remove();
				
				$.each(data.list, function(index, item){
					$('.selectBx2 > select').append($('<option/>', {
						value : item,
						text : item
					}))
				});
			}
		});
	});
	//시작날짜 수정시
	$('#startDate').change(function(){
		if($('#endDate').val()=='')
			$('#endDate').val($('#startDate').val());
	});
	$('#endDate').change(function(){
		if($('#startDate').val()=='')
			$('#startDate').val($('#endDate').val());
	});
	//검색버튼 클릭시 
	$('#searchDateBtn').click(function(){
		if($('#startDate').val()=='' && $('#endDate').val()==''){
			$('#myConfirmDialog_frame').show();
			return true;
		}else if($('#startDate').val()=='' && $('#endDate').val()!='')
			$('#startDate').val($('endDate').val());
		else if($('#startDate').val()!='' && $('#endDate').val()=='')
			$('#endDate').val($('#startDate').val());
		
		conditionalSearch(1);
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	$('#myConfirmDialog_okBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
		conditionalSearch(1);
	});
	

	//조건검색
	var totalSum = 0;
	function conditionalSearch(pg){
		
		totalSum = 0;
		if($('#startDate').val()=='') setThisMonth();
		$.ajax({
			type : 'POST',
			url : '/finalProject/admin/SalesList.do',
			data : {'startDate' : $('#startDate').val(),
					'endDate' : $('#endDate').val(),
					'status1' : $('#status1').val(),
				    'status2' : $('#status2').val(),
				    'pg' : pg},
			dataType : 'json',
			success : function(data){
				$('#tblarea2 tbody *').remove();
				
				$.each(data.list, function(index, item){
					var sum = (item.PRICE * item.COUNT);
					$('<tr/>').append($('<td/>', {
						text : item.MAIN_CODENAME
					})).append($('<td/>', {
						text : item.SUB_CODENAME
					})).append($('<td/>', {
						text : item.NAME
					})).append($('<td/>', {
						text : item.COUNT
					})).append($('<td/>', {
						text : item.PRICE.toLocaleString()
					})).append($('<td/>', {
						text : sum.toLocaleString()+"원"
					})).appendTo($('#tblarea2 tbody'));
					totalSum += sum;
				});
				$('#totalSum').val(totalSum.toLocaleString());
				//페이징
				$('#SalesMgmtPaging').html(data.paging.pagingHTML);
			}
		});
	}
	
	function jsonDateFormat(date){
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	function setThisMonth(){
		var now = new Date;
		var startDate = new Date(now.getYear()+1900, now.getMonth(), 1);
		var endDate = new Date(now.getYear()+1900, now.getMonth()+1, 0);
		$('#startDate').val(jsonDateFormat(startDate));
		$('#endDate').val(jsonDateFormat(endDate));
	}
	
	//페이지 클릭
	$('#SalesMgmtPaging').on('click', 'span', function(){
		var pg = $(this).prop('class');
		if($('#searchText').val()=='')
			conditionalSearch(pg);
		else
			search(pg);
	});
	
	//이미지 클릭 이벤트
	$('#searchImg').click(function(){
		search(1);
	});
	
	function search(pg){
		$.ajax({
			type : 'POST',
			url : '/finalProject/admin/searchText.do',
			data : 'text='+$('#searchText').val()+'&pg='+pg,
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				totalSum = 0;
				$('#tblarea2 tbody *').remove();
				
				$.each(data.list, function(index, item){
					var sum = (item.PRICE * item.COUNT);
					totalSum += sum;
					$('<tr/>').append($('<td/>', {
						text : item.MAIN_CODENAME
					})).append($('<td/>', {
						text : item.SUB_CODENAME
					})).append($('<td/>', {
						text : item.NAME
					})).append($('<td/>', {
						text : item.COUNT
					})).append($('<td/>', {
						text : item.PRICE.toLocaleString()
					})).append($('<td/>', {
						text : (item.PRICE * item.COUNT).toLocaleString()+"원"
					})).appendTo($('#tblarea2 tbody'));
					
				});
				$('#totalSum').val(totalSum.toLocaleString());
				//페이징
				$('#SalesMgmtPaging').html(data.paging.pagingHTML);
			},
			error : function(data) {
				alert("error : "+data);
			}
		});
	}
});
</script>

<h3 class="title">매출 관리</h3>
<div>
	<table class="tblarea1" id="tblarea1">
		<tr>
			<th style="width: 80px; padding-left: 2%; padding-right: 20px;">
				<div class="selectBx1">
					<select id="status1">
						<option value="">Main</option>
					</select>
				</div>
			</th>
			<th style="width: 80px;">
				<div class="selectBx2">
					<select id="status2">
						<option value="">SubMain</option>
					</select>
				</div>
			</th>
			<th>
				<div class="searchDate">
						<i class="material-icons">date_range</i>
						<input class="Date" type="date" id="startDate"> ~ <input class="Date" type="date" id="endDate">
						<input type="button" value="검색" class="btn_black" id="searchDateBtn">
				</div>
				<div class="searchBx">
					<input type="text" size="20" id="searchText" style="width: 80%; height: 32px;"><a id="searchImg" href="javascript:void(0)"><img src="../image/search.jpg"></a>
				</div>
				
			</th>	
		</tr>
	</table>
</div>

<div>
	<table class="tblarea2" id="tblarea2">
		<thead>
			<tr>
				<th width="10%">         
	               	메인	              
	            </th>
	            <th width="15%">
	            	서브
	            </th>
	            <th width="30%">
	               	상품명
	            </th>
	            <th width="10%">
	            	수량
	            </th>
	            <th width="15%">
	            	가격
				</th>
	            <th width="15%">
	            	상품 합계
                </th>                        
	        </tr>
	     </thead>
	     <tbody>
	   	 </tbody>
	</table>
</div>

<div class="total">
	총 매출 : <input type="label" id="totalSum" size="10" style="text-align: right; font-size: 13pt; font-weight: bold" >원<br>
</div>
<div id="SalesMgmtPaging" align="center" style="padding: 5px 30%;"></div>
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
		날짜를 입력하지 않았습니다<br>
		기간을 이번달로 설정하시겠습니까?
		<button id="myConfirmDialog_okBtn">확인</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>