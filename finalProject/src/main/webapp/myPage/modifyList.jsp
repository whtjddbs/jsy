<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
.modifyList_header {overflow:hidden; height: auto; padding-bottom:10px; border-bottom: 4px solid black;}
.modifyList h3 {float: left; margin: 0px;}
.modifyList_tab {
	float: right;
	overflow: hidden;
	height: auto;
}
.modifyList_tab ul {margin: 0px;}
.modifyList_tab ul li{
	list-style: none;
	display: list-item;
	float: left;
	padding: 2px 20px;
	font-size: 13px;
	vertical-align: bottom;
	color: #5d5d5d;
	cursor: pointer;
}
.modifyList_tab ul li:nth-child(1)~li {border-left: 1px solid #d4d4d4;}
.modifyList_tab ul li.active {
	color: black;
	font-weight: 700;
}
.modifyList_table {width: 100%; border-collapse: collapse;}
.modifyList_table thead td {text-align: center; border-bottom: 1px solid black; padding: 10px 0px;}
.modifyList_table tbody td {padding: 10px 0px; text-align: center; font-weight: 700; border-bottom: 1px solid #d4d4d4;}
.modifyList_table tbody td:nth-child(2) {text-align: left; font-weight: 300;}
.modifyList_table tbody td a {cursor: pointer; text-decoration: none; color: black;}

.modifyListContent{
	background-color : #EAEAEA;
	width: 100%;
	margin : 0px;
	text-align: center;
	display: none;
}
</style>

<section class="modifyList">
	<input type="hidden" name="pg" id="pg" value="1">
	<div class="modifyList_header">
		<h3>취소/교환/반품 내역</h3>
		<div class="modifyList_tab">
			<ul>
				<li class="active">ALL</li>
				<li class="modifyList_orderType">주문취소</li>
				<li class="modifyList_orderType">상품교환</li>
				<li class="modifyList_orderType">반품접수</li>
			</ul>
		</div>
	</div>
	<table class="modifyList_table">
		<thead>
			<tr>
				<td width="11%">CS처리구분</td>
				<td width="20%" style="font-weight: 800;">주문번호</td>
				<td width="30%" style="font-weight: 800;">접수제목</td>
				<td width="14%">접수일자</td>
				<td width="9%">진행상태</td>
				<td width="14%">완료일자</td>
			</tr>
		</thead>
	</table>
	<div class="modifyList_container">
		<div class="viewModifyList">
			<!--여기에 내용을 뿌릴거야~   -->
		</div>
		<div align=center id="modifyListPagingDiv" style="padding-top: 20px;"></div>
	</div>
</section>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$('.my_shop > ul:eq(0) > li:eq(1) > a').css('font-weight', '800');
	
	modifyList_All(1); 
	
	$('.modifyList_tab li').click(function(){
		$('.modifyList_tab li').removeClass('active');
		$(this).addClass('active');
	});
	
	$('.active').click(function(){ //ALL 다시 띄우기 
		modifyList_All(1);
	});
	
	function modifyList_All(pg){
		//All
		$.ajax({
			type:'POST',
			url : '/finalProject/myPage/viewModifyList.do',
			data : 'pg='+pg,
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('.viewModifyList *').remove();
				$.each(data.list, function(index, item){
					$('.viewModifyList').append($('<div/>',{
						id : 'modifyListID',
						style: "border-bottom: 1px solid lightgray; padding: 10px 0; height: auto; overflow: hidden;"
					}).append($('<span/>',{
						id : 'modifyListType',
						style : 'width: 11% display: table-cell; min-width: 100px; float: left; padding-left: 3%;',
						html : item.type
					})).append($('<span/>',{
						style : 'width: 20%; display: table-cell; min-width: 100px; float: left; padding-left: 11%;',
						html : item.serial
					})).append($('<span/>',{					
						style : 'width: 30%; display: table-cell; float: left; cursor: pointer; padding-left: 16%;',
						html : item.title
					})).append($('<span/>',{
						style : 'display: table-cell; float: left; padding-left: 10%;',
						html : item.startDate
					})).append($('<span/>',{
						style : 'display: table-cell; float: left; padding-left: 7%;',
						html : item.status
					})).append($('<span/>',{
						style : 'width: 14%; display: table-cell; float: left; padding-left: 10%;', /* float: left; */
						html : item.endDate==null? '-' : item.endDate
					}))).append($('<div/>',{
						class: 'modifyListContent',
						html : item.content
					}));
				});
				$('#modifyListPagingDiv').html(data.refundRequestPaging.pagingHTML);
			}//success
		});
	}
	
	
	
	$('body').on('click','#modifyListID',function(){
		$(this).next().slideToggle();
	});
	
	//페이지클릭
	$('#modifyListPagingDiv').on('click','span',function(){
		var pg=$(this).prop('class');
		var type = $('.active').text();
		
		if(type=='ALL') {			
			modifyList_All(pg);
		} else {
			vieworderType(type,pg);
		}
	});
	
	$(".modifyList_orderType").click(function(){
		var type = $(this).text();
		//alert(type);
		vieworderType(type,1);
	});
	
	//type에 따라서 띄우는 함수
	function vieworderType(type, pg){
		$.ajax({
			type:'POST',
			url : '/finalProject/myPage/viewModifyList_orderType.do',
			data : 'type='+type+'&pg='+pg,
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('.viewModifyList *').remove();
				$.each(data.list, function(index, item){
					$('.viewModifyList').append($('<div/>',{
						id : 'modifyListID',
						style: "border-bottom: 1px solid lightgray; padding: 10px 0; height: auto; overflow: hidden;"
					}).append($('<span/>',{
						style : 'width: 11% display: table-cell; min-width: 100px; float: left; padding-left: 3%;',
						html : item.type
					})).append($('<span/>',{
						style : 'width: 20%; display: table-cell; min-width: 100px; float: left; padding-left: 11%;',
						html : item.serial
					})).append($('<span/>',{					
						style : 'width: 30%; display: table-cell; float: left; cursor: pointer; padding-left: 16%;',
						html : item.title
					})).append($('<span/>',{
						style : 'display: table-cell; float: left; padding-left: 10%;',
						html : item.startDate
					})).append($('<span/>',{
						style : 'display: table-cell; float: left; padding-left: 7%;',
						html : item.status
					})).append($('<span/>',{
						style : 'width: 14%; display: table-cell; float: left; padding-left: 10%;', /* float: left; */ 
						html : item.endDate==null? '-' : item.endDate
					}))).append($('<div/>',{
						class: 'modifyListContent',
						html : item.content
					}));
				});
				$('#modifyListPagingDiv').html(data.refundRequestPaging.pagingHTML);
			}//success
		});
}

});
</script>
