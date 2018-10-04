<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/myQnA.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
function myQnAPaging(pg2){
	$('#pg').val(pg2);
	
	onPageLoad();
}

//json Date to YYYY-MM-DD
function jsonDateFormat(date) {
	var year = date.getYear()+1900;
	var month = date.getMonth()+1;
	var day = date.getDate();
	return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
}
</script>

<script type="text/javascript">

$(document).ready(function(){
	
	onPageLoad();
	
	//생겼다,사라졌다
	$('body').on('click','.qa_click',function(){
		if($(this).parent().next().css('display')=='none'){
			$(this).parent().next().slideDown();
		}else {
			$(this).parent().next().slideUp();
		}
	});
});

function onPageLoad(){
	$('div#myQnATable div.info').siblings().remove();
	
	$.ajax({
		type : 'POST',
		url : '/finalProject/customerService/getMyQnA.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index,item){
				var date = new Date(item.LOGTIME);
				
				$('<div/>',{
					class : 'info2'
				}).append($('<p/>',{
					text : item.NAME,
					class : 'qa_click'
					}).css({
						'padding-left':'25px', 
						width: '150px'
				})).append($('<p/>',{
					text : item.COMMENTS,
					class : 'qa_click'
					}).css({
						'text-align':'left',
						padding: '2% 3% 2% 0',
					    'padding-left': '20px'
				})).append($('<p/>',{
					text : jsonDateFormat(date)
					}).css({
						width:'105px'
				})).append($('<p/>',{
					text : item.REPLY==null ? "NO" : "YES",
					class: "qa_status"
					}).css({
						width:'60px',
					    'font-weight': '700',
				    	'font-size': '18px',
				    	'text-align': 'center'
				})).append($('<p/>')
					.css({
						width:'50px'	
				}).append($('<button/>',{
					type : 'button',
					class : "qa_btn",
					text : "삭제",
					value : item.SEQ
					}))).appendTo($('#myQnATable'));
				
				$('<div/>',{
					class : 'wrap_info34'
				}).append($('<div/>',{
					class : 'info3'
				}).append($('<span/>',{
					text : 'Q.',
					class : 'styleQA'
				})).append($('<p/>',{
					id : 'p_conetent',
					text : item.COMMENTS
				}))).append($('<div/>',{
					class : 'info4'
				}).append($('<span/>',{
					text : 'A.',
					class : 'styleQA'
				})).append($('<p/>',{
					id : 'p_answer',
					text : item.REPLY
				}))).appendTo($('#myQnATable'));
				
			});
			
			
			$('#myQnAPagingDiv').html(data.paging.pagingHTML);
			
		}
	});
	
	//삭제버튼클릭시, 
	$('body').on('click','.qa_btn',function(){
		$('#myQnADelete_frame').show();
		$('#myQnADelete_frame').val($(this).val());
	});
	
	$('#myQnADelete_closeBtn, #myQnADelete_cancelBtn').click(function(){
		$('#myQnADelete_frame').hide();
	});
	
	$(document).on('click','#dialog_closeBtn',function(){
		$(this).parent().parent().hide();	
		location.href="/finalProject/customerService/myQnA.do";
	});
	
	$('#myQnADelete_okBtn').click(function(){
		$('#myQnADelete_frame').hide();
		
		$.ajax({
			type : 'POST',
			url : '/finalProject/customerService/deleteQnA.do',
			data : "seq="+$('#myQnADelete_frame').val(),
			dataType : 'text',
			success : function(response){
				if(response=="success"){
					$('#deleteQnA_frame').show();
				}
			}
		});
		
	});	
	
}

</script>


</head>
<body>


<div class="wrap" style="padding: 0 50px 100px;">

	<div><h3 class="h_tit">상품 Q&amp;A 내역</h3></div>
	<br>
	<div id="myQnATable">
		<div class="info">
			<p class="inform" style="padding-left:30px; width: 170px;">상품정보</p>
			<p class="content" style="text-align:left; padding: 15px 3% 15px 0;">문의내용</p>
			<p class="date" style="text-align:right; padding-right:51px;">작성일</p>
			<p class="state" style="width: 120px; padding-left: 20px;">답변유무</p>
		</div>
	</div>
	
	<div id="myQnAPagingDiv" style="float: left; width: 100%;" align="center"></div>
</div>
</body>

<div id="myQnADelete_frame" style="display: none;">
	<div id="myQnADelete">
		<i class="material-icons" id="myQnADelete_closeBtn">clear</i>
		문의글을 삭제하시겠습니까?
		<button id="myQnADelete_okBtn">확인</button>
		<button id="myQnADelete_cancelBtn">취소</button>
	</div>
</div>

<div id="deleteQnA_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		문의글이 삭제되었습니다.
	</div>		
</div>	

<input type="hidden" value="1" id="pg">
</html>










